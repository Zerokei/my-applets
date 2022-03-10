#include<bits/stdc++.h>
using namespace std;

typedef pair<int,int> PII;
/*
Dictionary Tree achieved by Tire
*/
class Tire{
private:
    struct node{
        node(){p = 0; memset(son, 0, sizeof son);}
        long long p;
        struct node* son[26];
    };
    node* root; // the root of tire tree
public:
    /*
        Init the Tire Tree
    */
    void init(){
        root = new node;
    }
    /*
        Insert word into the Tire Tree
    */
    void insert(string str, int num){
        node* pos = root;
        for(auto it=str.begin(); it!=str.end(); ++it){// insert word letter by letter
            int c = *it-'a';
            if(pos->son[c] == NULL){
                pos->son[c] = new node;
            }
            pos = pos->son[c];
        }
        pos->p |= (1ll<<num); // use bit to record the file
    }

    /*
        Query the word in the Tire tree
        return with the inversed index
    */
    long long query(string str){
        node* pos = root;
        for(auto it=str.begin(); it!=str.end(); ++it){
            int c = *it-'a';
            if(pos->son[c] == NULL){
                return 0;
            }
            pos = pos->son[c];
        }
        return pos->p;
    }
};

Tire Tire_tree;

/*
process the words, ignore digitals, dots...
*/
void filter(string &str){
    auto it = str.begin();
    while (it != str.end()) {
        if (!isupper(*it) && !islower(*it)) {
            it = str.erase(it);
            continue;
        } else if(isupper(*it)){ // modify upper word to lower word
            (*it) += 32;
        }
        ++it;
    }
}

/*
handling the stop words
*/


set<string>ban;
/*
    here are several words to treat as stop words
*/
void handling_stop_words_init(){
    ban.insert("in");    
    ban.insert("on");    
    ban.insert("at");    
    ban.insert("i");
    ban.insert("be");
    ban.insert("of");    
    ban.insert("the");    
    ban.insert("a");    
    ban.insert("an");    
    ban.insert("to");    
    ban.insert("of");    
    ban.insert("or");    
    ban.insert("and");    
    ban.insert("will");   
    ban.insert("so");
    ban.insert("we");
    ban.insert("you");
    ban.insert("is");
    ban.insert("are");
    ban.insert("be");
    ban.insert("not");
}
/*
    judge whether the word is a stop word
*/
bool handling_stop_words(string str){
    return ban.find(str) != ban.end();
}

/*
process the buffer
*/
struct buffer{
    int count; // the count of attached words
    string str; // the attached words
    void insert(string str_new){ // add str_new to the tail of str
        count++;
        str += str_new;
    }
    void clear(){ // clear count and word
        count = 0;
        str = "";
    }
    bool too_long(){ // judge if the word is too long
        return str.length() > 14;
    }
    bool enough_count(){ // judge if the count of word is enough to store
        return count >= 2;
    }
}buf;

#define NOP "noooooooop" // define empty word as nooooooooop
string buffer_process(string str_new){
    if(handling_stop_words(str_new)){
        buf.insert(str_new);
        if(buf.too_long()){ // attached word is too long
            buf.clear();
            return NOP;
        }else if(buf.enough_count()){ // enough count of ignore words
            return buf.str;
        }
    }
    else {
        buf.clear();
        return str_new;
    }
    return NOP;
}

/*
    modify filename the make us access the website easily
*/
void modify_filename(string& str){
    str.erase(0,3);
    replace(str.begin(),str.end(),'+','/');
    str = "http://" + str;
}

int main(){

    // Init Tire Tree and stop words engine
    Tire_tree.init();
    handling_stop_words_init();

    // Create
    string filename[40];
    int file_count = 0;

    // read the works' name list
    ifstream lists;
    lists.open("list", ios::in);
    // process the works one by one
    while(lists>>filename[file_count]){
        // modify the filename
        filename[file_count] ="dic/"+filename[file_count];
        // read the file
        ifstream file;
        file.open(filename[file_count], ios::in );

        // read the words
        string str;
        while(file>>str){
            // process the words
            filter(str);
            // put the words into buffer
            string element = buffer_process(str);
            // insert into the tire tree
            if(element != NOP){
                Tire_tree.insert(element, file_count);
            }
        }
        // modify the filename again to make us access the website easily
        modify_filename(filename[file_count]);
        // count the number of works
        file_count++;
        // clost file and clear buffer
        file.close();
        buf.clear();
    }
    lists.close();
    
    // deal with the inquirements
    while(1){  
        cout<<"Please input your query:"<<endl<<"$ ";

        // Input
        string str, word="";
        getline(cin, str);
        // Add a space in the tail to make the processes easier
        str+=' ';
        
        // count the frequency of each works
        PII count[40];
        for(int i = 0; i < file_count; ++i){
            count[i].second = i;
            count[i].first = 0;
        }


        // extract words in the sentence and query the tire-tree with the words
        for(auto it = str.begin(); it != str.end(); ++it){
            if(*it == ' '){
                filter(word);
                string element = buffer_process(word);
                if(element != NOP){
                    long long state = Tire_tree.query(element);
                    for(int i = 0; i < file_count; ++i){
                        if(state & (1ll<<i)){ 
                            // use inversed number to make the most frequent in the head
                            count[i].first--;
                        }
                    }
                }
                word="";
            }else word += *it;
        }

        // sort and choose the most likely works(at most 5)
        sort(count, count+file_count);
        for(int i = 0; i < 5 && count[i].first < 0; ++i){
            cout<<filename[count[i].second]<<endl;
            
        }

        cout<<"**********************"<<endl;
    }
    

    return 0;
}
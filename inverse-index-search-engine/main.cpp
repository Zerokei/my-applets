#include<bits/stdc++.h>
using namespace std;

typedef pair<int,int> PII;
/*
Dictionary Tree
*/
class Tire{
private:
    struct node{
        node(){p = 0; memset(son, 0, sizeof son);}
        long long p;
        struct node* son[26];
    };
    node* root;
    inline int process_word(char x){
        return isupper(x)?x-'A':x-'a';
    }
public:
    void init(){
        root = new node;
    }
    void insert(string str, int num){
        node* pos = root;
        for(auto it=str.begin(); it!=str.end(); ++it){
            int c = process_word(*it);
            if(pos->son[c] == NULL){
                pos->son[c] = new node;
            }
            pos = pos->son[c];
        }
        pos->p |= (1ll<<num);
        // cout<<str<<" "<<num<<endl;
    }
    long long query(string str){
        node* pos = root;
        for(auto it=str.begin(); it!=str.end(); ++it){
            int c = process_word(*it);
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
        } else if(isupper(*it)){
            (*it) += 32;
        }
        ++it;
    }
}

/*
handling the stop words
*/


set<string>ban;
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
bool handling_stop_words(string str){
    return ban.find(str) != ban.end();
}


/*
process the buffer
*/
struct buffer{
    int count;
    string str;
    void insert(string str_new){
        count++;
        str += str_new;
    }
    void clear(){
        count = 0;
        str = "";
    }
    bool too_long(){
        return str.length() > 14;
    }
    bool enough_count(){
        return count >= 2;
    }
}buf;
#define NOP "noooooooop"
string buffer_process(string str_new){
    if(handling_stop_words(str_new)){
        buf.insert(str_new);
        if(buf.too_long()){ // enough words are too long
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

void modify_filename(string& str){
    str.erase(0,3);
    replace(str.begin(),str.end(),'+','/');
    str = "http://" + str;
}

int main(){

    Tire_tree.init();
    handling_stop_words_init();

    string filename[40];
    int file_count = 0;
    ifstream lists;
    lists.open("list", ios::in);
    while(lists>>filename[file_count]){
        filename[file_count] ="dic/"+filename[file_count];
        ifstream file;
        file.open(filename[file_count], ios::in );
        string str;
        while(file>>str){
            filter(str);
            string element = buffer_process(str);
            if(element != NOP){
                Tire_tree.insert(element, file_count);
            }
        }
        modify_filename(filename[file_count]);
        file_count++;
        file.close();
        buf.clear();
    }
    lists.close();
    
    while(1){  
        cout<<"Please input your query:"<<endl<<"$ ";
        string str, word="";
        getline(cin, str);
        str+=' ';
        
        PII count[40];
        for(int i = 0; i < file_count; ++i){
            count[i].second = i;
            count[i].first = 0;
        }
        for(auto it = str.begin(); it != str.end(); ++it){
            if(*it == ' '){
                filter(word);
                string element = buffer_process(word);
                word="";
                if(element != NOP){
                    long long state = Tire_tree.query(element);
                    for(int i = 0; i < file_count; ++i){
                        if(state & (1ll<<i)){
                            count[i].first--;
                        }
                    }
                }
            }else word += *it;
        }

        sort(count, count+file_count);
        for(int i = 0; i < 5 && count[i].first < 0; ++i){
            cout<<filename[count[i].second]<<endl;
            
        }
        cout<<"**********************"<<endl;
    }
    

    return 0;
}
#include<stdio.h>
#include<string.h>

int Wire[26];
char reflector[]="YRUHQSLDPXNGOKMIEBFZCWVJAT"; 
char rotor_table[5][27] = 
{
	"EKMFLGDQVZNTOWYHXUSPAIBRCJ",
	"AJDKSIRUXBLHWTMCQGZNPYFVOE",
	"BDFHJLCPRTXVZNYEIWGAKMUSQO",
	"ESOVPZJAYQUIRHXLNFTGKDCMWB",
	"VZBRGITYUPSDNHLXAWMJQOFECK"
};
char rotor_rever[5][27];
char step_char[5]="RFWKA"; // Royal Flags Wave Kings Above
char step_char_before[5]="QEVJZ";

void step(int *a){
	*a = (*a+1)%26;
}
void step_n(int *a, int n){
	*a = (*a+26+n)%26;
}
void step_3(int *c, int id1, int *b, int id2, int*a, int id3){
	step(a);
	if(*a == step_char[id3]-'A'){
		step(b);
		if(*b == step_char[id2]-'A'){
			step(c);
		}
	}else if(*b == step_char_before[id2]-'A'){
		step(b);
		step(c);
	}
}

char text[505];
char words[25];
char processed_text[505];
char RingSetting[4];

int delta(int MessageKey, int RingSetting_index){
	return MessageKey+'A' - RingSetting[RingSetting_index];
}

int check(int id1, int id2, int id3, int i, int j, int k){
	int c;
	for(c = 0; c < strlen(text); ++c){
		step_3(&i, id1, &j, id2, &k, id3);
		int s = text[c]-'A';
		s = Wire[s];

		step_n(&s, delta(k, 2));
		s = rotor_table[id3][s];
		step_n(&s, -delta(k, 2));

		step_n(&s, delta(j, 1));
		s = rotor_table[id2][s];
		step_n(&s, -delta(j, 1));

		step_n(&s, delta(i, 0));
		s = rotor_table[id1][s];
		step_n(&s, -delta(i, 0));

		s = reflector[s]-'A';

		step_n(&s, delta(i, 0));
		s = rotor_rever[id1][s];
		step_n(&s, -delta(i, 0));

		step_n(&s, delta(j, 1));
		s = rotor_rever[id2][s];
		step_n(&s, -delta(j, 1));

		step_n(&s, delta(k, 2));
		s = rotor_rever[id3][s];
		step_n(&s, -delta(k, 2));

		s = Wire[s];
		processed_text[c] = s+'A';
	}
	for(c = 0; c <= strlen(text)-strlen(words); ++c){
		int r;
		for(r = 0; r < strlen(words); ++r){
			if(processed_text[c+r] != words[r])
				break;
		}
		if(r == strlen(words)) return 1;
	}
	return 0;
}

int main(){
	int i, j, k;
	for(i = 0; i < 5; ++i){
		for(j = 0; j < 26; ++j){
			rotor_table[i][j] -= 'A';
			rotor_rever[i][rotor_table[i][j]] = j;
		}
	}

	for(i = 0; i < 26; ++i) Wire[i] = i;
	for(i = 0; i < 10; ++i){
		char c[4];
		scanf("%s", c);
		Wire[c[0]-'A'] = c[1]-'A';
		Wire[c[1]-'A'] = c[0]-'A';
	}
	scanf("%s", RingSetting);
	scanf("%s", text);
	scanf("%s", words);

	int id1, id2, id3;
	scanf("%d", &id1);
	id1--;
	for(id2 = 0; id2 < 5; id2 ++) if(id2 != id1){
		for(id3 = 0; id3 < 5; id3++) if(id1 != id3 && id2 != id3){
			for(i = 0; i < 26; ++i){
				for(j = 0; j < 26; ++j){
					for(k = 0; k < 26; ++k){
						if(check(id1, id2, id3, i, j, k)){
							printf("MessageKey=%c%c%c\n", i+'A', j+'A', k+'A');
							printf("PlainText=%s\n", processed_text);
							printf("RotorNum=%d%d%d\n", id1+1, id2+1, id3+1);
							return 0;
						}
					}
				}
			}
		}
	}
	return 0;
}
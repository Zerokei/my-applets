#include <ctime>
#include <iostream>
#include <cassert>

#define size 2e8
#define mask 1024

int fun(){
    long long *a = new long long(mask);
    long long *b = new long long(mask);
    long long *c = new long long(mask);
    long long *d = new long long(mask);
    long long *e = new long long(mask);
    long long *f = new long long(mask);
    long long *g = new long long(mask);
    long long *h = new long long(mask);

    long long i = size;
    while(i--){
        int id = (int)i & 15;
        // std::cout<<id<<std::endl;
        if(id<0){
            std::cout<<id<<std::endl;
            return 0;
        }
        // assert(id>=0 && id < mask);
        a[id] = i;
        b[id] = i;
        c[id] = i;
        d[id] = i;
        e[id] = i;
        f[id] = i;
        g[id] = i;
        h[id] = i;
    }
    return clock();
}

int main(){
    
    int start = clock();
    std::cout<<1.0*(fun()-start)/CLOCKS_PER_SEC;
    return 0;
}
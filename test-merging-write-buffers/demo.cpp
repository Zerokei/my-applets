#include<bits/stdc++.h>
using namespace std;

#define size 2e9
#define mask 1023

int fun1(){
    uint64_t *a = new uint64_t[mask+1];
    uint64_t *b = new uint64_t[mask+1];
    uint64_t *c = new uint64_t[mask+1];
    uint64_t *d = new uint64_t[mask+1];
    uint64_t *e = new uint64_t[mask+1];
    uint64_t *f = new uint64_t[mask+1];
    uint64_t *g = new uint64_t[mask+1];
    uint64_t *h = new uint64_t[mask+1];

    uint64_t i = size;
    int id;
    while(i--){
        id = (int)i & mask;
        a[id] = i;
        b[id] = i;
        c[id] = i;
        d[id] = i;
        e[id] = i;
        f[id] = i;
        g[id] = i;
        h[id] = i;
    }
    delete [] a;
    delete [] b;
    delete [] c;
    delete [] d;
    delete [] e;
    delete [] f;
    delete [] g;
    delete [] h;
    return clock();
}

int fun2(){
    
    uint64_t *a = new uint64_t[mask+1];
    uint64_t *b = new uint64_t[mask+1];
    uint64_t *c = new uint64_t[mask+1];
    uint64_t *d = new uint64_t[mask+1];
    uint64_t *e = new uint64_t[mask+1];
    uint64_t *f = new uint64_t[mask+1];
    uint64_t *g = new uint64_t[mask+1];
    uint64_t *h = new uint64_t[mask+1];

    uint64_t i = size;
    int id;
    while(i--){
        id = (int)i & mask;
        a[id] = i;
        b[id] = i;
        c[id] = i;
        d[id] = i;
    }
    i = size;
    while(i--){
        id = (int)i & mask;
        e[id] = i;
        f[id] = i;
        g[id] = i;
        h[id] = i;
    }

    delete [] a;
    delete [] b;
    delete [] c;
    delete [] d;
    delete [] e;
    delete [] f;
    delete [] g;
    delete [] h;
    return clock();
}


int fun3(){
    
    uint64_t *a = new uint64_t[mask+1];
    uint64_t *b = new uint64_t[mask+1];
    uint64_t *c = new uint64_t[mask+1];
    uint64_t *d = new uint64_t[mask+1];
    uint64_t *e = new uint64_t[mask+1];
    uint64_t *f = new uint64_t[mask+1];
    uint64_t *g = new uint64_t[mask+1];
    uint64_t *h = new uint64_t[mask+1];

    uint64_t i = size;
    int id;
    while(i--){
        id = (int)i & mask;
        a[id] = i;
        b[id] = i;
    }
    i = size;
    while(i--){
        id = (int)i & mask;
        c[id] = i;
        d[id] = i;
    }
    i = size;
    while(i--){
        id = (int)i & mask;
        e[id] = i;
        f[id] = i;
    }
    i = size;
    while(i--){
        id = (int)i & mask;
        g[id] = i;
        h[id] = i;
    }

    delete [] a;
    delete [] b;
    delete [] c;
    delete [] d;
    delete [] e;
    delete [] f;
    delete [] g;
    delete [] h;
    return clock();
}

int fun4(){
    
    uint64_t *a = new uint64_t[mask+1];
    uint64_t *b = new uint64_t[mask+1];
    uint64_t *c = new uint64_t[mask+1];
    uint64_t *d = new uint64_t[mask+1];
    uint64_t *e = new uint64_t[mask+1];
    uint64_t *f = new uint64_t[mask+1];
    uint64_t *g = new uint64_t[mask+1];
    uint64_t *h = new uint64_t[mask+1];

    uint64_t i = size;
    int id;
    while(i--){
        id = (int)i & mask;
        a[id] = i;
        b[id] = i;
        c[id] = i;
        d[id] = i;
        g[id] = i;
        h[id] = i;
    }
    i = size;
    while(i--){
        id = (int)i & mask;
        e[id] = i;
        f[id] = i;
    }

    delete [] a;
    delete [] b;
    delete [] c;
    delete [] d;
    delete [] e;
    delete [] f;
    delete [] g;
    delete [] h;
    return clock();
}

int main(){
    
    int start = clock();
    cout<<"(8)"<<1.0*(fun1()-start)/CLOCKS_PER_SEC<<endl;
    start = clock();
    cout<<"(4+4)"<<1.0*(fun2()-start)/CLOCKS_PER_SEC<<endl;
    start = clock();
    cout<<"(2+2+2+2)"<<1.0*(fun3()-start)/CLOCKS_PER_SEC<<endl;
    start = clock();
    cout<<"(6+2)"<<1.0*(fun4()-start)/CLOCKS_PER_SEC<<endl;
    return 0;
}
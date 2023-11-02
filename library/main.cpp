// #include<iostream>

// using namespace std;
extern "C" __attribute__((visibility("default"))) __attribute__((used)) 
const char* test(){
return "test done";
}
extern "C" __attribute__((visibility("default"))) __attribute__((used))
double add(double x,double y){
    return x+y;
}

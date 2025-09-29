#include <stdio.h>

// 宏定义
#define PI 3.14159
#define SQUARE(x) ((x) * (x))

// 全局变量 (已初始化)
int global_var = 100;
// 全局常量
const float gravity = 9.8;
// 全局变量 (未初始化，应在.bss段)
int uninitialized_global;

// 函数声明
int factorial(int n);

// main函数
int main() {
    int n = 5;
    printf("The factorial of %d is %d\n", n, factorial(n));
    
    float r = 2.0;
    float area = PI * SQUARE(r);
    printf("The area of a circle with radius %.2f is %.2f\n", r, area);
    
    uninitialized_global = global_var + 1;
    printf("Global var: %d, Uninitialized global: %d\n", global_var, uninitialized_global);
    
    return 0;
}

// 函数定义
int factorial(int n) {
    if (n <= 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}
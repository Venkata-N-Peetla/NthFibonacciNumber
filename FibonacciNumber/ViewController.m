//
//  ViewController.m
//  FibonacciNumber
//
//  Created by Venkata Narasimham Peetla on 2/7/18.
//  Copyright © 2018 PEETLA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSUInteger fibOf10 = Fibonacci(10);
    NSLog(@"fib of 10 = %ld", fibOf10);

    NSUInteger fibOf4 = fib(4);
    NSLog(@"fib of 4 = %ld", fibOf4);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Complexity: O(n) time and O(1) space.
NSUInteger Fibonacci (NSUInteger n) {
    //Edge case
    if (n == 0 || n == 1) {
        return n;
    }

    NSUInteger prevPrev = 0;
    NSUInteger prev = 1;
    NSUInteger current = 0;

    for (NSUInteger i = 1; i < n; i++) {
        current = prevPrev + prev;
        prevPrev = prev;
        prev = current;
    }

    return current;
}

//Complexity: O(logn) time and O(1) space.
NSUInteger fib (NSUInteger n) {
    int F[2][2] = {{1,1},{1,0}};
    if (n == 0)
        return 0;
    powerFunc(F, n-1);
    return F[0][0];
}

/* Optimized version of power() in method 4 */
void powerFunc(int F[2][2], NSUInteger n)
{
    NSLog(@"%s %ld", __FUNCTION__, n);

    if( n == 0 || n == 1)
        return;
    int M[2][2] = {{1,1},{1,0}};

    powerFunc(F, n/2);
    multiply(F, F);

    if (n%2 != 0) {
        NSLog(@"PV %s  F[0][0]  =  %d M[0][0]  =  %d", __FUNCTION__, F[0][0], M[0][0]);
        multiply(F, M);
    }
}

void multiply(int F[2][2], int M[2][2])
{
    int x =  F[0][0]*M[0][0] + F[0][1]*M[1][0];
    int y =  F[0][0]*M[0][1] + F[0][1]*M[1][1];
    int z =  F[1][0]*M[0][0] + F[1][1]*M[1][0];
    int w =  F[1][0]*M[0][1] + F[1][1]*M[1][1];

    NSLog(@"%s %d %d %d %d", __FUNCTION__, x, y, z, w);

    F[0][0] = x;
    F[0][1] = y;
    F[1][0] = z;
    F[1][1] = w;
}

@end

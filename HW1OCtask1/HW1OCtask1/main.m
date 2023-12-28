//
//  main.m
//  HW1OCtask1
//
//  Created by Mac on 28.12.2023.
//

#import <Foundation/Foundation.h>
#import "QuadraticEquationSolver.h" // Включаем заголовочный файл QuadraticEquationSolver.h

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создаем экземпляр класса QuadraticEquationSolver
        QuadraticEquationSolver *solver = [[QuadraticEquationSolver alloc] init];
        
        // Решаем квадратные уравнения, вызывая метод solveWithA:b:c: для каждого уравнения
        [solver solveWithA:1 b:-8 c:12];  // x^2 – 8x + 12 = 0
        [solver solveWithA:12 b:-4 c:2];  // 12x^2 – 4x + 2 = 0
        [solver solveWithA:1 b:-100 c:-2];  // x^2 – 100x - 2 = 0
    }
    return 0;
}

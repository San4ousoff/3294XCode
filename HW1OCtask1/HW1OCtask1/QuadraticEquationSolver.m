//
//  QuadraticEquationSolver.m
//  HW1OCtask1
//
//  Created by Mac on 28.12.2023.
//

#import <Foundation/Foundation.h>
#import "QuadraticEquationSolver.h"
#include <math.h>

@implementation QuadraticEquationSolver

- (void)solveWithA:(double)a b:(double)b c:(double)c {
    // Вычисляем дискриминант
    double discriminant = b * b - 4 * a * c;
    
    if (discriminant > 0) {
        // Два действительных корня
        double root1 = (-b + sqrt(discriminant)) / (2 * a);
        double root2 = (-b - sqrt(discriminant)) / (2 * a);
        NSLog(@"У уравнения %.fx^2 + %.fx + %.f = 0 два корня: x1 = %.2f и x2 = %.2f", a, b, c, root1, root2);
    } else if (discriminant == 0) {
        // Один корень
        double root = -b / (2 * a);
        NSLog(@"У уравнения %.fx^2 + %.fx + %.f = 0 один корень: x = %.2f", a, b, c, root);
    } else {
        // Два мнимых корня
        double realPart = -b / (2 * a);
        double imaginaryPart = sqrt(-discriminant) / (2 * a);
        NSLog(@"У уравнения %.fx^2 + %.fx + %.f = 0 два мнимых корня: x1 = %.2f + %.2fi и x2 = %.2f - %.2fi", a, b, c, realPart, imaginaryPart, realPart, imaginaryPart);
    }
}

@end

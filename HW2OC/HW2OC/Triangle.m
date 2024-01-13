//
//  Triangle.m
//  HW2OC
//
//  Created by Mac on 12.01.2024.
//

#import <Foundation/Foundation.h>

#import "Triangle.h"

@implementation Triangle

- (float)calculateArea {
    float semiperimeter = (self.sideA + self.sideB + self.sideC) / 2;
    float area = sqrt (semiperimeter * (semiperimeter - self.sideA) * (semiperimeter - self.sideB) * (semiperimeter - self.sideC));
    return area;
}

- (float)calculatePerimeter {
    return _sideA + _sideB + _sideC;
}

- (void)printAdditionalInfo {
    NSLog(@"Сторона A: %f, Сторона B: %f, Сторона С: %f", self.sideA, self.sideB, self.sideC);
}

- (FigureType)figureType {
    return FigureTypeTriangle;
}

//- (void)printInfo {
//    NSLog(@"Треугольник: сторона А = %f, сторона В = %f, сторона С = %f", _sideA, _sideB, _sideC);
//    NSLog(@"Площадь = %f, Периметр = %f", [self calculateArea], [self calculatePerimeter]);
//}

@end

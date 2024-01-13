//
//  Rectangle.m
//  HW2OC
//
//  Created by Mac on 12.01.2024.
//

#import <Foundation/Foundation.h>

#import "Rectangle.h"

@implementation Rectangle

- (float)calculateArea {
    return _width * _height;
}

- (float)calculatePerimeter {
    return 2 * (_width + _height);
}

- (void)printAdditionalInfo {
    NSLog(@"Ширина: %f, Высота: %f", self.width, self.height);
}

- (FigureType)figureType {
    return FigureTypeRectangle;
}

//- (void)printInfo {
//    NSLog(@"Прямоугольник: ширина = %f, высота = %f", _width, _height);
//    NSLog(@"Площадь = %f, Периметр = %f", [self calculateArea], [self calculatePerimeter]);
//}

@end

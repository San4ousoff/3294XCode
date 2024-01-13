//
//  Figure.m
//  HW2OC
//
//  Created by Mac on 12.01.2024.
//

#import <Foundation/Foundation.h>

#import "Figure.h"

@implementation Figure

- (float)calculateArea {
    return 0;  // Абстрактный метод, который должен быть переопределен в производных классах
}

- (float)calculatePerimeter {
    return 0;  // Абстрактный метод, который должен быть переопределен в производных классах
}

- (void)printInfo {
    //NSString *figureName = [self figureNameForType:[self figureType]];
    NSLog(@"Тип фигуры: %@", [self figureNameForType:[self figureType]]);
    [self printAdditionalInfo];
    NSLog(@"Площадь: %f, Периметр: %f\n", [self calculateArea], [self calculatePerimeter]);
}

- (NSString *)figureNameForType:(FigureType)type {
    switch (type) {
        case FigureTypeRectangle:
            return @"Прямоугольник";
        case FigureTypeCircle:
            return @"Круг";
        case FigureTypeTriangle:
            return @"Треугольник";
        default:
            return @"Неизвестный";
    }
}

- (void)printAdditionalInfo {
    // Вывод дополнительной информации о фигуре. Этот метод должен быть переопределен в производных классах.
}

- (FigureType)figureType {
    // Возвращает тип фигуры. Этот метод должен быть переопределен в производных классах.
    return FigureTypeUnknown;
}

@end

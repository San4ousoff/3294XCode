//
//  Figure.h
//  HW2OC
//
//  Created by Mac on 12.01.2024.
//

#ifndef Figure_h
#define Figure_h

#import <Foundation/Foundation.h>

#import "FigureTypeEnum.h"

@interface Figure : NSObject

- (float)calculateArea; // метод вычисления площади (абстрактный метод)
- (float)calculatePerimeter; // метод вычисления периметра (абстрактный метод)
- (void)printInfo; // метод вывода информации о фигуре на экран (абстрактный метод)
- (FigureType)figureType; // возвращает тип фигуры

@end

#endif /* Figure_h */

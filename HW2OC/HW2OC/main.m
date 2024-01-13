//
//  main.m
//  HW2OC
//
//  Created by Mac on 12.01.2024.
//

#import <Foundation/Foundation.h>
#import "Figure.h"
#import "Rectangle.h"
#import "Circle.h"
#import "Triangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создаем экземпляр прямоугольника
        Rectangle *myRectangle = [[Rectangle alloc] init];
        myRectangle.width = 5;
        myRectangle.height = 3;
        
        // Создаем экземпляр круга
        Circle *myCircle = [[Circle alloc] init];
        myCircle.radius = 5;
        
        // Создаем экземпляр треугольника
        Triangle *myTriangle = [[Triangle alloc] init];
        myTriangle.sideA = 5;
        myTriangle.sideB = 2;
        myTriangle.sideC = 4;
        
//        // Вызов методов для вывода информации о фигурах
//        [myRectangle printInfo];
//        [myCircle printInfo];
//        [myTriangle printInfo];
        
        // Создаем массив для хранения фигур
        NSMutableArray *figuresArray = [NSMutableArray array];

        // Добавляем фигуры в массив
        [figuresArray addObject:myRectangle];
        [figuresArray addObject:myCircle];
        [figuresArray addObject:myTriangle];

        // Выводим информацию о каждой фигуре
        for (Figure *figure in figuresArray) {
            [figure printInfo];
        }
    }
    return 0;
}

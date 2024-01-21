//
//  Robot.m
//  HW4OC
//
//  Created by Mac on 21.01.2024.
//

#import <Foundation/Foundation.h>

#import "Robot.h"

@implementation Robot

- (void)run:(NSString * (^) (void))movementBlock {
    NSString *movement = movementBlock(); // Вызываем переданный блок, чтобы получить инструкцию для движения
    if ([movement isEqualToString:@"up"]) { // Если инструкция "up"
        self.y++; // Увеличиваем координату y
    } else if ([movement isEqualToString:@"down"]) { // Если инструкция "down"
        self.y--; // Уменьшаем координату y
    } else if ([movement isEqualToString:@"left"]) { // Если инструкция "left"
        self.x--; // Уменьшаем координату x
    } else if ([movement isEqualToString:@"right"]) { // Если инструкция "right"
        self.x++; // Увеличиваем координату x
    }
    NSLog(@"Moved to coordinates: %ld, %ld", (long)self.x, (long)self.y); // Выводим новые координаты робота
}

@end

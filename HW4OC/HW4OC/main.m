//
//  main.m
//  HW4OC
//
//  Created by Mac on 21.01.2024.
//

#import <Foundation/Foundation.h>
#import "Robot.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        - (void)run:(NSString * (^) (void))movementBlock {
//            NSString *movement = movementBlock(); // Вызываем переданный блок, чтобы получить инструкцию для движения
//            if ([movement isEqualToString:@"up"]) { // Если инструкция "up"
//                self.y++; // Увеличиваем координату y
//            } else if ([movement isEqualToString:@"down"]) { // Если инструкция "down"
//                self.y--; // Уменьшаем координату y
//            } else if ([movement isEqualToString:@"left"]) { // Если инструкция "left"
//                self.x--; // Уменьшаем координату x
//            } else if ([movement isEqualToString:@"right"]) { // Если инструкция "right"
//                self.x++; // Увеличиваем координату x
//            }
//            NSLog(@"Moved to coordinates: %ld, %ld", (long)self.x, (long)self.y); // Выводим новые координаты робота
//        }
//
//        @end
        
        Robot *robot = [[Robot alloc] init]; // Создаем экземпляр класса Robot
        while (true) {
            printf("Введите команды для перемещения робота (up, down, left, right) или 'exit' для выхода: ");
            char input[100];
            fgets(input, 100, stdin); // Получаем ввод от пользователя
            
            NSString *movement = [[NSString stringWithUTF8String:input] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if ([movement isEqualToString:@"exit"]) {
                break; // Если введена команда 'exit', завершаем программу
            } else if (![movement isEqualToString:@"up"] && ![movement isEqualToString:@"down"] && ![movement isEqualToString:@"left"] && ![movement isEqualToString:@"right"]) {
                NSLog(@"Ошибочная команда. Введите 'up', 'down', 'left', 'right' или 'exit'"); // Выводим уведомление об ошибке
                continue; // Пропускаем текущую итерацию цикла
            }
            
            [robot run:^NSString * { // Вызываем метод run и передаем блок с введенной командой
                return movement;
            }];
        }
    }
    return 0;
}

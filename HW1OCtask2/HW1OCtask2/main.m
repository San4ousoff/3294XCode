//
//  main.m
//  HW1OCtask2
//
//  Created by Mac on 28.12.2023.
//

#import <Foundation/Foundation.h>
#import "NumberComparator.h"
#import "InputValidator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создаем экземпляр класса InputValidator
        InputValidator *inputValidator = [[InputValidator alloc] init];
        NSMutableArray *numbers = [inputValidator validateAndReadInput];
        
        if (numbers) {
            // Создаем экземпляр класса NumberComparator
            NumberComparator *comparator = [[NumberComparator alloc] init];
            // Создаем пустой массив numbers, который будет использоваться для хранения чисел, введенных пользователем
            NSInteger maxNumber = [comparator findMaxNumberAmong:[numbers[0] integerValue] and:[numbers[1] integerValue] and:[numbers[2] integerValue]];
            NSLog(@"Наибольшее число: %ld", (long)maxNumber);
        } else {
            NSLog(@"Программа завершена.");
        }
    }
    return 0;
}

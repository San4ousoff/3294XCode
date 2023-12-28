//
//  InputValidator.m
//  HW1OCtask2
//
//  Created by Mac on 28.12.2023.
//

#import <Foundation/Foundation.h>
#import "InputValidator.h"

@implementation InputValidator

- (NSMutableArray *)validateAndReadInput {
    NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
    NSMutableArray *numbers = [NSMutableArray array];
    BOOL validInput = YES;

    for (int i = 0; i < 3; i++) {
        NSLog(@"Введите число #%d:", i + 1);
        NSData *inputData = [input availableData];
        NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

        int number = [inputString intValue];

        if (number != 0 || [inputString isEqualToString:@"0"]) {
            [numbers addObject:@(number)];
        } else {
            NSLog(@"Некорректный ввод. Пожалуйста, введите целое число.");
            validInput = NO;
            break;
        }
    }

    if (!validInput) {
        NSLog(@"Ошибка: некорректный ввод.");
        return nil;
    }
    
    return numbers;
}

@end

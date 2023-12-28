//
//  NumberComparator.m
//  HW1OCtask2
//
//  Created by Mac on 28.12.2023.
//

#import <Foundation/Foundation.h>
#import "NumberComparator.h"

@implementation NumberComparator

- (NSInteger)findMaxNumberAmong:(NSInteger)number1 and:(NSInteger)number2 and:(NSInteger)number3 {
    // Возвращаем наибольшее из трех чисел
    return MAX(MAX(number1, number2), number3);
}

@end

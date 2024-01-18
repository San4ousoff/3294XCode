//
//  Doctor.m
//  HW3OC
//
//  Created by Mac on 18.01.2024.
//

#import "Doctor.h"

@implementation Doctor

- (void)prescribePillToPatient:(NSString *)pillName {
    NSLog(@"Доктор назначает таблетку: %@", pillName); // Выводим в консоль задание, которое делегируем пациенту
    [self.delegate prescribePill:pillName]; // Вызываем метод делегата (пациента), чтобы он выполнил задание - принял таблетку
}

@end

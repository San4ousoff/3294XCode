//
//  main.m
//  HW3OC
//
//  Created by Mac on 18.01.2024.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Doctor *doctor = [[Doctor alloc] init];
        Patient *patient = [[Patient alloc] init];
        
        doctor.delegate = patient; // Устанавливаем пациента в качестве делегата доктора
        
        [doctor prescribePillToPatient:@"Аспирин"]; // Доктор делегирует пациенту принятие таблетки
        
    }
    return 0;
}

//
//  DoctorDelegate.h
//  HW3OC
//
//  Created by Mac on 18.01.2024.
//

#ifndef DoctorDelegate_h
#define DoctorDelegate_h

#import <Foundation/Foundation.h>

@class Doctor;

@protocol DoctorDelegate <NSObject>
- (void)prescribePill:(NSString *)pillName; // Метод, который будет вызывать доктор, когда он делегирует пациенту принятие таблетки
@end

#endif /* DoctorDelegate_h */

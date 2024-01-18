//
//  Doctor.h
//  HW3OC
//
//  Created by Mac on 18.01.2024.
//

#ifndef Doctor_h
#define Doctor_h

#import <Foundation/Foundation.h>
#import "DoctorDelegate.h"

@interface Doctor : NSObject

@property (nonatomic, weak) id<DoctorDelegate> delegate; // Делегат - объект, которому доктор будет делегировать задание

- (void)prescribePillToPatient:(NSString *)pillName;

@end

#endif /* Doctor_h */

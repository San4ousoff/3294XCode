//
//  NumberComparator.h
//  HW1OCtask2
//
//  Created by Mac on 28.12.2023.
//

#ifndef NumberComparator_h
#define NumberComparator_h

#import <Foundation/Foundation.h>

@interface NumberComparator : NSObject

// Объявление метода для нахождения наибольшего числа среди трех
- (NSInteger)findMaxNumberAmong:(NSInteger)number1 and:(NSInteger)number2 and:(NSInteger)number3;

@end

#endif /* NumberComparator_h */

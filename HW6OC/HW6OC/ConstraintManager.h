//
//  ConstraintManager.h
//  HW6OC
//
//  Created by Mac on 26.01.2024.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ConstraintManager : NSObject

+ (void)setupConstraintForView:(UIView *)view verticalMultiplier:(CGFloat)vMultiplier horizontalMultiplier:(CGFloat)hMultiplier inView:(UIView *)parentView;

@end

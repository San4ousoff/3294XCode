//
//  ConstraintManager.m
//  HW6OC
//
//  Created by Mac on 26.01.2024.
//

#import "ConstraintManager.h"

@implementation ConstraintManager

+ (void)setupConstraintForView:(UIView *)view verticalMultiplier:(CGFloat)vMultiplier horizontalMultiplier:(CGFloat)hMultiplier inView:(UIView *)parentView {
    [view setTranslatesAutoresizingMaskIntoConstraints:NO]; // важно отключить автоматическое создание ограничений (constraints)

    NSLayoutConstraint *verticalConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                            attribute:NSLayoutAttributeCenterY
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:parentView
                                                                            attribute:NSLayoutAttributeCenterY
                                                                           multiplier:vMultiplier
                                                                             constant:0];
    NSLayoutConstraint *horizontalConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                           attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:parentView
                                                                           attribute:NSLayoutAttributeCenterX
                                                                          multiplier:hMultiplier
                                                                            constant:0];

    [parentView addSubview:view]; // добавляем view на сцену
    [parentView addConstraints:@[verticalConstraint, horizontalConstraint]]; // добавляем ограничения (constraints) к view
}

@end

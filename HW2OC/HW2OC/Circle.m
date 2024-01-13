//
//  Circle.m
//  HW2OC
//
//  Created by Mac on 12.01.2024.
//

#import <Foundation/Foundation.h>

#import "Circle.h"

@implementation Circle

//- (instancetype)initWithRadius:(float)radius {
//    self = [super init];
//    if (self) {
//        _radius = radius;
//    }
//    return self;
//}

- (float)calculateArea {
    return M_PI * _radius * _radius;
}

- (float)calculatePerimeter {
    return 2 * M_PI * _radius;
}

- (void)printAdditionalInfo {
    NSLog(@"Радиус: %f", self.radius);
}

- (FigureType)figureType {
    return FigureTypeCircle;
}


//- (void)printInfo {
//    NSLog(@"Круг: радиус = %f", _radius);
//    NSLog(@"Площадь = %f, Периметр = %f", [self calculateArea], [self calculatePerimeter]);
//}

@end

//
//  Robot.m
//  HW6OC
//
//  Created by Mac on 26.01.2024.
//

#import "Robot.h"

@implementation Robot

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeInteger:self.x forKey:@"x"];
    [encoder encodeInteger:self.y forKey:@"y"];
    [encoder encodeObject:self.name forKey:@"name"];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        _x = [decoder decodeIntegerForKey:@"x"];
        _y = [decoder decodeIntegerForKey:@"y"];
        _name = [decoder decodeObjectOfClass:NSString.class forKey:@"name"];
    }
    return self;
}

- (instancetype)initWithX:(NSInteger)x y:(NSInteger)y name:(NSString *)name {
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
        _name = name;
    }
    return self;
}

@end

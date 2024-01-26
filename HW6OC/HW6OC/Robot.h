//
//  Robot.h
//  HW6OC
//
//  Created by Mac on 26.01.2024.
//

#import <Foundation/Foundation.h>

@interface Robot : NSObject <NSCoding, NSSecureCoding>

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithX:(NSInteger)x y:(NSInteger)y name:(NSString *)name;

@end

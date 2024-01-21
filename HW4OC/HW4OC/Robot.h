//
//  Robot.h
//  HW4OC
//
//  Created by Mac on 21.01.2024.
//

#ifndef Robot_h
#define Robot_h

#import <Foundation/Foundation.h>

@interface Robot : NSObject

@property (nonatomic) NSInteger x;
@property (nonatomic) NSInteger y;

- (void)run:(NSString * (^) (void))movementBlock;

@end

#endif /* Robot_h */

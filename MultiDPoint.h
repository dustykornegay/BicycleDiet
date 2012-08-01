//
//  MultiDPoint.h
//  BicycleDiet
//
//  Created by Digital on 8/1/12.
//
//

#import <Foundation/Foundation.h>

@interface MultiDPoint : NSObject{
    CGFloat x;
    CGFloat y;
    CGFloat z;
    
}

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat z;


- (id) init1dX: (CGFloat) xDim;

- (id) init2dX: (CGFloat) xDim  coordY: (CGFloat) yDim;

- (id) init3dX: (CGFloat) xDim  coordY: (CGFloat) yDim coordZ: (CGFloat) zDim ;


@end

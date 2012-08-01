//
//  MultiDPoint.m
//  BicycleDiet
//
//  Created by Digital on 8/1/12.
//
//

#import "MultiDPoint.h"

@implementation MultiDPoint
@synthesize x,y,z;

- (id) init1dX: (CGFloat) xDim{
    if (self){
        self.x = xDim;
        self.y = 0;
        self.z = 0;
        
    }
    return self;
}

- init2dX: (CGFloat) xDim  coordY: (CGFloat) yDim{
    if (self){
        self.x = xDim;
        self.y = yDim;
        self.z = 0;
        
    }
    return self;
}

- init3dX: (CGFloat) xDim  coordY: (CGFloat) yDim coordZ: (CGFloat) zDim {
    if (self){
        self.x = xDim;
        self.y = yDim;
        self.z = zDim;
        
    }
    return self;
}
@end

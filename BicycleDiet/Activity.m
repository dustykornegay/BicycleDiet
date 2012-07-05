//
//  Activity.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Activity.h"

@implementation Activity
@synthesize timestamp, user_id, type, points;

-(id)initWithTimeStamp:(NSDate *) tStamp andId:(int)anId andType:(int)aType andPoints:(int)somePoints; {
    
    if (self){ 
        self.timestamp = tStamp;
        self.user_id = anId;
        self.type = aType;
        self.points = somePoints;
    }
    return self;
}

@end

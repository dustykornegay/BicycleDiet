//
//  Users.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Users.h"

#import "Users.h"

@implementation Users

@synthesize user_id;
@synthesize user;
@synthesize total_goal;
@synthesize total_progress;

-(id)initWithUserId:(int)anId andUser:(NSString*)aName andGoal:(int)aGoal 
        andProgress:(int)someProgress {
       
    if (self){ 
        self.user_id = anId;
        self.user = aName;
        self.total_goal = aGoal;
        self.total_progress = someProgress;
    }
    return self;
}
@end


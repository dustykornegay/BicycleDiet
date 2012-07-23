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
@synthesize dailyExercise_duration;
@synthesize dailyExercise_progress;
@synthesize dailyExercise_goal;
@synthesize dailyDiet_goal;
@synthesize dailyDiet_progress;

-(id)initWithUserId:(int)anId andUser:(NSString*)aName andGoal:(int)aGoal 
        andProgress:(int)someProgress andExerciseGoal: (int) exercisegoal andExerciseDuration: (int)exerciseduration andDietGoal: (int) dietgoal{
       
    if (self){ 
        self.user_id = anId;
        self.user = aName;
        self.total_goal = aGoal;
        self.total_progress = someProgress;
        
        self.dailyExercise_goal = exercisegoal;
        self.dailyExercise_duration = exerciseduration;
        self.dailyDiet_goal = dietgoal;
        
    }
    return self;
}
@end


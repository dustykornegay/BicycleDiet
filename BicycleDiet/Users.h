//
//  Users.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject
{
    int user_id;
    NSString *user;
    int total_goal;
    int total_progress;
    int dailyExercise_goal;
    int dailyExercise_progress;
    int dailyExercise_duration;
    int dailyDiet_goal;
    int dailyDiet_progress;
    
    
}

@property (nonatomic) int user_id;
@property (nonatomic, retain) NSString* user;
@property (nonatomic) int  total_goal;
@property (nonatomic) int  total_progress;
@property (nonatomic) int dailyExercise_goal;
@property (nonatomic) int dailyExercise_duration;
@property (nonatomic) int dailyExercise_progress;
@property (nonatomic) int dailyDiet_goal;
@property (nonatomic) int dailyDiet_progress;






-(id)initWithUserId:(int)anId
        andUser:(NSString*)aName
        andGoal:(int)agoal
        andProgress:(int)someProgress 
        andExerciseGoal: (int) exercisegoal 
        andExerciseDuration: (int) exerciseduration 
        andDietGoal:(int) dietgoal;

@end




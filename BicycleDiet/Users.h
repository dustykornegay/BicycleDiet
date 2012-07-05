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
    int dailyDiet_goal;
    int dailyDiet_progress;
    
}

@property (nonatomic) int user_id;
@property (nonatomic, retain) NSString* user;
@property (nonatomic) int  total_goal;
@property (nonatomic) int  total_progress;


-(id)initWithUserId:(int)anId
            andUser:(NSString*)aName
            andGoal:(int)agoal
        andProgress:(int)someProgress;

@end




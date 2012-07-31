//
//  weightlimit.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/17/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>



@interface weightlimit : NSObject {
  
}


@property (nonatomic, retain) IBOutlet NSMutableArray * graph;

+(float) Calculate_Points: (float) current_weight_lbs ideal: (float) ideal_weight_lbs;
+(float) Calc_Suggested_weight: (float) height_inches ratio: (float) desired_waist_hip_ratio;


+(int) GetPointsTotal_goal: (int) user_num;
+(int) GetPointsEarnedTotal: (int) user_num;

+(int) GetPointsEarnedToday: (int) user_num Type: (NSString *) DietOrExercise;

+ (int)Database_select: (NSString *) sql_command;

+(int) DaysToGoal:  (int) user_id ;
+(int) QuarterPoundsbyDate:(int) CaloriesPerDay date: (NSDate *) goal;
+(NSDate *) DayGoalAchieved: (int)CaloriesPerDay userId:(int) user_id;

+(BOOL) PushDailyGoals: (int) user_id  Diet: (int)caloriesCut Exercise: (int) extraCaloriesBurned ExerciseDuration: (int) minutes;

+(NSString *) GetTime;

+(NSString *) GetDate: (int)daysAgo;





@end

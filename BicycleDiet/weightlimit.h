//
//  weightlimit.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/17/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weightlimit : NSObject {
    NSMutableArray *obj_list;
}

@property (nonatomic, retain) IBOutlet NSMutableArray * obj_list;

+(float) Calculate_Points: (float) current_weight_lbs ideal: (float) ideal_weight_lbs;
+(float) Calc_Suggested_weight: (float) height_inches ratio: (float) desired_waist_hip_ratio;


+(int) GetPointsTotal_goal: (int) user_num;

+(int) GetPointsEarnedTotal: (int) user_num;
+(int) GetPointsEarnedToday: (int) user_num;
+(int) GetPointsEarnedToday_Exercise;
+ (int)Database_select: (NSString *) sql_command;
@end

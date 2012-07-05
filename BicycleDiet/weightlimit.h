//
//  weightlimit.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/17/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weightlimit : NSObject {

}


+(float) Calculate_Points: (float) current_weight_lbs ideal: (float) ideal_weight_lbs;
+(float) Calc_Suggested_weight: (float) height_inches ratio: (float) desired_waist_hip_ratio;

+(int) GetPointsEarnedTotal;
+(int) GetPointsEarnedToday;

+(int) GetPointsEarnedToday_Exercise;

@end

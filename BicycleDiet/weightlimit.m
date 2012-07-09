//
//  weightlimit.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/17/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import "weightlimit.h"
#import "DBController.h"
#import "Users.h"
#import "Activity.h"

@implementation weightlimit 
@synthesize obj_list = _obj_list;


+(float) Calculate_Points: (float) current_weight_lbs ideal: (float) ideal_weight_lbs{
    //Goal is 3500 calories per/pound * pounds to lose + 5 * 3500 as hedge
    //for activities that are important to get best use from app, but don't directly impact outcome
    if ((current_weight_lbs - ideal_weight_lbs) >=  0)  {
        float goal=  (5 + (current_weight_lbs - ideal_weight_lbs))* 3500;
                    
                    return goal;
                    }
                    else {
                        return 0;
                    }
                    
    }
                    
  /*                  int Calc_Suggested_weight (float height_inches, bool wears_skirts, bool uses_weights) {
                        
                        float suggested_weight = height_inches *  2.2 ; //69in * 2.2 = 151 ;  60in * 2.2 = 132;
                        if (uses_weights){ suggested_weight = suggested_weight * 1.15;} // 69in -> 175; 60in -> 151;
                        if (wears_skirts){ suggested_weight = suggested_weight * .875; }// 69 ->
                        
                        return suggested_weight;
                    }*/
                      
                    
+ (float) Calc_Suggested_weight: (float) height_inches ratio: (float) desired_waist_hip_ratio{
                        // At baseline is anyone anorexic? NO. 20in -> 14 lbs ; 48in -> 81 lbs; 69 in -> 168 lbs; 78in -> 215
                        float suggested_weight = (height_inches / 70) * height_inches * 2.3 ;
                        float obese = 3.3 * height_inches ;
                        //float anorexic = (height_inches / 70) * height_inches * 1.5 ;
                        float safe_weight_upper = 3 * height_inches;
                        float safe_weight_lower = (height_inches / 70) * height_inches * 1.65 ;
                        
                        
                        if (desired_waist_hip_ratio > 1.3) { desired_waist_hip_ratio = 1.75;}
                        if (desired_waist_hip_ratio < .7) { desired_waist_hip_ratio = .7;}
                        
                        if (.7 <= desired_waist_hip_ratio <= 1.75) {
                            suggested_weight =  suggested_weight * (desired_waist_hip_ratio* 62/height_inches) ;// Portly: 69 in (1.25) -> 215 lbs ; Hourglass: 69 in (.75) -> 129
                            
                            if (suggested_weight <= safe_weight_lower) {return safe_weight_lower;}
                            if (suggested_weight >= obese) {return safe_weight_upper;}
                        
                            return suggested_weight;
                        }
                        
                        else return -1;
}

+ (int) GetPointsTotal_goal: (int) user_num{
    DBController *mydb = [[DBController alloc] init];
    
    NSString * sql = @"select * from username where user_id= 0";
    
    if([mydb DBdatafieldToObjectArray: sql ]){
        
        // TODO: Total points earned from sql: Select Points where Date: "today" and Activity= "Exercise"
        Users *temp= [[Users  alloc]init];
        
        
        temp = [mydb.obj_array lastObject];
        
        int temp_points =  temp.total_progress;
        
        return temp_points;
    }
    else{
        return -1;
    }
}

+(int) GetPointsEarnedTotal: (int)user_num {
    // Open the status table and total the points earned from all sources
    // where user_id == user_num
    //sql = "Select ?points? from status where user_id = ?user_num?
     
    NSString * sql = [[NSString alloc] initWithFormat: @"Select * from status where user_id = %i", user_num];
    NSLog(@"%@",sql);
    
    int total =[self Database_select: sql];
   
    
    return total;
}

+(int) GetPointsEarnedToday: (int)user_num{
    // Open the status table and total the points earned from all sources
    // where user_id == user_num  &  date == ?Today's Date;
    //sql = "SELECT ?points? WHERE user_id = ?user_num? AND date= ?Today?
    
    return 1000;
}

    
+(int) GetPointsEarnedToday_Exercise{
    return 400;
}

+(int)Database_select: (NSString *) sql_command{
DBController *mydb = [[DBController alloc] init];
int sum = 0;

if([mydb DBdatafieldToActivityArray: sql_command ]){
// TODO: Total points earned from sql: Select Points where Date: "today" and Activity= "Exercise"
    
NSLog( @"Get data from DB");
    NSMutableArray * objects;
    
    objects = mydb.obj_array;
    
    if (objects.count != 0){
    // walk through array and sum data values
    for( int y = 0; y < [objects count]; y++){
        Activity * a =[objects objectAtIndex: 0];
        sum += a.points; }
    }else {
            sum = -2;
        }
    
    
}else {
    NSLog (@"DBdatafiledToObjectArray FAILED in +Database_select");
    sum = -1;
}
return sum;
}


+(int) DaysToGoal: (int) CaloriesPerDay userId: (int) user_id {
    int days = 90;
    int totalGoal = 99999;
    int currentPoints = -1;
    
    
    //Get TotalGoal & Current points
     
    
    //Subtract TotalGoal
    days = (totalGoal - currentPoints) / CaloriesPerDay;
    
    return days;
    
}

+(int) QuarterPoundsbyDate:(int) CaloriesPerDay date: (NSDate *) goal{
    int CaloriesPerQuarterPound = 875; 
    int quarterPounds = 0; 
    int days= 90;
    
    //Calendar required to use NSDateComponents
    NSCalendar *calendar = [NSCalendar currentCalendar];

    //get todays date:
    NSDate *today = [NSDate date];
    
    // days = (goal - today) using NSDateComponents
    
    NSDateComponents *components = [calendar components:NSDayCalendarUnit fromDate:today toDate:goal options:0];
    
    days = [components day];
     
    quarterPounds = (CaloriesPerDay * days) / CaloriesPerQuarterPound;

    return quarterPounds;
}

+(NSDate *) DayGoalAchieved: (int)CaloriesPerDay userId:(int) user_id{
    NSDate *today = [NSDate date];
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    int days;

    //Get days to Goal
    days = [self DaysToGoal: CaloriesPerDay userId: user_id];
    
    // Calculate date after x days
    NSDate *goalDay = [today dateByAddingTimeInterval: (days * secondsPerDay)];

    return goalDay;
}

+(int) CaloriesPerDay_exercise: (int) intensity  Duration: (int) minutes {
    int calories = intensity * minutes;
    
    return calories;
}

+(BOOL) PushDailyGoals: (int) user_id  Diet: (int)caloriesCut Exercise: (int) extraCaloriesBurned ExerciseDuration: (int) minutes{
    bool success = false;
    
    if ( TRUE /* if user exist in database */) { 
        
        //TODO: Set goals
        // pseudoSQL: @"INSERT Values( caloriesCut, extraCaloriesBurned) INTO users where user_id = user_id  ,) 
    
        
        
         success = TRUE;
    }
    
    return success;
}

@end

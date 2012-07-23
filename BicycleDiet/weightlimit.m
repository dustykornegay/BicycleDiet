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
    
    NSString * sql = [[NSString alloc] initWithFormat: @"Select * from username where user_id = %i", user_num];
    
    if([mydb DBdatafieldToUserArray: sql ]){
        
        // TODO: Total points earned from sql: Select Points where Date: "today" and Activity= "Exercise"
        Users *temp= [[Users  alloc]init];
        
        
        temp = [mydb.obj_array lastObject];
        
        int temp_points =  temp.total_goal;
        
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
    NSLog(@"User ID = %@",sql);
    
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
        Activity * a =[objects objectAtIndex: y];
        sum += a.points; }
    }else {
            sum = -2;
        }
    
    
}else {
    NSLog (@"DBdatafieldToObjectArray FAILED in weightlimit +Database_select");
    sum = -1;
}
return sum;
}


+(int) DaysToGoal: (int) user_id {
    int days = 90;
    int totalGoal = 99999;
    int currentPoints = -1;
    
    
    //Get TotalGoal & Current points
    NSString * sql = [ @"" stringByAppendingFormat: @"SELECT * from username where user_id = %i", user_id]; 
    DBController * myDB = [[DBController alloc] init];
    
    [myDB DBdatafieldToUserArray:sql];
    
    Users * temp = [myDB.obj_array lastObject]; 
    
    totalGoal = temp.total_goal;
    currentPoints = temp.total_progress;
    
    int CaloriesPerDay  = temp.dailyDiet_goal + temp.dailyExercise_goal;
    
    if (CaloriesPerDay > 0){
    //Subtract TotalGoal
    days = (totalGoal - currentPoints) / CaloriesPerDay;
    }
    else {
        days = 10000;
    }
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
    days = [self DaysToGoal: user_id];
    
    // Calculate date after x days
    NSDate *goalDay = [today dateByAddingTimeInterval: (days * secondsPerDay)];

    return goalDay;
}

+(int) CaloriesPerDay_exercise: (int) intensity  Duration: (int) minutes {
    int calories = intensity * minutes;
    
    return calories;
}

+(BOOL) PushDailyGoals: (int) user_id  Diet: (int)caloriesCut Exercise: (int) extraCaloriesBurned ExerciseDuration: (int) minutes{
    DBController *mydb = [[DBController alloc] init];
    bool success = false;
    
    if ( TRUE /* if user exist in database */) { 
        
        //TODO: Set goals
        // pseudoSQL: @"Update Values( caloriesCut, extraCaloriesBurned) INTO users where user_id = user_id  ,) 
    
        NSString * sql_command = [[NSString alloc] initWithFormat: @"Update username set exerciseGoal = %i, exerciseDuration = %i, dietGoal = %i where user_id = %i", extraCaloriesBurned , minutes ,caloriesCut, user_id];
        
        NSLog(@"%@", sql_command);
        
        if([mydb DBPush: sql_command]){        
         success = TRUE;
        }else {
            success = FALSE;
        }
    
    }
    return success;
}

+(NSString *) GetTime{
    //Four character time hhmm
    NSString * mytime;
    
    // Code modified from Carl Norum @stackoverflow.com
    //begin
    NSDateFormatter *formatter;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HHmm"];
    
   mytime = [formatter stringFromDate:[NSDate date]];
     //end
    
    NSLog(@"%@", mytime);
    
   
    return mytime;
}

+(NSString *) GetDate{
    //9 character date format ddMMMyyyy ex 12JUN2012
    NSDate * now = [NSDate date];

    NSString * mydate = [[NSString alloc] init];
 
    // code found from Richard J. Ross on stackoverflow.com
    //begin
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    NSDateComponents *components = [cal components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:now];

     
    int month = [components month] ;
    int day = [components day]; 
    int year= [components year];
   
    // end
    
    mydate = [@"" stringByAppendingFormat: @"'%i%@%i'", day, [self ThreeCharMonth: month], year];
    
    NSLog(@"%@",mydate);
    
    return mydate;
    
}

+(NSString *) ThreeCharMonth: (int) month{
    NSString * month_str;
    
    switch (month){
        case 1:
            month_str = @"JAN";
            break;
            
        case 2:
            month_str = @"FEB";
            break;    
            
        case 3:
            month_str = @"MAR";
            break;
            
        case 4:
            month_str = @"APR";
            break;
            
        case 5:
            month_str = @"MAY";
            break;
            
        case 6:
            month_str = @"JUN";
            break;
            
        case 7:
            month_str = @"JUL";
            break;
            
        case 8:
            month_str = @"AUG";
            break;
            
        case 9:
            month_str = @"SEP";
            break;
            
        case 10:
            month_str = @"OCT";
            break;
            
        case 11:
            month_str = @"NOV";
            break;
            
        case 12:
            month_str = @"DEC";
            break;
            
        default:
            
            month_str = @"UNK";
            
    }
    
    return month_str;
    
}
@end

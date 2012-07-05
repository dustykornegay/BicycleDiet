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

+(int) GetPointsEarnedTotal: (int)user_num {
    // Open the status table and total the points earned from all sources
    // where user_id == user_num
    //sql = "Select ?points? from status where user_id = ?user_num?
     
    NSString * sql = @"Select * from status";
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
    
    // walk through array and sum data values
   // for( int y = 0; y < [objects count]; y++){
        Activity * a =[objects objectAtIndex: 0];
        sum += a.points; 
  //  }
    
    
    
}else {
    NSLog (@"DBdatafiledToObjectArray FAILED in +Database_select");
    sum = -1;
}
return sum;
}

@end

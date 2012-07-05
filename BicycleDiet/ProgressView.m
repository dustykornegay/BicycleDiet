//
//  ProgressView.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/20/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import "ProgressView.h"
#import "weightlimit.h"
#import "DBController.h"

@implementation ProgressView
@synthesize totalgoal_points = _totalgoal_points;
@synthesize pointsEarnedtoday_Exercise;
@synthesize pointsEarnedtoday_Diet;
@synthesize pointsEarnedtoday_Total;
@synthesize pointsEarnedTotal;

@synthesize  ExerciseGoal_button;
@synthesize  DietGoal_button;

@synthesize diet_todaysprogress;
@synthesize exercise_todaysprogress;
@synthesize totalprogress;
@synthesize inspiration;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
       
     
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(IBAction) doExerciseGoal_button{
    //Updates the pace of Exercise to be realistic
    DBController *mydb = [[DBController alloc] init];

  
    if([mydb DBdatafieldToObjectArray: @"select * from username" ]){
    
 // TODO: Total points earned from sql: Select Points where Date: "today" and Activity= "Exercise"
    Users *temp= [[Users  alloc]init];
    
   
         temp = [mydb.obj_array lastObject];

    int temp_points =  temp.total_progress;
    
    pointsEarnedtoday_Exercise.text = [[NSNumber alloc ]initWithInt: temp_points].stringValue; 
    }
    else{
        pointsEarnedtoday_Exercise.text = [[NSNumber alloc ]initWithInt: -1].stringValue;
    }
}
-(IBAction) doDietGoal_button{
    //Updates the pace of Diet to be realistic
    
    pointsEarnedtoday_Diet.text = [[NSNumber alloc ]initWithFloat: 550].stringValue; 
   
    //progress bar 
    [diet_todaysprogress  setProgress: 0.4];
    [diet_todaysprogress setProgress: 0.1]; 
    [totalprogress setProgress: 0.6];
    
}


@end

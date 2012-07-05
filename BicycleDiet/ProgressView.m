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
  // Set goal at 0 to 1500 pts
  // 1500 pts -> 3 pounds per week from exercise
  // 45 minutes of intense exercise per day -> 750 calories 
  // 60 minutes of intense exercise  -> 1000 calories
  // 90 minutes of intense exercise -> 1500 calories
    
   // Intense exercise -> 16.5 cal /min
   // Moderate exercise -> 12 cal / min 
   // Light exercise -> 6 cal /min
    
}
-(IBAction) doDietGoal_button{
    //Updates the pace of Diet to be realistic
    //Set goal form 0 to 1000 pts
    // 1000 pts -> 2 pounds per week from diet
    
    //cutting 2- 20oz sodas -> 500 calories 
    //changing from 2- 20 oz bottles to 2- 12oz cans -> 200 calories
    
    //changing to diet or water -> 490 calories
    
    // replace soda with water && hard candy OR gum
    
    //cutting french fries -> 380 calories
    
    pointsEarnedtoday_Diet.text = [[NSNumber alloc ]initWithFloat: 550].stringValue; 
   
    //progress bar 
    
#if 0  //verified the method to update the progress bars
    [diet_todaysprogress  setProgress: 0.4];
    [diet_todaysprogress setProgress: 0.1]; 
    [totalprogress setProgress: 0.6];
    
#endif 
    
}


@end

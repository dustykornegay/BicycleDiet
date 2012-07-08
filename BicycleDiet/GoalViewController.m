//
//  GoalViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoalViewController.h"
#import "weightlimit.h"

@interface GoalViewController ()

@end

@implementation GoalViewController
@synthesize user_id, dietGoal, exerciseGoal,exerciseGoal_minutes, goalreached_estimate; 
@synthesize hoursExercise, intensityExercise, caloriesDiet,DateSelector;
@synthesize ETA, WeightAtDate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //Check database for goal settings fo this user_id
    // if do not exist set to 0.4 ( 1 hr moderate exercise), 0.5(500 cal /day)
    
    //Load Goals from stored values
        
    
    
    //Update View
    [self SetGoals];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // load new exercise/diet goal values in the database by user_id
    
    //TODO:Write the new goals out to the database by user_id.
    [weightlimit PushDailyGoals: (int) user_id Diet: (int) dietGoal Exercise: (int) exerciseGoal ExerciseDuration: (int) exerciseGoal_minutes];
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction) SetGoals {
   // Call the weightloss methods necessary to recalculate the dates & weights
    
    //set weight at date;
    WeightAtDate.text = @"135";
    
    
    //set estimated date you will meet goal;
    ETA.text = @"July 25, 2010";
    
}


@end

//
//  GoalViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoalViewController.h"
#import "BicycleDietCommon.h"

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

-(void) viewDidDisappear:(BOOL)animated    {
    // load new exercise/diet goal values in the database by user_id
     exerciseGoal = exerciseGoal_intensity * exerciseGoal_minutes;
    
    NSLog( @"UserID: %i DietGoal: %i ExerciseGoal: %i ExerciseDuration: % i", user_id, dietGoal, exerciseGoal, exerciseGoal_minutes );
    
    //TODO:Write the new goals out to the database by user_id.
    [weightlimit PushDailyGoals: (int) user_id Diet: (int) dietGoal Exercise: (int) exerciseGoal ExerciseDuration: (int) exerciseGoal_minutes];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    
    
    
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



-(IBAction) sliderDiet: (id) sender{
    UISlider *slider = (UISlider *) sender;
    dietGoal = (slider.value);
     
}
-(IBAction) sliderHoursExercise: (id)sender{
    UISlider *slider = (UISlider *) sender;
    exerciseGoal_minutes = (slider.value)* 60; //convert hours to minutes
}
-(IBAction) sliderIntensityExercise:(id)sender{
    //slider scale calibrated to calories per hour based on intensity
    UISlider *slider = (UISlider *) sender;
    exerciseGoal_intensity = (slider.value);
}

@end

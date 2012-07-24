//
//  GoalViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoalViewController.h"
#import "AppDelegate.h"
#import "BicycleDietCommon.h"

@interface GoalViewController ()

@end

@implementation GoalViewController
@synthesize user_id, dietGoal, exerciseGoal,exerciseGoal_minutes, goalreached_estimate; 
@synthesize hoursExercise, intensityExercise, caloriesDiet,DateSelector;
@synthesize ETA, WeightAtDate, eventday;

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
    [self viewDidAppear: FALSE];
    today = [NSDate date];
    event = [NSDate date];

}

- (void) viewDidAppear:(BOOL)animated{
    //Check database for goal settings fo this user_id
    // if do not exist set to 0.4 ( 1 hr moderate exercise), 0.5(500 cal /day)
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    user_id = appDelegate.user_id ;
    
    NSString * sql_com = [@"Select * from username where user_id = " stringByAppendingFormat:@"%i",user_id];
    
    DBController * myDb = [[DBController alloc ]init];
    
    
    if ([myDb DBdatafieldToUserArray:sql_com]){
        //Load Goals from stored values 
        NSMutableArray * temp_array = [myDb obj_array];
        
        Users * temp_user = [temp_array lastObject];
        
        dietGoal = temp_user.dailyDiet_goal; 
        exerciseGoal_minutes = temp_user.dailyExercise_duration;
        
        if (exerciseGoal_minutes != 0){
            exerciseGoal_intensity = temp_user.dailyExercise_goal / exerciseGoal_minutes;
        }
        
    }else{
        //set goals to defaults
        dietGoal = 900;
        exerciseGoal_intensity = 9; // moderate intensity (7-17) calories per minute
        exerciseGoal_minutes   = 30;
        exerciseGoal = exerciseGoal_minutes * exerciseGoal_intensity;
        
    }
    
    
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
    
    NSCalendar * calendar = [[NSCalendar alloc ]initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init] ;
    [components setDay: [weightlimit DaysToGoal: user_id]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"ddMMMyyyy"];
    
    NSDate *goal = [calendar dateByAddingComponents:components toDate:today options:0];
    
    
    //set weight at date;
    
    int CaloriesPerDay = (exerciseGoal_intensity * exerciseGoal_minutes) + dietGoal;
    
    float temp_float =(float)[weightlimit QuarterPoundsbyDate: CaloriesPerDay date:event] / 4;
    
    
    WeightAtDate.text =  [[NSNumber alloc] initWithFloat: temp_float].stringValue;
    
    eventday.text = [formatter stringFromDate: event] ;
    
    //set estimated date you will meet goal;today
    ETA.text = [formatter stringFromDate:goal];
    
    [hoursExercise  setValue: (float)exerciseGoal_minutes / 60];
    [intensityExercise  setValue: exerciseGoal_intensity];
    [caloriesDiet  setValue: dietGoal];
    
}

-(IBAction) byDate{
    NSCalendar * calendar = [[NSCalendar alloc ]initWithCalendarIdentifier:NSGregorianCalendar];
   
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setDay: (int) DateSelector.value];
   
    event = [calendar dateByAddingComponents:components toDate:today options:0];
    
    [self SetGoals];
    
}

-(IBAction) sliderDiet: (id) sender{
    UISlider *slider = (UISlider *) sender;
    dietGoal = (slider.value);
    
    //update date
    [self viewDidDisappear:YES];
    [self SetGoals];
     
}
-(IBAction) sliderHoursExercise: (id)sender{
    UISlider *slider = (UISlider *) sender;
    exerciseGoal_minutes = (slider.value)* 60; //convert hours to minutes
    
    [self viewDidDisappear:YES];
    [self SetGoals];
}
-(IBAction) sliderIntensityExercise:(id)sender{
    //slider scale calibrated to calories per hour based on intensity
    UISlider *slider = (UISlider *) sender;
    exerciseGoal_intensity = (slider.value);
    
    [self viewDidDisappear:YES];
    [self SetGoals];
}

-(BOOL) textFieldShouldReturn:(UITextField *) aTextField {
    [aTextField resignFirstResponder];
    NSLog(@"I hit return");
    return YES;
    
}

@end

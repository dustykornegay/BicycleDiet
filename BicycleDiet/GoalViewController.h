//
//  GoalViewController.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoalViewController : UIViewController{
    int user_id;
    int dietGoal;
    int exerciseGoal;
    int exerciseGoal_minutes;
    NSDate * goalreached_estimate;
    UILabel * ETA;
    UILabel * WeightAtDate;
    
    UISlider *caloriesDiet ;
    UISlider *hoursExercise;
    UISlider *intensityExercise;
    
    int exerciseGoal_intensity;
}

@property (nonatomic) int user_id;
@property (nonatomic) int dietGoal;
@property (nonatomic) int exerciseGoal;
@property (nonatomic) int exerciseGoal_minutes;
@property (nonatomic, retain) NSDate * goalreached_estimate;

@property (nonatomic, retain) IBOutlet UISlider * caloriesDiet;
@property (nonatomic, retain) IBOutlet UISlider * hoursExercise;
@property (nonatomic, retain) IBOutlet UISlider * intensityExercise;
@property (nonatomic, retain) IBOutlet UIStepper * DateSelector;
@property (nonatomic,retain) IBOutlet UILabel * ETA;
@property (nonatomic,retain) IBOutlet UILabel * WeightAtDate;


-(IBAction) sliderDiet: (id) sender;
-(IBAction) sliderHoursExercise: (id)sender;
-(IBAction) sliderIntensityExercise:(id)sender;

- (IBAction) SetGoals;

@end

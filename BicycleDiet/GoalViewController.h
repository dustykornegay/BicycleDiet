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
    NSDate * goalreached_estimate;
}

@property (nonatomic) int user_id;
@property (nonatomic) int dietGoal;
@property (nonatomic) int exerciseGoal;
@property (nonatomic, retain) NSDate * goalreached_estimate;

@property (nonatomic, retain) IBOutlet UISlider * caloriesDiet;
@property (nonatomic, retain) IBOutlet UISlider * hoursExercise;
@property (nonatomic, retain) IBOutlet UISlider * intensityExercise;
@property (nonatomic, retain) IBOutlet UIStepper * DateSelector;


- (IBAction) SetGoals;

@end

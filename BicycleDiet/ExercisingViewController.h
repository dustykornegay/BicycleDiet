//
//  ExercisingViewController.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExercisingViewController : UIViewController{
    int user_id;
    int exercise_id;
    int points; // tenths of minutes * intensity 
    int tenthsOfMinutes;
    NSTimer * stopwatch;

}

@property (nonatomic,retain) IBOutlet UILabel * stopwatch;
@property (nonatomic, retain) IBOutlet UISlider * intensityExercise;

-(IBAction) StartPauseTimer ; 

@end

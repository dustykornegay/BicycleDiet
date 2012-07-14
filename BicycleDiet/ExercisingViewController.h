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
    float points; //  minutes * intensity 
    float fifthSecond;
    
    bool timer_run;
    NSTimer * mytimer;
    int minutes;
    float intensity;
  
}

@property  NSTimer * mytimer;
@property (nonatomic, retain) IBOutlet UILabel * points_label;
@property (nonatomic,retain) IBOutlet UILabel * stopwatch;
@property (nonatomic, retain) IBOutlet UISlider * intensityExercise;
@property (nonatomic, retain) IBOutlet UIButton * counter;

-(IBAction) StartPauseTimer: (id) sender ;

- (void) UpdateTime: (NSTimer *) mytimer ;

@end

//
//  ProgressViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProgressViewController.h"
#import "ProgressView.h"
#import "weightlimit.h"


@interface ProgressViewController ()

@end

@implementation ProgressViewController
@synthesize totalgoal_points;
@synthesize totalpoints_earned;
@synthesize totalpoints_earnedtoday;

@synthesize exerciseProgress;
@synthesize dietProgress;
@synthesize totalProgress;

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
    
    
    
    NSLog(@"ProgressView Loaded");
    
    int totalearned = [weightlimit GetPointsEarnedTotal: 0] ;
    int totalgoal = [weightlimit GetPointsTotal_goal:0];
   
    //TODO: update progress from data base
    
    exerciseProgress.progress = 0.5;
    dietProgress.progress = 0.9;
    
    totalProgress.progress = (float) totalearned / (float) totalgoal;
    
    totalgoal_points.text = [[NSNumber alloc ]initWithInt:totalgoal ].stringValue;
       
    totalpoints_earned.text = [[NSNumber alloc ]initWithInt:totalearned ].stringValue; 
    
    totalpoints_earnedtoday.text = @"1550";
  
    
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




@end

//
//  ProgressViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProgressViewController.h"
#import "ProgressView.h"
#import "AppDelegate.h"
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
@synthesize user_id;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithUserId: (int) User_id{
    self = [super init];
    
    [super viewDidLoad];
    
    if(self){
        self.user_id = User_id;
     
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    user_id = appDelegate.user_id ;
    
    
    NSLog(@"ProgressView Loaded");
    NSLog(@"%i",user_id);
    
    int totalearned = [weightlimit GetPointsEarnedTotal: user_id];
    int totalgoal = [weightlimit GetPointsTotal_goal:user_id];
   
    //TODO: update progress from data base
    
    exerciseProgress.progress = (float)500/(float)1000;
    dietProgress.progress = (float)500/(float)1000;;
    
    if ((totalgoal != 0)){
    totalProgress.progress = (float) totalearned / (float) totalgoal;
    } else {
        totalgoal = 0;
    } 
    
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


//add timer to randomly update inspration from database




@end

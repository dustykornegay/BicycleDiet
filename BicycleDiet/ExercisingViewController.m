//
//  ExercisingViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExercisingViewController.h"

@interface ExercisingViewController ()


@end

@implementation ExercisingViewController
@synthesize stopwatch, intensityExercise;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        // get the exercise id from the AppDelegate
        
        //load the intensity to the intensity bar
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    // TODO: Save the Exercise name, id &  points in the Activity database under the user_id
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction) StartPauseTimer {
    
    //increment tenths of seconds on timer fire 

}

@end

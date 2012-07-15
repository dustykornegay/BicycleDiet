//
//  ExerciseViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseViewController.h"
#import "AppDelegate.h"

@interface ExerciseViewController ()

@end

@implementation ExerciseViewController
@synthesize unsubmittedpoints;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

-(void) viewDidAppear:(BOOL)animated {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (appDelegate.points > 0) {
        points_earned = appDelegate.points;
        unsubmittedpoints.text = [[NSNumber alloc] initWithInt: points_earned ].stringValue;
    }
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

-(IBAction) SubmitPoints: (id)sender {
    //Open Database, submit points with activity id exercise , and user_id matching the user
    points_earned = 0;
    unsubmittedpoints.text = @"Points Earned" ;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.points = 0;
    
}

@end

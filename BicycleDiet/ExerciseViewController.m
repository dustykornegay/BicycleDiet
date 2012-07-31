//
//  ExerciseViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseViewController.h"
#import "BicycleDietCommon.h"

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
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //Open Database, submit points with activity id exercise , and user_id matching the user
    NSString * sql_com = [@"insert into status" stringByAppendingFormat: @" Values(%i,'Exercise', '%@', '%@' ,%i)", appDelegate.user_id, [weightlimit GetTime], [weightlimit GetDate: 0], points_earned ];
    
    
    NSLog(@"%@",sql_com);
    
    DBController * mydB = [[DBController alloc] init]; 
    
    if([mydB DBPush: sql_com]){
    
    //Reset points to 0 
    
    points_earned = 0;
    unsubmittedpoints.text = @"Points Earned" ;
    
    
    appDelegate.points = 0;
    }else {
        NSLog(@"failed to push exercise points into the status table");
    }
    
}

@end

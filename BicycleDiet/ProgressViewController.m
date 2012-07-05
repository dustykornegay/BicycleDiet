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
    
   
    
    totalgoal_points.text = [[NSNumber alloc ]initWithInt:[weightlimit GetPointsEarnedTotal]].stringValue;
   
    totalpoints_earned.text = @"29000"; 
    
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



#if 0 // Add View to view controller
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
        static NSString *CellId = @"ProgressView";
        CreateView *cell0 = [ProgressView dequeueReusableCellWithIdentifier:CellId];
        
        if (cell0 == nil) {
            cell0 = [[CreateUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId]; 
            
            cell0.textLabel.text = @"Add User";
        }
        
        return cell0;
    }
#endif
@end

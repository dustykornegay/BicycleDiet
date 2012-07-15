//
//  ExercisingViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExercisingViewController.h"
#import "AppDelegate.h"

@interface ExercisingViewController ()


@end

@implementation ExercisingViewController
@synthesize stopwatch, intensityExercise, mytimer, counter, points_label;

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
    points = 0;
    fifthSecond = 0;
    timer_run = TRUE;
    intensity = 6 ;
    
    mytimer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target: self selector: @selector(UpdateTime:) userInfo:NULL repeats: YES];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    
    
    
}

- (void) viewWillDisappear:(BOOL)animated   {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.points =  points; 
    // TODO: Save the Exercise name, id &  points in the Activity database under the user_id
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



-(IBAction) StartPauseTimer: (id) sender {
    
    if (timer_run == false){
        //if the timer is not running start it
        // the timer will run the function every time it fires
        timer_run = TRUE;
        [sender setTitle:  @"PRESS TO REST" forState:UIControlStateNormal];
        
        mytimer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target: self selector: @selector(UpdateTime:) userInfo:NULL repeats: YES];
        
        
    }else {
       [mytimer invalidate];
        timer_run = FALSE;
       [sender setTitle:  @"PRESS TO BEGIN AGAIN" forState:UIControlStateNormal];
    }
}

-(IBAction) sliderIntensity: (id) sender{
    UISlider *slider = (UISlider *) sender;
    intensity = (slider.value);
    
}
- (void) UpdateTime:(NSTimer *) mytimer{
    
    fifthSecond +=  0.2;
    
    points += (float) intensity/(5* 60) ;
    
    if (fifthSecond > 60) {
        fifthSecond = 0;
        minutes ++;
    }
    
    NSString * timeString = [[NSNumber alloc ]initWithFloat:minutes ].stringValue;
    //TODO: Format the text so it looks nice. How 'bout a float. OK
    
    timeString = [timeString stringByAppendingFormat: @":%.1f", fifthSecond];
    
    points_label.text = [@"Points:" stringByAppendingFormat: @"%.2f", points];
    
    //points_label.text = [[NSNumber alloc ]initWithFloat:intensity].stringValue;
    
    stopwatch.text = timeString;
    
    
}

@end

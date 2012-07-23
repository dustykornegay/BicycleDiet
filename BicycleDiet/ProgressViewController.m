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
#import "BicycleDietCommon.h"


@interface ProgressViewController ()

@end

@implementation ProgressViewController
@synthesize totalgoal_points;
@synthesize totalpoints_earned;
@synthesize totalpoints_earnedtoday;
@synthesize dietGoal;
@synthesize exerciseGoal;

@synthesize exerciseProgress;
@synthesize dietProgress;
@synthesize totalProgress;
@synthesize user_id;
@synthesize inspiration;
@synthesize inspirationArray;
@synthesize visible;

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
    
    index = 0;
    //initialize inspiration timer
    inspirationTimer = [NSTimer scheduledTimerWithTimeInterval: 60 target: self selector: @selector(getInspiration:) userInfo:NULL repeats: YES];
    
	    
     
}

-(void)viewDidAppear:(BOOL)animated {
    visible = TRUE;
    
    // Do any additional setup after loading the view.
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    user_id = appDelegate.user_id ;
    
    
    NSLog(@"ProgressView Loaded");
    NSLog(@"%i",user_id);
    
    int totalearned = [weightlimit GetPointsEarnedTotal: user_id];
    int totalgoal = [weightlimit GetPointsTotal_goal:user_id];
    
    
    dietGoal.text = @"Goal Not Set";
    exerciseGoal.text = @"Goal Not Set";
    
    
    
    dietProgress.progress = (float)500/(float)1000;
    
    if ((totalgoal != 0)){
        totalProgress.progress = (float) totalearned / (float) totalgoal;
    } else {
        totalgoal = 0;
    } 
    
    totalgoal_points.text = [[NSNumber alloc ]initWithInt:totalgoal ].stringValue;
    
    totalpoints_earned.text = [[NSNumber alloc ]initWithInt:totalearned ].stringValue; 
    
    
    
    [self getGoals:user_id];
    
    // TODO: load from DB from activity table where date = today AND user = user_id
    totalpoints_earnedtoday.text = @"1550";
    
    // Use weightlimit Database Select  with sql for date an user_id
 
    //TODO: update progress from data base
  //  NSString * sql = [@"Select * from status where"  stringByAppendingFormat: @"user_id =  %i AND date = %@ AND activity_id = %i", user_id, date, ];
  
   // [weightlimit Database_select: sql];
    
}

-(void)viewDidDisappear:(BOOL)animated {
    
    visible = FALSE;
    
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

-(void)getGoals: (int)user {
   
    NSString * sql = [ @"Select * from username where user_id = " stringByAppendingFormat: @" %i", user];
    
    DBController * myDB = [[DBController alloc] init]; 
    
    if([myDB DBdatafieldToUserArray:sql ]){
        Users * temp = [myDB obj_array].lastObject;
        
        pointsEarned_diet = temp.dailyDiet_goal;
        pointsEarned_exercise = temp.dailyExercise_goal;
        
        exerciseGoal.text = [@"" stringByAppendingFormat: @"%i", pointsEarned_diet];
        dietGoal.text = [@"" stringByAppendingFormat: @"%i", pointsEarned_exercise ];
    }
}


//add timer to randomly update inspration from database
-(void)getInspiration: (NSTimer *)inspirationTimer{
    
    //No inspiration updates loads while this page isn't visible
    if (visible){
    NSString * sql = @"Select * from inspiration where personality_id = 0 ";
    

    // chack the database
    
    DBController *mydb = [[DBController alloc] init];
    
   
    if([mydb DBgetInspirationArray: sql ]){
        
        // TODO: Total points earned from sql: Select Points where Date: "today" and Activity= "Exercise"
        
        
        self.inspirationArray = mydb.obj_array;
        
        
    }else {
        self.inspirationArray = nil;
    }
    
    //set the inspiration label
    
    if (index < inspirationArray.count){
    Inspiration * LaoTsu = [inspirationArray objectAtIndex:index] ;
    inspiration.text = LaoTsu.quote;
        index ++;
    
    }else {
        index = 0;
      //  Load next five inspirational messages from database
    }
    
    }

}

@end

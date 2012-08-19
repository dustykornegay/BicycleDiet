//
//  ProgressViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProgressViewController.h"
#import "ProgressView.h"
#import "BicycleDietCommon.h"
#import "GraphView.h"


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
@synthesize graph;

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


- (void) viewWillAppear:(BOOL)animated{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    user_id = appDelegate.user_id ;
    appDelegate.graph = [ProgressViewController PopulateGraph: 1 UserID: user_id];
    
}

-(void)viewDidAppear:(BOOL)animated {
    visible = TRUE;
    
    // Do any additional setup after loading the view.
    
    int totalearned = [weightlimit GetPointsEarnedTotal: user_id];
    
    int totalgoal = [weightlimit GetPointsTotal_goal:user_id];
    
    
    dietGoal.text = @"Goal Not Set";
    exerciseGoal.text = @"Goal Not Set";
    
    graph = [ProgressViewController PopulateGraph: 1 UserID: user_id];
    
    if ((totalgoal != 0)){
        totalProgress.progress = (float) totalearned / (float) totalgoal;
    } else {
        totalgoal = 0;
    } 
    
    totalgoal_points.text = [[NSNumber alloc ]initWithInt:totalgoal ].stringValue;
    
    totalpoints_earned.text = [[NSNumber alloc ]initWithInt:totalearned ].stringValue; 
    
    [self getGoals:user_id];
    
    // TODO: load from DB from activity table where date = today AND user = user_id
    
    pointsEarned_diet =  [weightlimit GetPointsEarnedToday:user_id Type: @"Diet"];
    
    //Error Code accessing DB -2: No object  -1: SQL error
    if (pointsEarned_diet < 0) {
        NSLog(@"Database Error Diet Points %i", pointsEarned_diet);
        pointsEarned_diet =0;
    }
    
    pointsEarned_exercise = [weightlimit GetPointsEarnedToday:user_id Type: @"Exercise"];
    
    //Error Code accessing DB -2: No object  -1: SQL error
    if (pointsEarned_exercise < 0) {
        NSLog(@"Database Error Exercise Points %i", pointsEarned_exercise);
        pointsEarned_exercise = 0;
    }
    
    
    
    dietProgress.progress = (float)pointsEarned_diet/(float) diet_goal;
    
    exerciseProgress.progress = (float)pointsEarned_exercise /(float) exercise_goal;
    
    totalpoints_earnedtoday.text = [[NSNumber alloc] initWithInt: (pointsEarned_diet + pointsEarned_exercise)].stringValue  ;
    
    GraphView * mygoal;
    
    [self.view addSubview: mygoal];
    
    [mygoal setNeedsDisplay];
    [self.view setNeedsDisplay];
  
    
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
  //todo
        
        diet_goal = temp.dailyDiet_goal;
        exercise_goal = temp.dailyExercise_goal;
        
        exerciseGoal.text = [@"" stringByAppendingFormat: @"%i", exercise_goal];
        dietGoal.text = [@"" stringByAppendingFormat: @"%i", diet_goal ];
    }
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //set quiz_id to 0-Fact Quiz, 1-DietQuiz  
    if ([[segue identifier] isEqualToString: @"PrepareToEat"]){
        
        appDelegate.quiz_id = 1 ;
        
    }
    
    if ([[segue identifier] isEqualToString: @"FactQuiz"]){
        
        appDelegate.quiz_id = 0 ;
        
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


+ (NSMutableArray *) PopulateGraph: (int) weeks UserID: (int) user_id{
     
    NSMutableArray * graph = [[NSMutableArray alloc]init];
    
    NSString * sql = [[NSString alloc] init];
    //Store Exercise points in an array [7, 14, 28, 56, 70 140, 280 days)
    
    for (int i = 1+ (7 * weeks); i >= 0; i-- ){
        
        float width = (float) WIDTH;
        
        NSString * date  =  [weightlimit GetDate: i]; // what day was it i days ago
        
        // select * from status where date like '%JUN2012';
        // query point for each day and store them in an array. [x= today, y= points]
        sql = @"";
     
        sql =  [sql stringByAppendingFormat: @"Select * from status where date like '%@' and user_id = '%i'", date , user_id];
        
        MultiDPoint *temp = [[MultiDPoint alloc] init];
        temp.x  = (width - (i * width/(7 * weeks)))  ; //staring at the left of the graph, walk forward for every day i
        temp.y =  (float)[weightlimit Database_select: sql];
        
       
        
        if (temp.y < 0) {temp.y = 0;}
        
       [graph addObject:temp ];
        
        
    }
     return  graph;
    
}

@end

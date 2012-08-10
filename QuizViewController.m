//
//  QuizViewController.m
//  BicycleDiet
//
//  Created by Digital on 8/7/12.
//
//

#import "QuizViewController.h"
#import "AppDelegate.h"

@interface QuizViewController ()

@end

@implementation QuizViewController


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
}

- (void) viewWillAppear:(BOOL)animated{
    //get the type of quiz and user_id from the appDelegate
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    quiz_id = appDelegate.quiz_id;
    user_id = appDelegate.user_id;
    
    //Load the question numbers into an array
    //TODO: Select * from quiz where quiz_id = ? ; 1= Eat 0= Diet Facts
    //for Eat quiz display the points before they are selected
    //set the local count variable to be used by Next Question
    
    quizQuestion = [[Question alloc] init];
    
}

- (IBAction) ChooseA{
    [self Tally: 1];
    
}

- (IBAction) ChooseB{
    [self Tally: 1];
}

- (IBAction) ChooseC{
    [self Tally: 1];
}
- (IBAction) ChooseD{
    [self Tally: 1];
}
- (IBAction) ChooseE{
    [self Tally: 1];
}

- (IBAction) ChooseOther{
    [self Tally: 1];
}


- (void) Tally: (int) pointsForAnswer{
    //Add points earned from previous question to running Tally
    score += pointsForAnswer;
    
    [self ShowAnswer];
    
}

- (void) Next{
    //Display the next question
    
}

- (void) ShowAnswer{
    
}

- (void) SubmitQuiz{
    
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

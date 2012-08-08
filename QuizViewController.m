//
//  QuizViewController.m
//  BicycleDiet
//
//  Created by Digital on 8/7/12.
//
//

#import "QuizViewController.h"

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

- (void) viewDidAppear:(BOOL)animated{
    //get the type of quiz and user_id from the appDelegate
    
    //Load the question numbers into an array
    //TODO: Select * from quiz where quiz_id = ? ; 1= Eat 0= Diet Facts
    //for Eat quiz display the points before they are selected
    //set the local count variable to be used by Next Question
    
}

- (void) Tally{
    //Add points earned from previous question to runnig Tally
    
    
}

- (void) NextQuestion{
    //Display the next question
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

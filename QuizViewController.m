//
//  QuizViewController.m
//  BicycleDiet
//
//  Created by Digital on 8/7/12.
//
//

#import "QuizViewController.h"
#import "AppDelegate.h"
#import "BicycleDietCommon.h"

@interface QuizViewController ()

@end

@implementation QuizViewController
@synthesize question,answerA,answerB,answerC,answerD,answerE,answerOther,answer;



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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    quiz_id = appDelegate.quiz_id;
    user_id = appDelegate.user_id;
    i = 0;
    
    NSLog(@"You are about to enter the QuizView with quiz_id= %i",quiz_id);
    //Load the question numbers into an array
    //TODO: Select * from quiz where quiz_id = ? ; 1= Eat 0= Diet Facts
    //for Eat quiz display the points before they are selected
    //set the local count variable to be used by Next Question
    
    quizQuestion = [[Question alloc] init];
    
}

- (IBAction) ChooseA{
    [self Tally: quizQuestion.points1];
    
}

- (IBAction) ChooseB{
    [self Tally: quizQuestion.points2];
    
}

- (IBAction) ChooseC{
    [self Tally: quizQuestion.points3];
}
- (IBAction) ChooseD{
    [self Tally: quizQuestion.points4];
}
- (IBAction) ChooseE{
    [self Tally: quizQuestion.points5];
}

- (IBAction) ChooseOther{
    [self Tally: 0];
}


- (void) Tally: (int) pointsForAnswer{
    //Add points earned from previous question to running Tally
    score += pointsForAnswer;
    
    [self ShowAnswer];
    
}

- (void) Next{
    //clear previous answer
    
    answer.text = @"";
    //Display the next question
    NSString * sql = [ @"Select * from question where question_id = " stringByAppendingFormat: @" %i", 1];
    
    DBController * myDB = [[DBController alloc] init];
    
    if([myDB DBdatafieldToQuestionArray:sql ]){
        if (i < [myDB obj_array ].count){
        quizQuestion = [[myDB obj_array] objectAtIndex: i];
            
        question.text = quizQuestion.question;
        
        NSLog (@"%@", question.text);
        
        answerA.text = quizQuestion.choice1;
         NSLog (@"%@", quizQuestion.choice1);
        
        answerB.text = quizQuestion.choice2;
        answerC.text = quizQuestion.choice3;
        answerD.text = quizQuestion.choice4;
        answerE.text = quizQuestion.choice5;
        
            i ++;}
        
        else {
                i =0;
            }

    }
        
        
       
}

- (void) ShowAnswer{
    switch (quizQuestion.bestAnswer){
    case 1:
        answer.text = @"A";
        break;
            
    case 2:
        answer.text = @"B";
        break;
            
    case 3:
        answer.text = @"C";
        break;
            
    case 4:
        answer.text = @"D";
        break;
            
    case 5:
        answer.text = @"E";
        break;
            
     default:
            answer.text = @"No Best Answer Defined";
        break;
        
    }
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

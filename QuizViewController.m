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
@synthesize question,answerA,answerB,answerC,answerD,answerE,answerOther,answer, questionNumber;
@synthesize points1, points2,points3, points4, points5;


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
    NSString * sql = [ @"Select * from quiz where quiz_id = " stringByAppendingFormat: @" %i", quiz_id];
    
    DBController * myDB = [[DBController alloc] init];
    
    if ([myDB DBdatafieldToIntegerArray:sql]){
    questionNumber = [myDB obj_array];
    }
        
    quizQuestion = [[Question alloc] init];
    
    [self Next];
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
    NSString * sql = [[NSString alloc] init];
    //Display the next question
    if (i < questionNumber.count){
        
      NSNumber * index = [[self questionNumber] objectAtIndex: i ];
        
        sql = [ @"Select * from question where question_id = " stringByAppendingFormat: @" %i", index.intValue ];
   
        NSLog(@"%@", sql);
    DBController * myDB = [[DBController alloc] init];
    
    if([myDB DBdatafieldToQuestionArray:sql ]){
      
        quizQuestion = [[myDB obj_array] lastObject];
            
        question.text = quizQuestion.question;
        
        NSLog (@"%@", question.text);
        
        answerA.text = quizQuestion.choice1;
         NSLog (@"%@", quizQuestion.choice1);
        
        answerB.text = quizQuestion.choice2;
        answerC.text = quizQuestion.choice3;
        answerD.text = quizQuestion.choice4;
        answerE.text = quizQuestion.choice5;
        
        //TODO: connect points and display them if eat quiz
        if (quiz_id == 1) {
            //display points
          
            points1.text = [[NSNumber alloc] initWithInt: quizQuestion.points1].stringValue;
            points2.text = [[NSNumber alloc] initWithInt: quizQuestion.points2].stringValue;
            points3.text = [[NSNumber alloc] initWithInt: quizQuestion.points3].stringValue;
            points4.text = [[NSNumber alloc] initWithInt: quizQuestion.points4].stringValue;
            points5.text = [[NSNumber alloc] initWithInt: quizQuestion.points5].stringValue;
           
        }
        
        
    }
        i++;
        
    }else {
                i =0;
        NSLog(@"Last Question");
        //show points

        //change title to submit
        [self SubmitQuiz];
        
        }

    
}
        
       


- (void) ShowAnswer{
    int max = quizQuestion.points1;
    int item = 1;
    
    if (max < quizQuestion.points2){item = 2; max = quizQuestion.points2; }
        
    if (max < quizQuestion.points3){item = 3; max = quizQuestion.points3; }
    
    if (max < quizQuestion.points4){item = 4; max = quizQuestion.points4; }
    
    if (max < quizQuestion.points5){item = 5; max = quizQuestion.points5; }

    max = 0;
    switch (item){
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
    
    NSLog(@"TotalPoints for this quiz= %i", score);
    // submit score to database under activity = "Diet", user_id = self.user_id;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //Open Database, submit points with activity id exercise , and user_id matching the user
    NSString * sql_com = [@"insert into status" stringByAppendingFormat: @" Values(%i,'Diet', '%@', '%@' ,%i)", appDelegate.user_id, [weightlimit GetTime], [weightlimit GetDate: 0], score ];
    
    
    DBController * mydB = [[DBController alloc] init];
    
    if([mydB DBPush: sql_com]){
        
        //Reset points to 0
        
        score = 0;
              
        
        appDelegate.points = 0;
    }else {
        NSLog(@"failed to push exercise points into the status table");
    }
    
    // call segue to return to prior View
    [self.navigationController popViewControllerAnimated:YES];
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

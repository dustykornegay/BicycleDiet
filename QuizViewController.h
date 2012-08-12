//
//  QuizViewController.h
//  BicycleDiet
//
//  Created by Digital on 8/7/12.
//
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface QuizViewController : UIViewController{
    UILabel * question;
    UILabel * answerA;
    UILabel * answerB;
    UILabel * answerC;
    UILabel * answerD;
    UILabel * answerE;
    UITextField * answerOther;
    
    UILabel * answer;
    
    int score;
    
    int pointspossible;
    
    //Used to retrieve a quiz and store points in database
    int user_id;
    int quiz_id;
    int i;
    
    Question * quizQuestion;
    NSMutableArray * questionNumber;
        
}

@property (nonatomic, retain) IBOutlet UILabel *question;
@property (nonatomic, retain) IBOutlet UILabel *answerA;
@property (nonatomic, retain) IBOutlet UILabel *answerB;
@property (nonatomic, retain) IBOutlet UILabel *answerC;
@property (nonatomic, retain) IBOutlet UILabel *answerD;
@property (nonatomic, retain) IBOutlet UILabel *answerE;
@property (nonatomic, retain) IBOutlet UITextField *answerOther;

@property (nonatomic, retain) IBOutlet UILabel *answer;
@property (nonatomic, retain) NSMutableArray * questionNumber;

- (IBAction) ChooseA;
- (IBAction) ChooseB;
- (IBAction) ChooseC;
- (IBAction) ChooseD;
- (IBAction) ChooseE;
- (IBAction) ChooseOther;

- (void) ShowAnswer;

-(IBAction)Next;
@end

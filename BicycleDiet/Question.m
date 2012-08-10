//
//  Question.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Question.h"

@implementation Question
@synthesize question_id, question, choice1, choice2, choice3, choice4, choice5, bestAnswer;
@synthesize points1, points2, points3, points4, points5;

-(id)initWithUserId:(int)anId andQuestion:(NSString*)aQuestion andChoice1:(NSString*)firstChoice andChoice2:(NSString*) secondChoice andChoice3: (NSString*)thirdChoice  andChoice4: (NSString*)fourthChoice andChoice5: (NSString*)fifthChoice andAnswer: (int)theAnswer andPoints1: (int)Points1 andPoints2: (int) Points2 andPoints3: (int)Points3 andPoints4: (int) Points4 andPoints5: (int)Points5 {
       
    
    if (self){ 
        self.question_id = anId;
        self.question = aQuestion;
        
        self.choice1 = firstChoice;
        self.choice2 = secondChoice;
        self.choice3 = thirdChoice;
        self.choice4 = fourthChoice;
        self.choice5 = fifthChoice;
        
        self.bestAnswer = theAnswer;
        
        self.points1 = Points1;
        self.points2 = Points2;
        self.points3 = Points3;
        self.points4 = Points4;
        self.points5 = Points5;
                
         }
    return self;
}


@end

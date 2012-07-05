//
//  Question.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Question.h"

@implementation Question
@synthesize question_id, question, choice1, choice2, choice3, choice4, choice5, answer, points;

-(id)initWithUserId:(int)anId andQuestion:(NSString*)aQuestion andChoice1:(NSString*)firstChoice andChoice2:(NSString*) secondChoice andChoice3: (NSString*)thirdChoice  andChoice4: (NSString*)fourthChoice andChoice5: (NSString*)fifthChoice andAnswer: (int)theAnswer andPoints: (int)somePoints{
       
    
    if (self){ 
        self.question_id = anId;
        self.question = aQuestion;
        self.choice1 = firstChoice;
         self.choice2 = secondChoice;
         self.choice3 = thirdChoice;
         self.choice4 = fourthChoice;
         self.choice5 = fifthChoice;
        self.answer = theAnswer;
        self.points = somePoints;
                
         }
    return self;
}


@end

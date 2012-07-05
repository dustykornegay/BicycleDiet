//
//  Question.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject {
    int question_id;
    NSString *question;
    NSString *choice1;
    NSString *choice2; 
    NSString *choice3; 
    NSString *choice4;
    NSString *choice5; 
    int answer;
    int points;
}
@property (nonatomic) int question_id;
@property (nonatomic, retain)NSString *question;
@property (nonatomic, retain)NSString *choice1;
@property (nonatomic, retain)NSString *choice2;
@property (nonatomic, retain)NSString *choice3;
@property (nonatomic, retain)NSString *choice4;
@property (nonatomic, retain)NSString *choice5;
@property (nonatomic) int answer;
@property (nonatomic) int points;

-(id)initWithUserId:(int)anId andQuestion:(NSString*)aQuestion andChoice1:(NSString*)firstChoice andChoice2:(NSString*) secondChoice andChoice3: (NSString*)thirdChoice  andChoice4: (NSString*)fourthChoice andChoice5: (NSString*)fifthChoice andAnswer: (int)theAnswer andPoints: (int)somePoints;
@end

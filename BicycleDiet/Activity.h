//
//  Activity.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject {
    int user_id;            //record which user performed the activity
    int type;               // 1- Exercise 2-Snack 3-Meal 4-Quiz
    int points;             // delta calories burned/ fewer calories consumed 
    NSDate * timestamp;     //record time of the activity
}


@property (nonatomic) int user_id;
@property (nonatomic) int  type;
@property (nonatomic) int  points;
@property (nonatomic, retain) NSDate* timestamp;

-(id)initWithTimeStamp:(NSDate *) tStamp
            andId:(int)anId
            andType:(int)aType
        andPoints:(int)somePoints;
        
@end

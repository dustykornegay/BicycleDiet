//
//  ProgressViewController.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressViewController : UIViewController{
    int dailyGoal_points;
    int totalGoal_points;
    
    int pointsEarned_diet;
    int pointsEarned_exercise;
    int pointsEarned_quiz;
    int pointsEarned_total;
    
    int user_id;
    
    NSMutableArray * inspirationArray;
    NSTimer * inspirationTimer;
    int index;
    BOOL visible;
}
@property int user_id;
@property BOOL visible;

@property (nonatomic, retain) IBOutlet UILabel *dietGoal;
@property (nonatomic, retain) IBOutlet UILabel *exerciseGoal;

@property (nonatomic, retain) IBOutlet UILabel *totalgoal_points;
@property (nonatomic,retain) IBOutlet UILabel *totalpoints_earned;
@property (nonatomic, retain) IBOutlet UILabel *totalpoints_earnedtoday;
@property (nonatomic, retain) IBOutlet UILabel *inspiration;

@property (nonatomic, retain) IBOutlet UIProgressView *exerciseProgress;
@property (nonatomic, retain) IBOutlet UIProgressView *dietProgress;
@property (nonatomic, retain) IBOutlet UIProgressView *totalProgress;

@property (nonatomic,retain) NSArray * inspirationArray;

-(id)initWithUserId: (int) User_id;

-(void)getInspiration: (NSTimer *)inspirationTimer;



@end

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
}
@property int user_id;

@property (nonatomic, retain) IBOutlet UILabel *totalgoal_points;
@property (nonatomic,retain) IBOutlet UILabel *totalpoints_earned;
@property (nonatomic, retain) IBOutlet UILabel *totalpoints_earnedtoday;

@property (nonatomic, retain) IBOutlet UIProgressView *exerciseProgress;
@property (nonatomic, retain) IBOutlet UIProgressView *dietProgress;
@property (nonatomic, retain) IBOutlet UIProgressView *totalProgress;

-(id)initWithUserId: (int) User_id;

@end

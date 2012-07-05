//
//  ProgressView.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/20/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView {
    
    IBOutlet UILabel *totalgoal_points;
    
    
}
@property (nonatomic, retain) IBOutlet UILabel *totalgoal_points;
@property (nonatomic, retain) IBOutlet UILabel *pointsEarnedtoday_Exercise;
@property (nonatomic, retain) IBOutlet UILabel *pointsEarnedtoday_Diet;
@property (nonatomic, retain) IBOutlet UILabel *pointsEarnedtoday_Total;
@property (nonatomic, retain) IBOutlet UILabel *pointsEarnedTotal;
@property (nonatomic, retain) IBOutlet UILabel *inspiration;

@property (nonatomic, retain) IBOutlet UIButton *ExerciseGoal_button;
@property (nonatomic, retain) IBOutlet UIButton *DietGoal_button;


@property (nonatomic, retain) IBOutlet UIProgressView *exercise_todaysprogress;
@property (nonatomic, retain) IBOutlet UIProgressView *diet_todaysprogress;
@property (nonatomic, retain) IBOutlet UIProgressView *totalprogress;

-(IBAction) doExerciseGoal_button;
-(IBAction) doDietGoal_button;


@end

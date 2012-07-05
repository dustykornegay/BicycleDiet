//
//  SetGoal.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/16/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetGoal : UIView <UITextFieldDelegate> {
    IBOutlet UITextField * namefield;
    IBOutlet UITextField * height_ft_field;
    IBOutlet UITextField * height_in_field;
    IBOutlet UITextField * goal;
    IBOutlet UITextField * current_weight;
    int gender;
    float waist;
    float suggested;
    
    
}

@property (nonatomic) int gender;
@property (nonatomic) int points;
@property (nonatomic) float suggested;


@property (nonatomic, retain) IBOutlet UITextField *namefield;
@property (nonatomic, retain) IBOutlet UITextField *height_ft_field;
@property (nonatomic, retain) IBOutlet UITextField *height_in_field;
@property (nonatomic, retain) IBOutlet UITextField *goal;
@property (nonatomic, retain) IBOutlet UITextField *current_weight;

@property (nonatomic, retain) IBOutlet UIButton *gender_button;
@property (nonatomic, retain) IBOutlet UIButton *suggestgoal_button;
@property (nonatomic, retain) IBOutlet UIButton *acceptgoal_button;


-(IBAction)doGender_button: (id) sender;
-(IBAction)doSuggestgoal_button;
-(IBAction)doAcceptgoal_button;
-(IBAction)sliderchanged: (id) sender;



@end

//
//  ExerciseViewController.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseViewController : UIViewController{
    UILabel * unsubmittedpoints;
    int points_earned;
}

@property (nonatomic,retain)IBOutlet UILabel * unsubmittedpoints;


-(IBAction) SubmitPoints: (id)sender;

@end

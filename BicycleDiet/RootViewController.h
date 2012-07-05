//
//  RootViewController.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/2/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController <UIPageViewControllerDelegate> {

    BOOL moveUp;
    CGFloat scrollAmount;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (nonatomic, retain) UIView *SetGoal;




@end

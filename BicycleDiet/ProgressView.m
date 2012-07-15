//
//  ProgressView.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/20/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import "ProgressView.h"
#import "weightlimit.h"


@implementation ProgressView
@synthesize totalgoal_points = _totalgoal_points;
@synthesize pointsEarnedtoday_Exercise;
@synthesize pointsEarnedtoday_Diet;
@synthesize pointsEarnedtoday_Total;
@synthesize pointsEarnedTotal;


@synthesize  Goal_button;

@synthesize diet_todaysprogress;
@synthesize exercise_todaysprogress;
@synthesize totalprogress;
@synthesize inspiration;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
       
     
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (UIButton *)Goal_button: (id) sender{
    return sender;
}


@end

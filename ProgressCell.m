//
//  ProgressCell.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/13/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import "ProgressCell.h"
#import "AppDelegate.h"

@implementation ProgressCell
@synthesize username = _username;
@synthesize diet, exercise, total;
@synthesize diet_todaysprogress;
@synthesize exercise_todaysprogress;
@synthesize totalprogress;
@synthesize user_id;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [diet_todaysprogress  setProgress: 0.4];
        [diet_todaysprogress setProgress: 0.1]; 
        [totalprogress setProgress: 0.6];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
  
    
}



@end

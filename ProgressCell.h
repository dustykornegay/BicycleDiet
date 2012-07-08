//
//  ProgressCell.h
//  BicycleDiet
//
//  The prototype for the cell which is loaded into the Tableview.
//  This cell displays the progess of the user.
//  Code automatically generated, and linked from Mainstoryboard.
//
//  Created by Dusty Kornegay on 6/13/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressCell : UITableViewCell


@property (nonatomic,strong) IBOutlet UILabel * username;
@property (nonatomic,strong) IBOutlet UILabel * diet;
@property (nonatomic,strong) IBOutlet UILabel * exercise;
@property (nonatomic,strong) IBOutlet UILabel * total;
@property (nonatomic) int user_id;

@property (nonatomic, retain) IBOutlet UIProgressView *exercise_todaysprogress;
@property (nonatomic, retain) IBOutlet UIProgressView *diet_todaysprogress;
@property (nonatomic, retain) IBOutlet UIProgressView *totalprogress;

@end

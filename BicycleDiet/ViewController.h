//
//  ViewController.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/13/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UITableViewController{
    NSMutableArray * userlist;
    int user_id;
  //  id<ADBannerViewDelegate>;
}
@property (nonatomic,retain) NSArray * userlist;
@property (nonatomic,strong) NSArray * name;

//bannerview objects
@property (strong,nonatomic) ADBannerView *bannerView;



@end

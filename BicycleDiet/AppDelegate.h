//
//  AppDelegate.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "SetGoal.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSMutableArray * user_array;
    NSMutableArray * exercise_array;
    NSMutableArray * snack_array;
    NSMutableArray * meal_array;
}
@property (strong, nonatomic) UIWindow *window;
@property int points;
@property NSMutableArray * user_array;

@end

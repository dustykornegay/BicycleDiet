//
//  AppDelegate.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>



@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSMutableArray * user_array;
    NSMutableArray * graph;
    NSMutableArray * exercise_array;
    NSMutableArray * snack_array;
    NSMutableArray * meal_array;
    
    int points;
    int user_id;
    int quiz_id;
    
}
@property (strong, nonatomic) UIWindow *window;
@property int points;
@property int user_id;
@property int quiz_id;
@property NSMutableArray * user_array;
@property NSMutableArray * graph;

@end

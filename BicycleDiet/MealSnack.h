//
//  MealSnack.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Food.h"

@interface MealSnack : NSObject {
    int MealSnack_id;
    NSString *name;
    Food * myFood;
    int portions;
    
}
@property (nonatomic) int MealSnack_id;
@property (nonatomic,retain) NSString * name;
@property (nonatomic, retain) Food *myFood;
@property (nonatomic) int portions;

-(id) initwithId: (int) MealID andName: (NSString*) aName andFood: (Food*)aFood andPortions: (int) somePortions;

@end

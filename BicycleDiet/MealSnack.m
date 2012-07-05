//
//  MealSnack.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MealSnack.h"

@implementation MealSnack

@synthesize MealSnack_id, name, myFood, portions;

- (id) initwithId: (int) MealID andName: (NSString*) aName andFood: (Food*)aFood andPortions: (int) somePortions{
    
    if(self){
    self.MealSnack_id = MealID;
    self.name = aName;
    self.myFood = aFood;
    self.portions = somePortions;
    }
    
    return self;
}
@end

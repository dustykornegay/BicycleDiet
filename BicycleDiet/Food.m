//
//  Food.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Food.h"

@implementation Food
@synthesize food_id,name, portion_measure,portion_size, caloriesPerPortion;
@synthesize Carbohydrates, Protein, Fat, glycemicIndex;


-initWithId: (int) anId andName: (NSString *)aName andPortionMeasurement: (NSString *) aMeasure andHowManyPortions: (int)numberOfMeasures andCalories: (int)CalPerPortion andCarbs: (int)someCarbs andProtein: (int)someProtein andFat: (int)someFat andGlycemic: (int) Glyc_index {
    
    if (self){
    self.food_id = anId;
    self.name = aName;
    self.portion_measure = aMeasure;
    self.portion_size= numberOfMeasures;
    self.caloriesPerPortion= CalPerPortion;
    self.Carbohydrates =someCarbs;
    self.Protein = someProtein;
    self.Fat= someFat;
    self.glycemicIndex = Glyc_index;
    }
    return self;
}
@end

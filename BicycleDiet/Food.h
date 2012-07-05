//
//  Food.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject{
    
    int food_id;
    NSString * name;
    NSString * portion_measure; // Cups, Ounces, grams, Teaspoons
    int portion_size;       // 3 Tablespoons, 2 Cups 
    int caloriesPerPortion; 
    int Carbohydrates;     //Carb Exchange Per serving
    int Protein;            //Protein Exchange Per serving
    int Fat;                //Fat Exchange Per Serving
    int glycemicIndex;      // glycemic index (for Carbs)
    
}

@property (nonatomic) int food_id;

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* portion_measure;

@property (nonatomic) int  portion_size;
@property (nonatomic) int  caloriesPerPortion;
@property (nonatomic) int  Carbohydrates;
@property (nonatomic) int  Protein;
@property (nonatomic) int  Fat;
@property (nonatomic) int  glycemicIndex;


-(id) initWithId: (int) anId andName: (NSString *)aName andPortionMeasurement: (NSString *) aMeasure andHowManyPortions: (int)numberOfMeasures andCalories: (int)CalPerPortion andCarbs: (int)someCarbs andProtein: (int)someProtein andFat: (int)someFat andGlycemic: (int) Glyc_index;

@end

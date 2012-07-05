//
//  Exercise.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise
@synthesize exercise_id, name,type,intensity,page_number,description,image;

-(id)initWithUserId:(int)anId
            andUser:(NSString*)aName
            andType:(int)aType 
       andIntensity:(int)someIntensity
      andPageNumber:(int)pageNumber
     andDescription:(NSString *)aDescription 
           andImage:(NSObject *) anImage {
    
    if(self){
    self.exercise_id = anId;
    self.name = aName;
    self.type = aType;
    self.intensity = someIntensity;
    self.page_number = pageNumber;
    self.description = aDescription;
    self.image = anImage;
    }
    return self;
}


@end

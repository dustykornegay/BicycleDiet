//
//  Exercise.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercise : NSObject{
    int exercise_id;    // unique id for removing old entries with same name
    NSString *name;     // Name of exercise :)
    int type;           // 1:Cardio 2:Weight Training 3:Mixed
    int intensity;      // Calories per hour    
    int page_number;    // used to order the exercise pictures & descriptions
                        // page zero (0) holds short description used in search 
    
    NSString * description; //holds description of actions in the picture
    NSObject *image;    // pointer to image stored as Blob

}

@property (nonatomic) int exercise_id;
@property (nonatomic, retain) NSString* name;
@property (nonatomic) int  type;
@property (nonatomic) int  intensity;
@property (nonatomic) int page_number;
@property (nonatomic, retain) NSString* description;
@property (nonatomic, retain) NSObject* image;


-(id)initWithUserId:(int)anId
            andUser:(NSString*)aName
            andType:(int)aType 
            andIntensity:(int)someIntensity
            andPageNumber:(int)pageNumber
            andDescription: (NSString *) aDescription
            andImage: (NSObject *) anImage;
            
@end


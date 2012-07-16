//
//  Inspiration.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Inspiration : NSObject{
    int inspired_id;
    NSString *author;
    NSDate * date;
    NSString * quote;
}
@property (nonatomic) int inspired_id;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * quote;

- (id)initWithId:(int) inspiredId andAuthor:(NSString *)By andDate:(NSDate*) aDate andQuote:(NSString *)aQuotation;


@end

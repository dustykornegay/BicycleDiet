//
//  Inspiration.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Inspiration.h"

@implementation Inspiration
@synthesize  inspired_id, author, date, quote;

-(id)initWithId:(int) anId andId:(NSString *)By andDate:(NSDate*) aDate andQuote:(NSString *)aQuotation
{
    if (self){
    self.inspired_id = anId;
    self.author = By;
    self.date = aDate;
    self.quote = aQuotation;
    }
    return self;
}
@end

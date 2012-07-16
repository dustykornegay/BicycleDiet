//
//  DBController.h
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Users.h"

@interface DBController :NSObject{
    sqlite3 *database;
    
    NSString *databasePath;
    NSString *databaseName;
    
    NSMutableArray * obj_array;
  
    Users * a ;
}
@property (nonatomic) NSMutableArray * obj_array;
@property (nonatomic, retain) Users *a;



-(BOOL) DBdatafieldToUserArray:  (NSString *) sql_com ;
-(BOOL) DBdatafieldToActivityArray:  (NSString *) sql_com ;
-(BOOL)  DBgetInspirationArray: (NSString *) sql_com;

-(BOOL) DBPush: (NSString *) sql_com; 

-(void) LoadDatabaseFromFile: (NSString *) filename;


@end


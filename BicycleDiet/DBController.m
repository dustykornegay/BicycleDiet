//
//  DBController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DBController.h"
#import "Users.h"
#import "Activity.h"

@implementation DBController
@synthesize a;
@synthesize obj_array;


- (id)init {
    //TODO: (GCK) Check to see that Library/ApplicationSupport/BicycleDiet/  exists
    // if not create it then add 2 databases to it BD_common.db & BD_user.db
    // User Added data is loaded & retrieved from BD_user.db
    // Downloaded data overwrites the BD_common.db
    
    if ((self = [super init])) {
        
        databaseName = @"bicyclediet.db";
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSString *BundleDbPath = [[NSBundle mainBundle] resourcePath];
        
        BundleDbPath = [BundleDbPath stringByAppendingPathComponent:databaseName ];
        
        NSLog(@"%@",BundleDbPath);
        
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [documentPaths objectAtIndex:0];
        
        databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
        
        if (![fileManager fileExistsAtPath:databasePath]){

        [fileManager moveItemAtPath:BundleDbPath toPath:databasePath  error:nil];
        
        }
        
       if (sqlite3_open([databasePath UTF8String], &database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

-(BOOL) CheckOrCreateDB {
    // Execute the "checkAndCreateDatabase" function
	// Check if the SQL database has already been saved to the users phone, if not then copy it over
	BOOL success;
	
	// Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:databasePath];
    
	// If the database already exists then return without doing anything
	if(!success) {
        
        // If not then proceed to copy the database from the application to the users filesystem
        
        // Get the path to the database in the application package
        NSString *databasePathFromApp =[[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:databaseName];
        
        // Copy the database from the package to the users filesystem
       success = [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
        
        }
    
    return success;
    
    
}

-(BOOL)  DBdatafieldToObjectArray: (NSString *) sql_com{
	
	BOOL success = [self CheckOrCreateDB];
        
	// Query the database for all  records and construct the object array
        
	// Init the  Array
	obj_array = [[NSMutableArray alloc] init];
	
        NSLog(@"database exists");
    
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        sqlite3_extended_result_codes(database, 1);
        
        NSLog (@"Database opened");
        
		// Setup the SQL Statement and compile it for faster access
        
        
		sqlite3_stmt *compiledStatement;
         
        
		if(sqlite3_prepare_v2(database, [sql_com UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
                NSLog (@"inside while");
				
                // TODO:Update this with a select statement so the correct onject type is loaded
                
                int userid = sqlite3_column_int(compiledStatement, 0);
				NSString *user = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				int goal= sqlite3_column_int(compiledStatement, 2);
                int progress= sqlite3_column_int(compiledStatement, 3);
				 
				// Create a new animal object with the data from the database
				Users *a_user = [[Users alloc] initWithUserId:userid andUser:user andGoal:goal andProgress:progress];
				
                
				// Add the animal object to the animals Array
				[obj_array addObject:a_user];
				
            
			}
            success = TRUE;
		}else {
            success = FALSE;
        }
        
        
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
    }


sqlite3_close(database);
    return success;
}

-(BOOL)  DBdatafieldToActivityArray: (NSString *) sql_com{
	
	BOOL success = [self CheckOrCreateDB];
    
	// Query the database for all  records and construct the object array
    
	// Init the  Array
	obj_array = [[NSMutableArray alloc] init];
	
    NSLog(@"database exists");
    
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        sqlite3_extended_result_codes(database, 1);
        
        NSLog (@"Database opened");
        
		// Setup the SQL Statement and compile it for faster access
        
        
		sqlite3_stmt *compiledStatement;
        
        
		if(sqlite3_prepare_v2(database, [sql_com UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
                NSLog (@"inside while");
				
                // TODO:Update this with a select statement so the correct onject type is loaded
                
                int activity_id = sqlite3_column_int(compiledStatement, 1);
				int type = sqlite3_column_int(compiledStatement, 2);

				int points= sqlite3_column_int(compiledStatement, 3);
               
                NSLog( @"ID: %i  Type: %i Points: %i", activity_id, type, points); 
                
				// Create a new animal object with the data from the database
				Activity *an_activity = [[Activity alloc] initWithTimeStamp:nil andId:activity_id andType: type andPoints:points];
				
                
				// Add the animal object to the animals Array
				[obj_array addObject:an_activity];
				
                
			}
            success = TRUE;
		}else {
            success = FALSE;
        }
        
        
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
    }
    
    
    sqlite3_close(database);
    return success;
}




-(void) LoadDatabaseFromFile: (NSString *) filename {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    NSString * filenameToOld = [databaseName stringByAppendingPathComponent: @".old"];
    
    filenameToOld = [documentsDir stringByAppendingPathComponent:filenameToOld ];
    
    //Delete the Dot old file if it exists
    if ([fileManager removeItemAtPath:filenameToOld error: NULL]  == YES){
        NSLog (@"Remove successful");
    }else{
        NSLog (@"Remove failed");
    }
    
    //rename the existing bd to .old
    [fileManager moveItemAtPath:databasePath toPath:filenameToOld  error:nil];
}




@end

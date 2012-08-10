//
//  DBController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DBController.h"
#import "BicycleDietCommon.h"

@implementation DBController
@synthesize a;
@synthesize obj_array;


- (id)init {
    //TODO: (GCK) Check to see that Library/ApplicationSupport/BicycleDiet/  exists
    // if not create it then add 2 databases to it BD_common.db & BD_user.db
    // User Added data is loaded & retrieved from BD_user.db
    // Downloaded data overwrites the BD_common.db
    
    if ((self = [super init])) {
        
        NSString * appSupport = @"ApplicationSupport";
        NSString * myappdir = @"bicycleDiet";
        
        databaseName = @"bicyclediet.db";
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSString *BundleDbPath = [[NSBundle mainBundle] resourcePath];
        
        BundleDbPath = [BundleDbPath stringByAppendingPathComponent:databaseName ];
        
        
        NSArray *libraryPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [libraryPaths objectAtIndex:0];
        
        databasePath = [documentsDir stringByAppendingPathComponent:appSupport];
        
        NSError * myerror;
        
        //create the ApplicationSupportDirectory if it does not exist
        if (![fileManager fileExistsAtPath:databasePath]){
            
            [fileManager createDirectoryAtPath:databasePath withIntermediateDirectories:FALSE attributes:nil error: &myerror];
           NSLog(@"%@",myerror);
        }
        
        //create the bicycleDietdirectory if it doesn't exist
        databasePath = [databasePath stringByAppendingPathComponent: myappdir];
        
        if (![fileManager fileExistsAtPath:databasePath]){
            
            [fileManager createDirectoryAtPath:databasePath withIntermediateDirectories:FALSE attributes:nil error: &myerror];
           NSLog(@"%@",myerror);
        }
        
        //copy database to databasePath if it doesn't exist
        databasePath = [databasePath stringByAppendingPathComponent:databaseName];
        
        if (![fileManager fileExistsAtPath:databasePath]){
            
            if( ![fileManager copyItemAtPath:BundleDbPath toPath:databasePath error: & myerror]){
                NSLog(@"%@",myerror);
            }
        
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




-(BOOL) DBPush: (NSString *) sql_com{
    BOOL success = [self CheckOrCreateDB];
    
    // Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        sqlite3_extended_result_codes(database, 1);
        
		// Setup the SQL Statement and compile it for faster access
        
        
		sqlite3_stmt *compiledStatement;
        
        
		if(sqlite3_prepare_v2(database, [sql_com UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            //push data into the database is not dependent on a data object
            //it doesn't load any data for later use
            
            if(sqlite3_step(compiledStatement)){
            success = TRUE;
            
		}else {
            success = FALSE;
           NSLog(@"data was not pushed to database");
        }
        }
        
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
    }
    
    
    sqlite3_close(database);
    return success;
    
}

-(BOOL)  DBdatafieldToUserArray: (NSString *) sql_com{
	
	BOOL success = [self CheckOrCreateDB];
        
	// Query the database for all  records and construct the object array
        
	// Init the  Array
    
	obj_array = [[NSMutableArray alloc] init];
    
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
       
        sqlite3_extended_result_codes(database, 1);
        
             
		// Setup the SQL Statement and compile it for faster access
                
		sqlite3_stmt *compiledStatement;
         
        
		if(sqlite3_prepare_v2(database, [sql_com UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
            
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
				// Read the data from the result row
				
                // TODO:Update this with a select statement so the correct onject type is loaded
                
                int userid = sqlite3_column_int(compiledStatement, 0);
                
				NSString *user = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                
				int goal= sqlite3_column_int(compiledStatement, 2);
                
                int progress= sqlite3_column_int(compiledStatement, 3);
                
                int exercisegoal = sqlite3_column_int(compiledStatement, 4);
                
                int exerciseduration = sqlite3_column_int(compiledStatement, 6);
                
                int dietgoal = sqlite3_column_int(compiledStatement, 7);
				 
				// Create a new animal object with the data from the database
				Users *a_user = [[Users alloc] initWithUserId:userid andUser:user andGoal:goal andProgress:progress andExerciseGoal: exercisegoal andExerciseDuration: exerciseduration andDietGoal: dietgoal];
				
                
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
    
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        
        sqlite3_extended_result_codes(database, 1);
               
		// Setup the SQL Statement and compile it for faster access
        
		sqlite3_stmt *compiledStatement;
        
         
		if(sqlite3_prepare_v2(database, [sql_com UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
               // NSLog (@"inside Activity while");
				
                // TODO:Update this with a select statement so the correct onject type is loaded
                
                int user_id = sqlite3_column_int(compiledStatement, 0);
				int type = sqlite3_column_int(compiledStatement, 1);
               // NSString * activity_id = sqlite3_column_int(compiledStatement, 2);
                
				int points= sqlite3_column_int(compiledStatement, 4);
               
             
                
				// Create a new animal object with the data from the database
				Activity *an_activity = [[Activity alloc] initWithTimeStamp:nil andId:user_id andType: type andPoints:points];
				
                
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


-(BOOL)  DBgetInspirationArray: (NSString *) sql_com{
	
	BOOL success = [self CheckOrCreateDB];
    
	// Query the database for all  records and construct the object array
    
	// Init the  Array
	obj_array = [[NSMutableArray alloc] init];
    
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        sqlite3_extended_result_codes(database, 1);
        
		// Setup the SQL Statement and compile it for faster access
        
        
		sqlite3_stmt *compiledStatement;
        
        //TODO: Update this so it loads five random messages from the database 
        
		if(sqlite3_prepare_v2(database, [sql_com UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
            
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
				// Read the data from the result row
    				
				int inspiredID = sqlite3_column_int(compiledStatement, 0);
                
                NSString  * quote = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                
                
				// Create a new inspiration object with the data from the database
				Inspiration *someInspiration = [[Inspiration alloc] initWithId: inspiredID andAuthor:0 andDate:0 andQuote: quote ];
				
                
				// Add the animal object to the animals Array
				[obj_array addObject:someInspiration];
				
                
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


-(BOOL)  DBdatafieldToQuestionArray: (NSString *) sql_com{
	
	BOOL success = [self CheckOrCreateDB];
    
	// Query the database for all  records and construct the object array
    
	// Init the  Array
	obj_array = [[NSMutableArray alloc] init];
    
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        
        sqlite3_extended_result_codes(database, 1);
        
		// Setup the SQL Statement and compile it for faster access
        
		sqlite3_stmt *compiledStatement;
        
        
		if(sqlite3_prepare_v2(database, [sql_com UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
                // NSLog (@"inside Activity while");
				
                // TODO:Update this with a select statement so the correct onject type is loaded
                
                int question_id = sqlite3_column_int(compiledStatement, 0);
				
                NSString * quest = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                
                int number_answer= sqlite3_column_int(compiledStatement, 2);
                
                NSString * choiceA = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                int aA = sqlite3_column_int(compiledStatement, 3);
                
                NSString * choiceB = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
                int b = sqlite3_column_int(compiledStatement, 5);
                
                NSString * choiceC = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)];
                int c = sqlite3_column_int(compiledStatement, 7);
                
                NSString * choiceD = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 8)];
                int d = sqlite3_column_int(compiledStatement, 9);
                
                NSString * choiceE = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 10)];
                int e = sqlite3_column_int(compiledStatement, 11);
                
                
				
                
                
                
				// Create a new animal object with the data from the database
				Question * a_question = [[Question alloc] initWithQuestionId:question_id andQuestion: quest andChoice1:choiceA andChoice2:choiceB andChoice3:choiceC andChoice4: choiceD andChoice5:choiceE andAnswer:number_answer andPoints1: aA andPoints2:b andPoints3:c andPoints4:d andPoints5:e];
				
                
				// Add the animal object to the questionArray
				[obj_array addObject:a_question];
                
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




-(int) DBGetUserID: (NSString *) username {

    NSString * sql = [@"Select user_id where username = " stringByAppendingFormat: @" %@", username];
    
    if ([self DBdatafieldToUserArray: (NSString *) sql]){
        
        if (obj_array.count > 0){
            
        Users * temp = [obj_array lastObject];
        
            return temp.user_id;
            
        }else {
            
            return -2;
        }
    }else {
        
        return -1;
    }
}




-(int) DBGetNewUserID {
    NSString * sql = @"Select max(user_id) from username";
    int user_id = -1; 
    
    if ([self CheckOrCreateDB]){
       
    // Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {

		// Setup the SQL Statement and compile it for faster access
		sqlite3_stmt *compiledStatement;
        
		if(sqlite3_prepare_v2(database, [sql UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            if(sqlite3_step(compiledStatement)){
    
                user_id = sqlite3_column_int(compiledStatement, 0);
            }
        }
        
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
    }
    
    sqlite3_close(database);
    }
    
    user_id ++;
    return user_id ;
    
}




-(void) DeleteUser: (int)user {
    
    NSString * sql = [ @"" stringByAppendingFormat: @"DELETE FROM username where user_id = %i", user]; 
    
    [self DBPush: sql];
    
    sql = [ @"" stringByAppendingFormat: @"DELETE FROM status where user_id = %i", user];
    
    [self DBPush: sql];

    
}




-(void) LoadDatabaseFromFile: (NSString *) filename {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    NSString * filenameToOld = [databaseName stringByAppendingFormat:@".old"];
    
    filenameToOld = [documentsDir stringByAppendingPathComponent:filenameToOld ];
    
    //Delete the Dot old file if it exists
    if ([fileManager removeItemAtPath:filenameToOld error: NULL]  == YES){
  
    }else{
        NSLog (@"Remove failed");
    }
    
    //rename the existing bd to .old
    [fileManager moveItemAtPath:databasePath toPath:filenameToOld  error:nil];
}




@end

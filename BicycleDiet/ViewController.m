//
//  ViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/13/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

//Controllers
#import "ViewController.h"
#import "AppDelegate.h"
#import "DBController.h"
#import "ProgressViewController.h"

//Cells & Views
#import "ProgressCell.h"
#import "CreateUserCell.h"
#import "EmptyCell.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize userlist;
@synthesize name = _name;
@synthesize bannerView;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    //ToDo make a call to the databse here to load this array with users
    // sql = "select user_id, user, ... from username"
  
    
    DBController *mydb = [[DBController alloc] init];
    
    
    if([mydb DBdatafieldToObjectArray: @"select * from username " ]){
        
        // TODO: Total points earned from sql: Select Points where Date: "today" and Activity= "Exercise"
      
        
       self.userlist = mydb.obj_array;
        
        
    }else {
        self.userlist = nil;
    }
    
  // self.userlist = [[NSMutableArray alloc] initWithObjects:@"Xe",  nil];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    // -One CreateUser Cell, Multiple User Cells, One Empty Cell
    // -userlist contains User cell data +2 accounts for other two cells
    return [userlist count] + 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //for height
    if (indexPath.row==0) {
        return 75;
    }else {
        return 145;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //configure AddUser
    if(indexPath.row == 0) {
        static NSString *CellId = @"CreateUser";
        CreateUserCell *cell0 = [tableView dequeueReusableCellWithIdentifier:CellId];
        
        if (cell0 == nil) {
            cell0 = [[CreateUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId]; 
            
            cell0.textLabel.text = @"Add User";
        }
        
        return cell0;
    }else if (indexPath.row < [userlist count] +1){
    
    // configure ProgressCells
    static NSString *CellIdentifier = @"UserProgress";
    ProgressCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[ProgressCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                      reuseIdentifier:CellIdentifier];
        
    } 
        
   
    // Configure the cell...
    Users *cellValue = [userlist objectAtIndex:indexPath.row -1];

    cell.username.text = cellValue.user;
        
        float temp = (float) cellValue.total_progress / (float) cellValue.total_goal;
        
        cell.totalprogress.progress = temp;
        cell.exercise_todaysprogress.progress = 0;
        cell.diet_todaysprogress.progress = 0;
    
        cell.diet.text = @"diet Goal";
        cell.exercise.text = @"exerciseGoal";
        cell.total.text = [[NSNumber alloc] initWithInt: cellValue.total_goal].stringValue ;
        
        cell.user_id = cellValue.user_id;
        return cell;
    }else {
    
    // configure Empty Cell
    static NSString *CellIdentifier = @"EmptyCell";
    EmptyCell *emptycell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (emptycell == nil) {
        emptycell = [[EmptyCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                   reuseIdentifier:CellIdentifier];
        
    }
    return emptycell;      
    }
    
    

}


//Problem this runs after the segue
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Users * selectedUser =[userlist objectAtIndex: indexPath.row -1];
    appDelegate.user_id =  selectedUser.user_id;
    
    return indexPath;
}


 
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate



@end

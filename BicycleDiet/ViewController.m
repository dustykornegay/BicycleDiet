//
//  ViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/13/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import "ViewController.h"
#import "ProgressCell.h"
#import "CreateUserCell.h"
#import "EmptyCell.h"
#import "DBController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize userlist;
@synthesize name = _name;

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
    // when we switch pages we pass the user_id to the next view
    
    
    
   self.userlist = [[NSArray alloc] initWithObjects:@"Xe",  nil];

    
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
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [userlist count] + 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //for height
    if (indexPath.row==0) {
        return 70;
    }else {
        return 140;
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
    NSString *cellValue = [userlist objectAtIndex:indexPath.row -1];

    cell.username.text = cellValue;
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end

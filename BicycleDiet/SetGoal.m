//
//  SetGoal.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/16/12.
//  Copyright (c) 2012 __SiriwanLabs__. All rights reserved.
//

#import "SetGoal.h"
#import "BicycleDietCommon.h"


@implementation SetGoal

@synthesize current_weight;
@synthesize gender;
@synthesize goal;
@synthesize height_ft_field;
@synthesize height_in_field;
@synthesize namefield ;
@synthesize points;
@synthesize suggested;

@synthesize gender_button;
@synthesize suggestgoal_button;
@synthesize acceptgoal_button;
@synthesize skinny, obese;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
       
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(IBAction)doGender_button:(id)sender{
   
    //This code is intended to change the label on the gender button from "Gender" to "Male"/"Female" 
   
   if  (gender == 1){
        [sender setTitle:  @"Female" forState:UIControlStateNormal];
   
       [skinny setImage: [UIImage imageNamed: @"ID-10046769.jpg" ]];
       [obese setImage:[UIImage imageNamed: @"ID-10064756.jpg"]];
      
       
       //set next state gender
       gender = 2;
    }else  if  (gender == 2){
        [sender setTitle:  @"Gender" forState:UIControlStateNormal];
        
      //set next state male
        gender = 3;
    }else {
        [sender setTitle:  @"Male" forState:UIControlStateNormal];
         
        
        [skinny setImage: [UIImage imageNamed: @"ID-10080546.jpg"]];
        [obese setImage:[UIImage imageNamed: @"ID-10072763.jpg"]];
        
        //set next state to female
        gender = 1;
   } 
    
}

-(IBAction)doSuggestgoal_button{
    //initialize waist to 1.1 if it has not been set by slider
    if (waist == 0){
        waist =1.15;
    }
    
    //initialize gender to 3 if it has not been set by gender button
    if (gender == 0){
        gender =3;
    }
    
    //Grab Inches 
    float inches = [height_in_field.text floatValue];
    //Grab height MULTIPLY by 12 (convert to inches) 
    inches = inches + [height_ft_field.text floatValue ]* 12;
   // Use NSNumber to format output of Calc_Suggested Weight [weightlimit Calc_Suggested_weight: 69 ratio:1]
   
   
    
    
    NSLog(@"%f",waist);
    
    suggested = [weightlimit Calc_Suggested_weight: inches ratio: waist];
    if (gender == 1) {suggested = 1.1 * suggested;}
    if (gender == 3) {suggested = 1.05 * suggested;}
    
    //initialize current weight if it wasn't set by the user
    if ([current_weight.text floatValue] == 0) {current_weight.text = [[NSNumber alloc ]initWithFloat: suggested].stringValue;}
    
       
     goal.text =  [[NSNumber alloc ]initWithFloat: suggested].stringValue;
 
#ifndef DEBUG
    NSLog(@"DoSuggestGoal in SetGoal.m completed"); 
    NSLog(@"Waist to hip ratio: %f", waist);
    NSLog(@"Current weight: %f", [current_weight.text floatValue]);
    NSLog(@"Suggested Weight: %f", suggested );
    NSLog(@"Gender Selected: %i", gender);
#endif    
    
  
      
} 
-(IBAction)doAcceptgoal_button{
     NSLog(@"Suggested: %f", suggested);
    NSLog(@"Current Weight: %f", [current_weight.text floatValue]);
    
    if (suggested == 0) {
       return;
    }
    if (suggested >= [current_weight.text floatValue]){
        NSLog(@"You have already met your weightloss goal");
        NSLog(@"Gaining weight is not currently supported by this application");
        return;
        
    }else { // This is what normally happens; Points are calculated and you move to the Status Page
       
        points =[weightlimit Calculate_Points:[current_weight.text floatValue] ideal: suggested];
       
        
        NSLog(@"Points to Goal are set to %i", points);
        
        DBController * myDB = [[DBController alloc] init];
        
        int user_id =[myDB DBGetNewUserID];
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.user_id = user_id;
        
        //TODO: Push user_id,Name and goal to Database
        
        NSString * sql = [@"INSERT INTO username (user_id, user, goal) " stringByAppendingFormat: @"VALUES (%i ,'%@', %i)", user_id, namefield.text , points ];
        
        [myDB DBPush: sql];
        
    }
}

-(BOOL) textFieldShouldReturn:(UITextField *) aTextField {
    [aTextField resignFirstResponder];
    NSLog(@"I hit return");
    return YES;
    
}
-(IBAction)sliderchanged: (id) sender {
    UISlider *slider = (UISlider *) sender;
    waist = (slider.value);
    //NSLog (@"Slider set waist to hip ratio to: %f",waist);
} 

@end

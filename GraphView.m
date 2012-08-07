//
//  GraphView.m
//  BicycleDiet
//
//  Created by Digital on 7/26/12.
//
//  Display 1,2,4,8,10,20, or 40 weeks of daily data 

#import "GraphView.h"
#import "ProgressViewController.h"

@implementation GraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self == nil) {
        // Initialization code
         
        
        
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    user_id = appDelegate.user_id ;
    
    graph= [ProgressViewController PopulateGraph: 2 UserID: user_id];
    
    MultiDPoint * point = [[MultiDPoint alloc] init];
    float height = (float) HEIGHT;
    MultiDPoint * max = [self MaxPoint];
    
    
    // store the values in a new location
    float max_x;
    
    if (max.x > 0){
        max_x = max.x;
    }else {
        max_x = 1;
    }
    
    float max_y;
    if (max.y > 0){
         max_y = max.y;
    }else {
         max_y = 1;
    }
    
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3.0);
    
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextBeginPath (context);

    
    //insert points here
         
    for ( int i= 0; i < graph.count ; i++){
        point = [graph objectAtIndex: i];
        if (i == 0){
          CGContextMoveToPoint(context, point.x, point.y);
        }else {
    
        NSLog( @"point x: %2f y: %2f", point.x, point.y);
            
    //Normalize Y by dividing it by max_y TODO: Improve Normalization 
    CGContextAddLineToPoint(context, point.x, height - 10 - (100 * point.y / max.y));
    }
    }
    //draw the path to the view
    CGContextStrokePath(context);
    
    }



- (MultiDPoint *) MaxPoint{
   
    MultiDPoint * max = [[MultiDPoint alloc ]init];
    float max_x = 0;
    float max_y = 0;

    for ( int i= 0; i < graph.count;i++){
        MultiDPoint * temp = [graph objectAtIndex:i];
        if (temp.x > max_x) {
            max_x =  temp.x;
        }
        
        if (temp.y > max_y) {
            max_y =  temp.y;
        }
        
    }
    
    max.x = max_x;
    max.y = max_y;
   
    
    return max;
}
    

    
    



//Draw from right to left.  (today, yesterday, 2 days ago ...)

//Compute X values
    // find the first and last day.
    // calculate (lastday - first) day  in days

    // select  days
    //  <= 7  7 bins, eight points   (1 week)
    //  <= 14 14 bins, 15 points ... (2 weeks)  ... as described abovesq


// Compute Y values
    //Get the min and max from data set

    //find the difference

    //divide by 128 to determine the quanta

    // mod by the quanta to find the display bin Y

    //  128 - Y to invert the graph if displayed using Quartz 


@end

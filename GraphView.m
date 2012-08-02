//
//  GraphView.m
//  BicycleDiet
//
//  Created by Digital on 7/26/12.
//
//  Display 1,2,4,8,10,20, or 40 weeks of daily data 

#import "GraphView.h"

@implementation GraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self == nil) {
        // Initialization code
       // self = [[viewClass alloc] initWithFrame:CGRectZero];
        
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{    
    CGFloat components [] = {1.0,1.0,1.0};
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3.0);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColor(context, color);
    CGContextBeginPath (context);

    
    //insert points here
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 280, 0);
    
    //draw the path to the view
    CGContextStrokePath(context);
    

    
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

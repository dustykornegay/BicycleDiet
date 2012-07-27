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

//Draw from right to left.  (today, yesterday, 2 days ago ...)

//Compute X values
    // find the first and last day.
    // calculate (lastday - first) day  in days

    // select  days
    //  <= 7  7 bins, eight points   (1 week)
    //  <= 14 14 bins, 15 points ... (2 weeks)  ... as described above


// Compute Y values
    //Get the min and max from data set

    //find the difference

    //divide by 128 to determine the quanta

    // mod by the quanta to find the display bin Y

    //  128 - Y to invert the graph if displayed using Quartz 





@end

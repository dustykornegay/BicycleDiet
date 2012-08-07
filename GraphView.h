//
//  GraphView.h
//  BicycleDiet
//
//  Created by Digital on 7/26/12.
//
//  This View draws a graph onto 280 wide x 128 high
//
//  It is inspired by GraphView in AccelerometerGraph
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

#import "BicycleDietCommon.h"

#define  WIDTH  280;
#define HEIGHT  128;

@interface GraphView : UIView{

    NSMutableArray * graph;
    int user_id;

    
}

@end

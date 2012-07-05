//
//  RootViewController.m
//  BicycleDiet
//
//  Created by Dusty Kornegay on 6/2/12.
//  Copyright (c) 2012 __SiriwanLabs_. All rights reserved.
//

#import "RootViewController.h"
#import "SetGoal.h"


@interface RootViewController ()

@end

@implementation RootViewController
@synthesize pageViewController = _pageViewController;
@synthesize SetGoal =_SetGoal;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Configure the page view controller and add it as a child view controller.
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;

 

    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];

    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    CGRect pageViewRect = self.view.bounds;
    self.pageViewController.view.frame = pageViewRect;

    [self.pageViewController didMoveToParentViewController:self];

    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
    
   
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - UIPageViewController delegate methods

/*
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
}
 */

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    // Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
    UIViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:currentViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];

    self.pageViewController.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
}

//code added to detect keyboard appearance
- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window ];
    
    [super viewWillAppear:animated];
}

-(void) viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    [super viewWillDisappear:animated];
    
}

#if 0  //This code did not scroll as desired 
//TODO: Fix this code 

 -(void) keyboardWillShow:(NSNotification*) notice{
 NSDictionary* info = [notice userInfo];
 
 NSValue *noticeValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
 
 CGSize keyboardSize = [noticeValue CGRectValue].size;
 
 float keyboardbottom = (namefield.frame.origin.y + namefield.frame.size.height + 10);
 
  scrollAmount = keyboardSize.height - 344 - keyboardbottom;
 
 if (scrollAmount > 0) {
 moveUp =YES;
 [self scrollView:YES];
 }
 else moveUp = NO;
     
 }
 
 
 
 - (void) scrollView:(BOOL)movedUp {
 [UIView beginAnimation:nil context:NULL];
 [UIView setAnimationDuration:0.25];
 CGRect rect = self.view.frame;
 
 if (movedUp){
 rect.origin.y -= scrollAmount;
 }else {
 rect.origin.y += scrollAmount;
 }
 self.view.frame = rect;
 [UIView commitAnimations];
 }
     
#endif
    



@end

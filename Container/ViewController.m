//
//  ViewController.m
//  Container
//
//  Created by Yuichi Fujishige on 11/11/19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "VC.h"

@implementation ViewController
@synthesize toolbar;
@synthesize leftContainerView;
@synthesize rightContainerView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.title = @"ROOT";

    METHOD_LOG;
    [super viewDidLoad];


    // left
    leftViewController = [[VC alloc] init];
    leftViewController.name = @"left";
    leftViewController.color = [UIColor redColor];
    
    [self addChildViewController:leftViewController];
    [leftViewController didMoveToParentViewController:self];
    
    [self.leftContainerView addSubview:leftViewController.view];

    // right 1
    right1ViewController = [[VC alloc] init];
    right1ViewController.name = @"right1";
    right1ViewController.color = [UIColor yellowColor];
    
    [self addChildViewController:right1ViewController];
    [right1ViewController didMoveToParentViewController:self];
   
    [self.rightContainerView addSubview:right1ViewController.view];

    // right 2

    right2ViewController = [[VC alloc] init];
    right2ViewController.name = @"right2";
    right2ViewController.color = [UIColor cyanColor];
    
    [self addChildViewController:right2ViewController];
    [right2ViewController didMoveToParentViewController:self];
}

- (void)viewDidUnload
{
    METHOD_LOG;
    
    self.leftContainerView = nil;
    self.rightContainerView = nil;
    self.toolbar = nil;

    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    METHOD_LOG;
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    METHOD_LOG;
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    METHOD_LOG;
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    METHOD_LOG;
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)test1:(id)sender
{
    if(!leftModalViewController) {
        // show
        leftModalViewController = [[VC alloc] init];
        leftModalViewController.name = @"MODAL";
        leftModalViewController.color = [UIColor greenColor];
        
        [self addChildViewController:leftModalViewController]; //***
        
        CGRect startFrame = leftViewController.view.frame;
        startFrame.origin.y = startFrame.size.height;
        leftModalViewController.view.frame = startFrame;
        
        [self transitionFromViewController:leftViewController
                          toViewController:leftModalViewController
                                  duration:0.5
                                   options:0
                                animations:^{
                                    leftModalViewController.view.frame = leftViewController.view.frame;
                                }
                                completion:^(BOOL finished) {
                                    [leftModalViewController didMoveToParentViewController:self]; //***
                                }];

    } else {
        // hide
        [leftModalViewController willMoveToParentViewController:nil]; //***
        
        [self transitionFromViewController:leftModalViewController
                          toViewController:leftViewController
                                  duration:0.5
                                   options:0
                                animations:^{
                                    CGRect frame = leftModalViewController.view.frame;
                                    frame.origin.y = frame.size.height;
                                    leftModalViewController.view.frame = frame;
                                    [leftModalViewController.view.superview bringSubviewToFront:leftModalViewController.view];
                                }
                                completion:^(BOOL finished) {
                                    [leftModalViewController removeFromParentViewController]; //***
                                    leftModalViewController = nil;
                                }];
    }
}

- (IBAction)test2:(id)sender
{
    UIViewController *fromVC;
    UIViewController *toVC;

    if(right1ViewController.isViewLoaded && right1ViewController.view.superview) {
        fromVC = right1ViewController;
        toVC = right2ViewController;
    } else {
        fromVC = right2ViewController;
        toVC = right1ViewController;
    }

    [self transitionFromViewController:fromVC
                      toViewController:toVC
                              duration:1
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            animations:^{
                            }
                            completion:^(BOOL finished) {
                            }];
}

- (IBAction)test3:(id)sender {
    UIViewController *fromVC;
    UIViewController *toVC;
    
    if(right1ViewController.isViewLoaded && right1ViewController.view.superview) {
        fromVC = right1ViewController;
        toVC = right2ViewController;
    } else {
        fromVC = right2ViewController;
        toVC = right1ViewController;
    }

    [fromVC.view.superview addSubview:toVC.view];
    [fromVC.view removeFromSuperview];

    [self.view setNeedsLayout];
}

#pragma mark - Layout

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    CGRect upperFrame, bottomFrame;
    CGRectDivide(self.view.bounds, &upperFrame, &bottomFrame, self.toolbar.frame.size.height, CGRectMinYEdge);

    CGRect leftFrame, rightFrame;
    CGRectDivide(bottomFrame, &leftFrame, &rightFrame, floorf(bottomFrame.size.width/2), CGRectMinXEdge);

    self.leftContainerView.frame = leftFrame;
    self.rightContainerView.frame = rightFrame;
/*
    CGRect leftBounds = leftFrame;
    leftBounds.origin = CGPointZero;
    CGRect rightBounds = rightFrame;
    rightBounds.origin = CGPointZero;

    leftViewController.view.frame = leftBounds;
    
    right1ViewController.view.frame = rightBounds;
    right2ViewController.view.frame = rightBounds;
*/
}

@end

//
//  VC.m
//  Container
//
//  Created by Yuichi Fujishige on 11/11/19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "VC.h"

@implementation VC

@synthesize label;
@synthesize name;
@synthesize color;

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.title = self.name;
    METHOD_LOG;

    self.label.text = self.name;
    self.view.backgroundColor = self.color;
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    METHOD_LOG;
    self.label = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
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


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    self.view.frame = self.view.superview.bounds;
}

@end

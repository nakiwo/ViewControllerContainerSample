//
//  ViewController.h
//  Container
//
//  Created by Yuichi Fujishige on 11/11/19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VC;

@interface ViewController : UIViewController
{
    VC *leftViewController;
    VC *leftModalViewController;

    VC *right1ViewController;
    VC *right2ViewController;
}

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIView *leftContainerView;
@property (weak, nonatomic) IBOutlet UIView *rightContainerView;

- (IBAction)test1:(id)sender;
- (IBAction)test2:(id)sender;
- (IBAction)test3:(id)sender;

@end

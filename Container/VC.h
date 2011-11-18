//
//  VC.h
//  Container
//
//  Created by Yuichi Fujishige on 11/11/19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) UIColor *color;

@end

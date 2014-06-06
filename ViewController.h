//
//  ViewController.h
//  RingTone
//
//  Created by Meng Wang on 4/17/13.
//  Copyright (c) 2013 Meng Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ViewController2.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *compose;
- (IBAction)compose:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *trim;
- (IBAction)trim:(id)sender;

@end

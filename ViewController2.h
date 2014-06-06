//
//  ViewController2.h
//  RingTone
//
//  Created by Meng Wang on 4/17/13.
//  Copyright (c) 2013 Meng Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController2 : UIViewController{
    SystemSoundID soundid1;
    SystemSoundID soundid2;
    SystemSoundID soundid3;
    SystemSoundID soundid4;
    SystemSoundID soundid5;
    SystemSoundID soundid6;
    SystemSoundID soundid7;
    
}
@property (strong, nonatomic) IBOutlet UIBarButtonItem *play;

- (IBAction)play:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *low;

- (IBAction)low:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *high;

- (IBAction)high:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *save;

- (IBAction)save:(id)sender;

@end

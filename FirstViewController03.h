//
//  FirstViewController03.h
//  RingTone
//
//  Created by Tianqi on 4/19/13.
//  Copyright (c) 2013 Meng Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SecondViewController03.h"

@interface FirstViewController03 : UIViewController
{
    AVURLAsset *sourceAsset;
	AVPlayer *player;
	
	UILabel *inLabel;
	UILabel *outLabel;
    
	UISlider *timeSlider;
	NSTimer *soundTimer;
	
	Float64 inSeconds, outSeconds;
    
}

@property (nonatomic, retain) AVURLAsset *sourceAsset;
@property (nonatomic, retain) IBOutlet UILabel *inLabel;
@property (nonatomic, retain) IBOutlet UILabel *outLabel;
@property (nonatomic, retain) IBOutlet UISlider *timeSlider;
@property (nonatomic, retain) IBOutlet UIProgressView *myProgressView;

-(IBAction) inButtonTapped: (id) sender;
-(IBAction) outButtonTapped: (id) sender;
-(IBAction) cutButtonTapped: (id) sender;
-(IBAction) timeSliderValueChanged: (id) sender;
- (IBAction)playButton:(id)sender;
- (IBAction)pauseButton:(id)sender;

@end

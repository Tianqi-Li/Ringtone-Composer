//
//  SecondViewController02.h
//  RingTone
//
//  Created by Tianqi on 4/19/13.
//  Copyright (c) 2013 Meng Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SecondViewController02 : UIViewController {
    AVMutableComposition *composition;
    
	AVPlayer *player;
    UIProgressView *exportProgressView;
	NSTimer *exportTimer;
    Float64 lastTime;
}

@property (nonatomic, retain) AVMutableComposition *composition;
@property (nonatomic, retain) IBOutlet UIProgressView *exportProgressView;


- (IBAction)playButton:(id)sender;
- (IBAction)pauseButton:(id)sender;
- (IBAction)exportButtonTapped:(id)sender;


@end

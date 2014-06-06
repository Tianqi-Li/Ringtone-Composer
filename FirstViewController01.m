//
//  FirstViewController01.m
//  RingTone
//
//  Created by Tianqi on 4/19/13.
//  Copyright (c) 2013 Meng Wang. All rights reserved.
//

#import "FirstViewController01.h"
#import <CoreMedia/CoreMedia.h>

#define SOURCE_MOVIE_NAME @"We Go On"
#define SOURCE_MOVIE_TYPE @"mp3"

@interface FirstViewController01 () {
    AVAudioPlayer *avPlayer;

}

@end

@implementation FirstViewController01

@synthesize sourceAsset;
@synthesize inLabel;
@synthesize outLabel;
@synthesize timeSlider;
@synthesize myProgressView;


-(id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		NSString *sourceMoviePath = [[NSBundle mainBundle] pathForResource:SOURCE_MOVIE_NAME
																	ofType:SOURCE_MOVIE_TYPE];
		NSLog (@"found source movie at %@", sourceMoviePath);
		NSURL *sourceMovieURL = [NSURL fileURLWithPath:sourceMoviePath];
        sourceAsset	= [AVURLAsset URLAssetWithURL:sourceMovieURL
                                          options:nil];
	}
	return self;
	
}

-(NSString*) labelStringForTime: (Float64) time {
	//int hours = time / 360;
	int minutes = ((int) time / 60) % 60;
	int seconds = (int) time % 60;
	return [NSString stringWithFormat:@"%02d:%02d",
            minutes, seconds];
}


-(IBAction) inButtonTapped: (id) sender {
	inSeconds = timeSlider.value;
	inLabel.text = [self labelStringForTime: inSeconds];
}
-(IBAction) outButtonTapped: (id) sender {
	outSeconds = timeSlider.value;
	outLabel.text = [self labelStringForTime: outSeconds];
}


- (IBAction)playButton:(id)sender {
    [avPlayer play];
}

- (IBAction)pauseButton:(id)sender {
    [avPlayer pause];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction) cutButtonTapped: (id) sender {
        NSLog(@"inSeconds:%f,outSeconds:%f",inSeconds,outSeconds);
	if ((inSeconds > 0) && (outSeconds > 0)) {
		if (inSeconds > outSeconds) {
			UIAlertView *youFailEditingForeverAlert =
            [[UIAlertView alloc] initWithTitle:@"Invalid edit"
                                       message:@"In point is after Out point"
                                      delegate:nil
                             cancelButtonTitle:@"Oops"
                             otherButtonTitles:nil];
			[youFailEditingForeverAlert show];
			return;
		}
        
        [avPlayer stop];
        [avPlayer setCurrentTime:0];
		
		CMTime inTime = CMTimeMakeWithSeconds(inSeconds, 600);
		CMTime outTime = CMTimeMakeWithSeconds(outSeconds, 600);
		CMTime duration = CMTimeSubtract(outTime, inTime);
		CMTimeRange editRange = CMTimeRangeMake(inTime, duration);
		NSError *editError = nil;
        
        SecondViewController01 *secondViewController01 = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController01"];
        
        
		[secondViewController01.composition insertTimeRange:editRange
                                                  ofAsset:sourceAsset
                                                   atTime:secondViewController01.composition.duration
                                                    error:&editError];
		if (!editError) {
			// kludge: force the other VC to load its view, so we can touch its goodies
			
			//secondViewController.timeSlider.maximumValue =
            CMTimeGetSeconds (secondViewController01.composition.duration);
            [self presentViewController:secondViewController01 animated:YES completion:nil];
            
		} else {
			NSLog (@"edit error: %@", editError);
		}
        
		// reset edit points
		inSeconds = -1;
		outSeconds = -1;
		inLabel.text = @"--:--";
		outLabel.text = @"--:--";
        
        
	}
}

-(IBAction) timeSliderValueChanged: (id) sender {
    
    avPlayer.currentTime = timeSlider.value;
    
	/*CMTime newTime = CMTimeMakeWithSeconds(timeSlider.value, 600);
     [player seekToTime: newTime];*/
	// NSLog (@"seeking to %f", CMTimeGetSeconds(newTime));
}

- (void)updateSlider {
    [timeSlider setValue:avPlayer.currentTime];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"editImage.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

    inLabel.text = @"--:--";
    outLabel.text = @"--:--";
    
    float durationSeconds = sourceAsset.duration.value / sourceAsset.duration.timescale;
	//[timeSlider setMaximumValue: durationSeconds];
	NSLog (@"duration is %f sec", durationSeconds);
	
	inSeconds = -1.0;
	outSeconds = -1.0;
    
	AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:sourceAsset];
	player = [AVPlayer playerWithPlayerItem:playerItem];
	
	NSString *stringPath = [[NSBundle mainBundle]pathForResource:SOURCE_MOVIE_NAME ofType:SOURCE_MOVIE_TYPE];
    NSURL *url = [NSURL fileURLWithPath:stringPath];
    NSError *error;
    avPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    [avPlayer setNumberOfLoops:-1];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updatemyProgress) userInfo: nil repeats:YES];
    
    
    
    timeSlider.maximumValue = avPlayer.duration;
    timeSlider.minimumValue = 0;
    avPlayer.currentTime = timeSlider.value;
    
    
}

- (void)updatemyProgress {
    float progress = [avPlayer currentTime]/[avPlayer duration];
    self.myProgressView.progress = progress;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

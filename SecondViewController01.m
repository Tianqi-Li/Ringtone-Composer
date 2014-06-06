//
//  SecondViewController01.m
//  RingTone
//
//  Created by Tianqi on 4/19/13.
//  Copyright (c) 2013 Meng Wang. All rights reserved.
//

#import "SecondViewController01.h"
#define EXPORT_NAME @"exported"

@interface SecondViewController01 ()

@end

@implementation SecondViewController01

@synthesize composition;
@synthesize exportProgressView;


-(id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		composition = [[AVMutableComposition alloc] init];
	}
	return self;
	
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:composition];
	player = [AVPlayer playerWithPlayerItem:playerItem];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"editImage.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

   }



-(IBAction) exportButtonTapped: (id) sender {
	NSError *exportError = nil;
    if (exportError) {
        NSLog (@"export error: %@", exportError);
    }
    /* AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:composition
     presetName:AVAssetExportPresetMediumQuality];*/
    AVAssetExportSession *exportSession = [AVAssetExportSession
                                           exportSessionWithAsset:composition
                                           presetName:AVAssetExportPresetAppleM4A];
    
    
	NSLog (@"can export: %@", exportSession.supportedFileTypes);
	NSArray *dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectoryPath = [dirs objectAtIndex:0];
	NSString *exportPath = [documentsDirectoryPath stringByAppendingPathComponent:EXPORT_NAME];
	[[NSFileManager defaultManager] removeItemAtPath:exportPath error:nil];
	NSURL *exportURL = [NSURL fileURLWithPath:exportPath];
    
    NSLog (@"found source movie at %@", exportPath);
    
	exportSession.outputURL = exportURL;
    
    //save format
    
	exportSession.outputFileType = @"com.apple.m4a-audio";
	[exportSession exportAsynchronouslyWithCompletionHandler:^{
		NSLog (@"i is in your block, exportin. status is %d",
			   exportSession.status);
		switch (exportSession.status) {
			case AVAssetExportSessionStatusFailed:
			case AVAssetExportSessionStatusCompleted: {
				[self performSelectorOnMainThread:@selector (doPostExportUICleanup:)
									   withObject:nil
									waitUntilDone:NO];
				break;
			}
		};
	}];
	
    exportProgressView.progress = 0.0;
	exportProgressView.hidden = NO;
	exportTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
												   target:self
												 selector:@selector (updateExportProgress:)
												 userInfo:exportSession
												  repeats:YES];
	
    
    
}



/*- (void)updatemyProgress {
 float progress = CMTimeGetSeconds(player.currentTime) / CMTimeGetSeconds(composition.duration);
 self.myProgressView.progress = progress;
 }*/

-(void) updateExportProgress: (NSTimer*) timer {
	AVAssetExportSession *exportSession = (AVAssetExportSession*) [timer userInfo];
	exportProgressView.progress = exportSession.progress;
}

-(void) doPostExportUICleanup: (NSObject*) userInfo {
	exportProgressView.hidden = YES;
	[exportTimer invalidate];
    
    UIAlertView *winAlert = [[UIAlertView alloc] initWithTitle:@"Finished!"
                                                       message:@"You have successfully made a ringtone"
                                                      delegate:self
                                             cancelButtonTitle:@"Okay"
                                             otherButtonTitles: nil];
    [winAlert show];
    
    
}

/*- (void)alertView:(UIAlertView *)actionsheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
       FirstViewController01 *firstViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController01"];
        
        
        [self presentViewController:firstViewController animated:YES completion:nil];
    }
}*/
/*-(IBAction) timeSliderValueChanged: (id) sender {
 CMTime newTime = CMTimeMakeWithSeconds(timeSlider.value, 600);
 [player seekToTime:newTime];
 }
 
 -(void) updateSlider: (NSTimer*) timer {
 timeSlider.value = CMTimeGetSeconds(player.currentTime);
 }*/

- (IBAction)playButton:(id)sender {
    [player play];
}

- (IBAction)pauseButton:(id)sender {
    [player pause];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  RingTone
//
//  Created by Meng Wang on 4/17/13.
//  Copyright (c) 2013 Meng Wang. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    AVAudioPlayer *mainmusic;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"1.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    NSString *stringPath=[[NSBundle mainBundle] pathForResource:@"bird" ofType:@"mp3"];
    NSURL *url=[NSURL fileURLWithPath:stringPath];
    NSError *error;
    mainmusic=[[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [mainmusic play];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)compose:(id)sender {
    [mainmusic stop];
}
- (IBAction)trim:(id)sender {
    [mainmusic stop];
}
@end

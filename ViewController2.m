//
//  ViewController2.m
//  RingTone
//
//  Created by Meng Wang on 4/17/13.
//  Copyright (c) 2013 Meng Wang. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 (){
    
    CGPoint endPoint;
    
    int endPointx;
    int endPointy;
    
    int a[10];
    int b[10];
    int c[10];
    int d[10];
    int e[10];
    int f[10];
    int g[10];
    
    float tmpo;
    int tem;
   
    
}

@end

@implementation ViewController2

@synthesize play;
@synthesize low;
@synthesize high;
@synthesize save;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touchend = [touches anyObject];
    
    endPoint = [touchend locationInView:self.view];
    
    endPointx=(int)endPoint.x;
    endPointy=(int)endPoint.y;
    NSLog(@"%d,%d",endPointx,endPointy);
    
    for (int i=0; i<7; i++) {
        for (int j=0; j<10; j++) {
            if (endPointx>12+30*i&&endPointx<12+30*(i+1)&&endPointy>11+35*j&&endPointy<11+35*(j+1)) {
                if (a[j]==0&&b[j]==0&&c[j]==0&&d[j]==0&&e[j]==0&&f[j]==0&&g[j]==0) {
                UIImageView *imageHolder1 = [[UIImageView alloc] initWithFrame:CGRectMake(12+30*i, 11+35*j, 30, 35)];
                UIImage *image = [UIImage imageNamed:@"music.png"];
                imageHolder1.image = image;
                [self.view addSubview:imageHolder1];
                if (i==0) {
                    a[j]=1;
                    NSLog(@"a[%d]=%d",j,a[j]);
                }
                if (i==1) {
                    b[j]=2;
                    NSLog(@"b[%d]=%d",j,b[j]);
                }
                if (i==2) {
                    c[j]=3;
                    NSLog(@"c[%d]=%d",j,c[j]);
                }
                if (i==3) {
                    d[j]=4;
                    NSLog(@"d[%d]=%d",j,d[j]);
                }
                if (i==4) {
                    e[j]=5;
                    NSLog(@"e[%d]=%d",j,e[j]);
                }
                if (i==5) {
                    f[j]=6;
                    NSLog(@"f[%d]=%d",j,f[j]);
                }
                if (i==6) {
                    g[j]=7;
                    NSLog(@"g[%d]=%d",j,g[j]);
                }
                }

            }
        }
    }
    
    
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
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"1.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    play.enabled=NO;
    save.enabled=NO;
    low.enabled=YES;
    high.enabled=YES;
    
    NSURL *url1=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"aif"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url1, &soundid1);
    
    NSURL *url2=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"2" ofType:@"aif"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url2, &soundid2);
    
    NSURL *url3=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"aif"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url3, &soundid3);
    
    NSURL *url4=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"4" ofType:@"aif"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url4, &soundid4);
    
    NSURL *url5=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"5" ofType:@"aif"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url5, &soundid5);
    
    NSURL *url6=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"6" ofType:@"aif"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url6, &soundid6);
    
    NSURL *url7=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"7" ofType:@"aif"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url7, &soundid7);
    
    tmpo=0.0;
    
    for (int i=0; i<10; i++) {
         a[i]=0;
         b[i]=0;
         c[i]=0;
         d[i]=0;
         e[i]=0;
         f[i]=0;
         g[i]=0;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {

    for (int i=0; i<10; i++) {
        
        if (a[i]!=0) {
             AudioServicesPlaySystemSound(soundid1);
        }
        else if (b[i]!=0) {
             AudioServicesPlaySystemSound(soundid2);
        }
        else if (c[i]!=0) {
             AudioServicesPlaySystemSound(soundid3);
        }
        else if (d[i]!=0) {
             AudioServicesPlaySystemSound(soundid4);
        }
        else if (e[i]!=0) {
             AudioServicesPlaySystemSound(soundid5);
        }
        else if (f[i]!=0) {
            AudioServicesPlaySystemSound(soundid6);
        }
        else if (g[i]!=0) {
             AudioServicesPlaySystemSound(soundid7);
        }
        [NSThread sleepForTimeInterval:tmpo];
    }
}
- (IBAction)low:(id)sender {
    if (a[0]!=0||b[0]!=0||c[0]!=0||d[0]!=0||e[0]!=0||f[0]!=0||g[0]!=0) {
        if (a[1]!=0||b[1]!=0||c[1]!=0||d[1]!=0||e[1]!=0||f[1]!=0||g[1]!=0) {
            if (a[2]!=0||b[2]!=0||c[2]!=0||d[2]!=0||e[2]!=0||f[2]!=0||g[2]!=0) {
                if (a[3]!=0||b[3]!=0||c[3]!=0||d[3]!=0||e[3]!=0||f[3]!=0||g[3]!=0) {
                    if (a[4]!=0||b[4]!=0||c[4]!=0||d[4]!=0||e[4]!=0||f[4]!=0||g[4]!=0) {
                        if (a[5]!=0||b[5]!=0||c[5]!=0||d[5]!=0||e[5]!=0||f[5]!=0||g[5]!=0) {
                            if (a[6]!=0||b[6]!=0||c[6]!=0||d[6]!=0||e[6]!=0||f[6]!=0||g[6]!=0) {
                                if (a[7]!=0||b[7]!=0||c[7]!=0||d[7]!=0||e[7]!=0||f[7]!=0||g[7]!=0) {
                                    if (a[8]!=0||b[8]!=0||c[8]!=0||d[8]!=0||e[8]!=0||f[8]!=0||g[8]!=0) {
                                        if (a[9]!=0||b[9]!=0||c[9]!=0||d[9]!=0||e[9]!=0||f[9]!=0||g[9]!=0) {
                                            tmpo=1.4;
                                            tem=1;
                                            play.enabled=YES;
                                            save.enabled=YES;
                        
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
  
    
}
- (IBAction)high:(id)sender {
    
    if (a[0]!=0||b[0]!=0||c[0]!=0||d[0]!=0||e[0]!=0||f[0]!=0||g[0]!=0) {
        if (a[1]!=0||b[1]!=0||c[1]!=0||d[1]!=0||e[1]!=0||f[1]!=0||g[1]!=0) {
            if (a[2]!=0||b[2]!=0||c[2]!=0||d[2]!=0||e[2]!=0||f[2]!=0||g[2]!=0) {
                if (a[3]!=0||b[3]!=0||c[3]!=0||d[3]!=0||e[3]!=0||f[3]!=0||g[3]!=0) {
                    if (a[4]!=0||b[4]!=0||c[4]!=0||d[4]!=0||e[4]!=0||f[4]!=0||g[4]!=0) {
                        if (a[5]!=0||b[5]!=0||c[5]!=0||d[5]!=0||e[5]!=0||f[5]!=0||g[5]!=0) {
                            if (a[6]!=0||b[6]!=0||c[6]!=0||d[6]!=0||e[6]!=0||f[6]!=0||g[6]!=0) {
                                if (a[7]!=0||b[7]!=0||c[7]!=0||d[7]!=0||e[7]!=0||f[7]!=0||g[7]!=0) {
                                    if (a[8]!=0||b[8]!=0||c[8]!=0||d[8]!=0||e[8]!=0||f[8]!=0||g[8]!=0) {
                                        if (a[9]!=0||b[9]!=0||c[9]!=0||d[9]!=0||e[9]!=0||f[9]!=0||g[9]!=0) {
                                            tmpo=0.8;
                                            tem=2;
                                            play.enabled=YES;
                                            save.enabled=YES;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }


       
}
- (IBAction)save:(id)sender {
    
    NSString *wavPath;
    NSString *wavPath0;
    NSString *wavPath1;
    NSString *wavPath2;
    NSString *wavPath3;
    NSString *wavPath4;
    NSString *wavPath5;
    NSString *wavPath6;
    NSString *wavPath7;
    NSString *wavPath8;
    NSString *wavPath9;
    NSString *paths;
    NSString *filePath;
    
    NSData *soundData;
    NSData *sound0Data;
    NSData *sound1Data;
    NSData *sound2Data;
    NSData *sound3Data;
    NSData *sound4Data;
    NSData *sound5Data;
    NSData *sound6Data;
    NSData *sound7Data;
    NSData *sound8Data;
    NSData *sound9Data;
    
    if (tem==2) {
        
        paths = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        filePath = [paths stringByAppendingPathComponent:@"ringhigh.mp3"];
        
        for (int i=0; i<10; i++) {
            
            if (i==0) {
                if (a[0]!=0) {
                    wavPath0 = [[NSBundle mainBundle] pathForResource:@"1a" ofType:@"mp3"];
                }
                if (b[0]!=0) {
                    wavPath0 = [[NSBundle mainBundle] pathForResource:@"2a" ofType:@"mp3"];
                }
                if (c[0]!=0) {
                    wavPath0 = [[NSBundle mainBundle] pathForResource:@"3a" ofType:@"mp3"];
                }
                if (d[0]!=0) {
                   wavPath0 = [[NSBundle mainBundle] pathForResource:@"4a" ofType:@"mp3"];
                }
                if (e[0]!=0) {
                   wavPath0 = [[NSBundle mainBundle] pathForResource:@"5a" ofType:@"mp3"];
                }
                if (f[0]!=0) {
                   wavPath0 = [[NSBundle mainBundle] pathForResource:@"6a" ofType:@"mp3"];
                }
                if (g[0]!=0) {
                   wavPath0 = [[NSBundle mainBundle] pathForResource:@"7a" ofType:@"mp3"];
                }

            }
            if (i==1) {
                if (a[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"1a" ofType:@"mp3"];
                }
                if (b[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"2a" ofType:@"mp3"];
                }
                if (c[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"3a" ofType:@"mp3"];
                }
                if (d[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"4a" ofType:@"mp3"];
                }
                if (e[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"5a" ofType:@"mp3"];
                }
                if (f[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"6a" ofType:@"mp3"];
                }
                if (g[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"7a" ofType:@"mp3"];
                }
                
            }
            if (i==2) {
                if (a[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"1a" ofType:@"mp3"];
                }
                if (b[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"2a" ofType:@"mp3"];
                }
                if (c[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"3a" ofType:@"mp3"];
                }
                if (d[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"4a" ofType:@"mp3"];
                }
                if (e[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"5a" ofType:@"mp3"];
                }
                if (f[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"6a" ofType:@"mp3"];
                }
                if (g[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"7a" ofType:@"mp3"];
                }
                
            }
            if (i==3) {
                if (a[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"1a" ofType:@"mp3"];
                }
                if (b[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"2a" ofType:@"mp3"];
                }
                if (c[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"3a" ofType:@"mp3"];
                }
                if (d[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"4a" ofType:@"mp3"];
                }
                if (e[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"5a" ofType:@"mp3"];
                }
                if (f[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"6a" ofType:@"mp3"];
                }
                if (g[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"7a" ofType:@"mp3"];
                }
                
            }
            
            if (i==4) {
                if (a[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"1a" ofType:@"mp3"];
                }
                if (b[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"2a" ofType:@"mp3"];
                }
                if (c[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"3a" ofType:@"mp3"];
                }
                if (d[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"4a" ofType:@"mp3"];
                }
                if (e[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"5a" ofType:@"mp3"];
                }
                if (f[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"6a" ofType:@"mp3"];
                }
                if (g[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"7a" ofType:@"mp3"];
                }
                
            }
            if (i==5) {
                if (a[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"1a" ofType:@"mp3"];
                }
                if (b[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"2a" ofType:@"mp3"];
                }
                if (c[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"3a" ofType:@"mp3"];
                }
                if (d[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"4a" ofType:@"mp3"];
                }
                if (e[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"5a" ofType:@"mp3"];
                }
                if (f[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"6a" ofType:@"mp3"];
                }
                if (g[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"7a" ofType:@"mp3"];
                }
                
            }
            if (i==6) {
                if (a[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"1a" ofType:@"mp3"];
                }
                if (b[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"2a" ofType:@"mp3"];
                }
                if (c[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"3a" ofType:@"mp3"];
                }
                if (d[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"4a" ofType:@"mp3"];
                }
                if (e[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"5a" ofType:@"mp3"];
                }
                if (f[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"6a" ofType:@"mp3"];
                }
                if (g[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"7a" ofType:@"mp3"];
                }
                
            }
            if (i==7) {
                if (a[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"1a" ofType:@"mp3"];
                }
                if (b[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"2a" ofType:@"mp3"];
                }
                if (c[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"3a" ofType:@"mp3"];
                }
                if (d[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"4a" ofType:@"mp3"];
                }
                if (e[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"5a" ofType:@"mp3"];
                }
                if (f[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"6a" ofType:@"mp3"];
                }
                if (g[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"7a" ofType:@"mp3"];
                }
                
            }
            if (i==8) {
                if (a[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"1a" ofType:@"mp3"];
                }
                if (b[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"2a" ofType:@"mp3"];
                }
                if (c[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"3a" ofType:@"mp3"];
                }
                if (d[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"4a" ofType:@"mp3"];
                }
                if (e[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"5a" ofType:@"mp3"];
                }
                if (f[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"6a" ofType:@"mp3"];
                }
                if (g[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"7a" ofType:@"mp3"];
                }
                
            }
            if (i==9) {
                if (a[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"1a" ofType:@"mp3"];
                }
                if (b[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"2a" ofType:@"mp3"];
                }
                if (c[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"3a" ofType:@"mp3"];
                }
                if (d[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"4a" ofType:@"mp3"];
                }
                if (e[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"5a" ofType:@"mp3"];
                }
                if (f[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"6a" ofType:@"mp3"];
                }
                if (g[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"7a" ofType:@"mp3"];
                }
                
            }
            
        }
        
        wavPath = [[NSBundle mainBundle] pathForResource:@"20msec" ofType:@"mp3"];
        
        sound0Data = [[NSData alloc] initWithContentsOfFile: wavPath0];
        sound1Data = [[NSData alloc] initWithContentsOfFile: wavPath1];
        sound2Data = [[NSData alloc] initWithContentsOfFile: wavPath2];
        sound3Data = [[NSData alloc] initWithContentsOfFile: wavPath3];
        sound4Data = [[NSData alloc] initWithContentsOfFile: wavPath4];
        sound5Data = [[NSData alloc] initWithContentsOfFile: wavPath5];
        sound6Data = [[NSData alloc] initWithContentsOfFile: wavPath6];
        sound7Data = [[NSData alloc] initWithContentsOfFile: wavPath7];
        sound8Data = [[NSData alloc] initWithContentsOfFile: wavPath8];
        sound9Data = [[NSData alloc] initWithContentsOfFile: wavPath9];
        soundData  = [[NSData alloc] initWithContentsOfFile:  wavPath];
        
        NSMutableData *sounds = [NSMutableData alloc];
        
        [sounds appendData:sound0Data];
        [sounds appendData:sound1Data];
        [sounds appendData:sound2Data];
        [sounds appendData:sound3Data];
        [sounds appendData:sound4Data];
        [sounds appendData:sound5Data];
        [sounds appendData:sound6Data];
        [sounds appendData:sound7Data];
        [sounds appendData:sound8Data];
        [sounds appendData:sound9Data];
        
        [sounds writeToFile:filePath atomically:YES];
       

    }
    
    
    
    
    if (tem==1) {
        
        paths = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        filePath = [paths stringByAppendingPathComponent:@"ringlow.mp3"];
        
        for (int i=0; i<10; i++) {
            
            if (i==0) {
                if (a[0]!=0) {
                    wavPath0 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
                }
                if (b[0]!=0) {
                    wavPath0 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"];
                }
                if (c[0]!=0) {
                    wavPath0 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
                }
                if (d[0]!=0) {
                    wavPath0 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"mp3"];
                }
                if (e[0]!=0) {
                    wavPath0 = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"mp3"];
                }
                if (f[0]!=0) {
                    wavPath0 = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"mp3"];
                }
                if (g[0]!=0) {
                    wavPath0 = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"mp3"];
                }
                
            }
            if (i==1) {
                if (a[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
                }
                if (b[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"];
                }
                if (c[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
                }
                if (d[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"mp3"];
                }
                if (e[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"mp3"];
                }
                if (f[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"mp3"];
                }
                if (g[1]!=0) {
                    wavPath1 = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"mp3"];
                }
                
            }
            if (i==2) {
                if (a[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
                }
                if (b[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"];
                }
                if (c[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
                }
                if (d[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"mp3"];
                }
                if (e[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"mp3"];
                }
                if (f[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"mp3"];
                }
                if (g[2]!=0) {
                    wavPath2 = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"mp3"];
                }
                
            }
            if (i==3) {
                if (a[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
                }
                if (b[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"];
                }
                if (c[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
                }
                if (d[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"mp3"];
                }
                if (e[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"mp3"];
                }
                if (f[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"mp3"];
                }
                if (g[3]!=0) {
                    wavPath3 = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"mp3"];
                }
                
            }
            
            if (i==4) {
                if (a[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
                }
                if (b[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"];
                }
                if (c[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
                }
                if (d[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"mp3"];
                }
                if (e[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"mp3"];
                }
                if (f[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"mp3"];
                }
                if (g[4]!=0) {
                    wavPath4 = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"mp3"];
                }
                
            }
            if (i==5) {
                if (a[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
                }
                if (b[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"];
                }
                if (c[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
                }
                if (d[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"mp3"];
                }
                if (e[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"mp3"];
                }
                if (f[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"mp3"];
                }
                if (g[5]!=0) {
                    wavPath5 = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"mp3"];
                }
                
            }
            if (i==6) {
                if (a[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
                }
                if (b[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"];
                }
                if (c[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
                }
                if (d[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"mp3"];
                }
                if (e[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"mp3"];
                }
                if (f[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"mp3"];
                }
                if (g[6]!=0) {
                    wavPath6 = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"mp3"];
                }
                
            }
            if (i==7) {
                if (a[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
                }
                if (b[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"];
                }
                if (c[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
                }
                if (d[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"mp3"];
                }
                if (e[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"mp3"];
                }
                if (f[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"mp3"];
                }
                if (g[7]!=0) {
                    wavPath7 = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"mp3"];
                }
                
            }
            if (i==8) {
                if (a[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
                }
                if (b[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"];
                }
                if (c[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
                }
                if (d[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"mp3"];
                }
                if (e[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"mp3"];
                }
                if (f[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"mp3"];
                }
                if (g[8]!=0) {
                    wavPath8 = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"mp3"];
                }
                
            }
            if (i==9) {
                if (a[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
                }
                if (b[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"mp3"];
                }
                if (c[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
                }
                if (d[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"mp3"];
                }
                if (e[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"mp3"];
                }
                if (f[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"mp3"];
                }
                if (g[9]!=0) {
                    wavPath9 = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"mp3"];
                }
                
            }
            
        }
        
        wavPath = [[NSBundle mainBundle] pathForResource:@"20msec" ofType:@"mp3"];
        
        sound0Data = [[NSData alloc] initWithContentsOfFile: wavPath0];
        sound1Data = [[NSData alloc] initWithContentsOfFile: wavPath1];
        sound2Data = [[NSData alloc] initWithContentsOfFile: wavPath2];
        sound3Data = [[NSData alloc] initWithContentsOfFile: wavPath3];
        sound4Data = [[NSData alloc] initWithContentsOfFile: wavPath4];
        sound5Data = [[NSData alloc] initWithContentsOfFile: wavPath5];
        sound6Data = [[NSData alloc] initWithContentsOfFile: wavPath6];
        sound7Data = [[NSData alloc] initWithContentsOfFile: wavPath7];
        sound8Data = [[NSData alloc] initWithContentsOfFile: wavPath8];
        sound9Data = [[NSData alloc] initWithContentsOfFile: wavPath9];
        soundData  = [[NSData alloc] initWithContentsOfFile:  wavPath];
        
        NSMutableData *sounds = [NSMutableData alloc];
        
        [sounds appendData:sound0Data];
        [sounds appendData:sound1Data];
        [sounds appendData:sound2Data];
        [sounds appendData:sound3Data];
        [sounds appendData:sound4Data];
        [sounds appendData:sound5Data];
        [sounds appendData:sound6Data];
        [sounds appendData:sound7Data];
        [sounds appendData:sound8Data];
        [sounds appendData:sound9Data];
        
        [sounds writeToFile:filePath atomically:YES];
        
        
    }
    
}
@end

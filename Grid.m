//
//  Grid.m
//  RingTone
//
//  Created by Meng Wang on 4/17/13.
//  Copyright (c) 2013 Meng Wang. All rights reserved.
//

#import "Grid.h"

@implementation Grid

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect
{
    
    //Since the background color is clear should I just not draw it
    [[UIColor clearColor] setFill];
    [[UIColor grayColor] setStroke];
    
    for(int col = 0; col < 7; col++)
    {
        for (int row = 0; row < 10; row++)
        {
            UIBezierPath *gridSquare = [UIBezierPath bezierPathWithRect:CGRectMake(col*30, row*35, 30, 35)];
            [gridSquare stroke];
            [gridSquare fill];
        }
    }
}


@end

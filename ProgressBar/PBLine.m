//
//  PBLine.m
//  ProgressBar
//
//  Created by Zhang Boxuan on 14-5-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "PBLine.h"

@interface PBLine ()

@end

@implementation PBLine

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
              Color:(UIColor*)color
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = color;
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, self.frame.size.height); //width of the line
//    CGContextSetStrokeColorWithColor(context, self.color.CGColor); //color of the line
//    CGContextMoveToPoint(context, 0, 0);
    
    
//}


@end

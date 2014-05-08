//
//  ProgressBar.m
//  ProgressBar
//
//  Created by Zhang Boxuan on 14-5-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "ProgressBar.h"
#import "PBLine.h"

@interface ProgressBar ()

@property (strong, nonatomic) PBLine *reachedLine;
@property (strong, nonatomic) PBLine *unreachedLine;
@property (strong, nonatomic) UILabel *textLabel;

@end

@implementation ProgressBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        //set default values
        self.lineWidth = 2.0;
        self.textSize = 11;
        self.reachedColor = [UIColor blackColor];
        self.unreachedColor = [UIColor grayColor];
        self.fontColor = [UIColor blackColor];
        
        
        self.currentData = [NSNumber numberWithInteger:30];
        self.totalData = [NSNumber numberWithInteger:100];
        
        double jointPosition = self.frame.size.width * (self.currentData.doubleValue / self.totalData.doubleValue);
        
        
        // draw reached line
        self.reachedLine = [[PBLine alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 2 - self.lineWidth / 2, jointPosition - (self.frame.size.width / 10), self.lineWidth * 1.5) Color:self.reachedColor];
        [self addSubview:self.reachedLine];
        
        
        //draw unreached line
        self.unreachedLine = [[PBLine alloc] initWithFrame:CGRectMake(jointPosition + (self.frame.size.width / 10), self.frame.size.height / 2 - self.lineWidth / 2, self.frame.size.width - jointPosition - (self.frame.size.width / 10), self.lineWidth) Color:self.unreachedColor];
        [self addSubview:self.unreachedLine];
        
        //draw text label
        
        NSInteger percent = self.currentData.doubleValue / self.totalData.doubleValue * 100;
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(jointPosition - (self.frame.size.width * 5 / 100), self.frame.size.height / 2 - self.lineWidth * 10 / 2, self.frame.size.width * 10 / 100, self.lineWidth * 10)];
        self.textLabel.text = [NSString stringWithFormat:@"%ld%%", (long)percent];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        NSLog(@"%ld%%", (long)percent);
        self.textLabel.textColor = self.fontColor;
        self.textLabel.font = [UIFont systemFontOfSize:self.textSize];
        
        [self addSubview:self.textLabel];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                    TotalData:(NSNumber*)totalData
                  CurrentData:(NSNumber*)currentData
{
    self=[super initWithFrame:frame];
    if(self)
    {
        //set default values
        self.lineWidth = 2.0;
        self.textSize = 11;
        self.reachedColor = [UIColor blackColor];
        self.unreachedColor = [UIColor grayColor];
        self.fontColor = [UIColor blackColor];
        
        // set datas
        self.currentData = currentData;
        self.totalData = totalData;
        
        [self changeStatusWithCurrentData:self.currentData];

    }
    
    return self;
}



- (void)changeStatusWithCurrentData:(NSNumber*)currentData
{
    
    if(currentData <= self.totalData)
    {
        NSArray *subviews = [self subviews];
        for(UIView *subview in subviews)
        {
            [subview removeFromSuperview];
        }
        
        self.currentData = currentData;
        self.totalData = [NSNumber numberWithInteger:100];
        
        double jointPosition = self.frame.size.width * (self.currentData.doubleValue / self.totalData.doubleValue);
        
//        if(jointPosition < self.frame.size.width * 10 / 100)
//        {
//            jointPosition = self.frame.size.width * 10 / 100;
//        }
        
        
        if(jointPosition > self.frame.size.width * 90 / 100)
        {
            // draw reached line
            self.reachedLine = [[PBLine alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 2 - self.lineWidth / 2, self.frame.size.width * 90 / 100, self.lineWidth * 1.5) Color:self.reachedColor];
            [self addSubview:self.reachedLine];
            
            //draw text label
            NSInteger percent = self.currentData.doubleValue / self.totalData.doubleValue * 100;
            self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width * 90 / 100, self.frame.size.height / 2 - self.lineWidth * 10 / 2, self.frame.size.width * 10 / 100, self.lineWidth * 10)];
            self.textLabel.text = [NSString stringWithFormat:@"%ld%%", (long)percent];
            self.textLabel.textAlignment = NSTextAlignmentCenter;
            NSLog(@"%ld%%", (long)percent);
            self.textLabel.textColor = self.fontColor;
            self.textLabel.font = [UIFont systemFontOfSize:self.textSize];
            [self addSubview:self.textLabel];
            
            
            
        }else
        {
            // draw reached line
            self.reachedLine = [[PBLine alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 2 - self.lineWidth / 2, jointPosition, self.lineWidth * 1.5) Color:self.reachedColor];
            [self addSubview:self.reachedLine];
            
            
            //draw unreached line
            self.unreachedLine = [[PBLine alloc] initWithFrame:CGRectMake(jointPosition + (self.frame.size.width / 10), self.frame.size.height / 2 - self.lineWidth / 2, self.frame.size.width - jointPosition - (self.frame.size.width / 10), self.lineWidth) Color:self.unreachedColor];
            [self addSubview:self.unreachedLine];
            
            //draw text label
            
            NSInteger percent = self.currentData.doubleValue / self.totalData.doubleValue * 100;
            self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(jointPosition, self.frame.size.height / 2 - self.lineWidth * 10 / 2, self.frame.size.width * 10 / 100, self.lineWidth * 10)];
            self.textLabel.text = [NSString stringWithFormat:@"%ld%%", (long)percent];
            self.textLabel.textAlignment = NSTextAlignmentCenter;
            NSLog(@"%ld%%", (long)percent);
            self.textLabel.textColor = self.fontColor;
            self.textLabel.font = [UIFont systemFontOfSize:self.textSize];
            
            [self addSubview:self.textLabel];
        }

    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

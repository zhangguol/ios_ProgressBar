//
//  ProgressBar.h
//  ProgressBar
//
//  Created by Zhang Boxuan on 14-5-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBar : UIView

@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat textSize;

@property (strong, nonatomic) UIColor *reachedColor;
@property (strong, nonatomic) UIColor *unreachedColor;
@property (strong, nonatomic) UIColor *fontColor;

@property (strong, nonatomic) NSNumber *totalData;
@property (strong, nonatomic) NSNumber *currentData;

- (void)changeStatusWithCurrentData:(NSNumber*)currentData;
- (instancetype)initWithFrame:(CGRect)frame
                    TotalData:(NSNumber*)totalData
                  CurrentData:(NSNumber*)currentData;



@end

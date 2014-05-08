//
//  PBViewController.m
//  ProgressBar
//
//  Created by Zhang Boxuan on 14-5-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "PBViewController.h"
#import "ProgressBar.h"

@interface PBViewController ()

@property (strong, nonatomic) ProgressBar *pb;
@property (nonatomic) NSInteger curNum;

@end

@implementation PBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.curNum = 0;
	// Do any additional setup after loading the view, typically from a nib.
//    self.pb = [[ProgressBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    self.pb= [[ProgressBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - 50, self.view.frame.size.width, 100) TotalData:[NSNumber numberWithInteger:100] CurrentData:[NSNumber numberWithInteger:self.curNum]];
    
    self.pb.backgroundColor = [UIColor orangeColor];
    self.pb.reachedColor = [UIColor blueColor];
    self.pb.fontColor = [UIColor blueColor];
    [self.view addSubview:self.pb];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeStatus) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeStatus
{
    self.curNum += 1;
    [self.pb changeStatusWithCurrentData:[NSNumber numberWithInteger:self.curNum]];

}
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//}


@end

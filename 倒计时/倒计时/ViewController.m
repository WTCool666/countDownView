//
//  ViewController.m
//  倒计时
//
//  Created by gui hua on 2017/5/31.
//  Copyright © 2017年 szjhl. All rights reserved.
//

#import "ViewController.h"
#import "CountDownView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UISlider *hSlid;
@property (weak, nonatomic) IBOutlet CountDownView* countDownView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.hSlid addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    CountDownView * countDownView=[[CountDownView alloc] initWithFrame:CGRectMake(0, 0, self.redView.bounds.size.width, self.redView.bounds.size.height)];
    countDownView.maxMinute=60;
    [self.redView addSubview:countDownView];
     self.countDownView=countDownView;
    NSLog(@"%@",self.countDownView);
}

-(void)sliderValueChange:(UISlider*)hSlider{
    self.countDownView.currentMinute=hSlider.value;
}
@end

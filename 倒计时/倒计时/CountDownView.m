//
//  countDownView.m
//  倒计时
//
//  Created by gui hua on 2017/5/31.
//  Copyright © 2017年 szjhl. All rights reserved.
//

#import "CountDownView.h"

@implementation CountDownView

-(void)setCurrentMinute:(int)currentMinute{
    _currentMinute=currentMinute;
    [self setNeedsDisplay];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self.currentMinute=-1;
    self.layer.backgroundColor=[UIColor clearColor].CGColor;
    return [super initWithFrame:frame];
}


- (void)drawRect:(CGRect)rect {
    CGFloat selfW=self.frame.size.width;
    CGFloat selfH=self.frame.size.height;
    /**
     1.绘制背景图片
     UIImageView* bgImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
     bgImage.frame=CGRectMake(0, 0,selfW ,selfH);
     [self addSubview:bgImage];
     */
    UIImage* image=[UIImage imageNamed:@"background"];
    [image drawInRect:CGRectMake(0, 0, selfW, selfH)];
    
    /**
     2.绘制文字
     dic[NSStrokeWidthAttributeName]=@3;
     NSShadow* shadow=[[NSShadow alloc] init];
     shadow.shadowOffset=CGSizeMake(1, 1);
     shadow.shadowBlurRadius=2;
     dic[NSShadowAttributeName]=shadow;
     */
    NSString* info=@"";
    if(self.currentMinute==-1){
        info=@"0";
    }else{
        info=[NSString stringWithFormat:@"%d",self.currentMinute];
    }
    
    NSMutableDictionary* dic=[NSMutableDictionary dictionary];
    
    dic[NSFontAttributeName]=[UIFont systemFontOfSize:selfW/2];
    dic[NSForegroundColorAttributeName]=[UIColor whiteColor];
    dic[NSStrokeColorAttributeName]=[UIColor blueColor];
    CGSize infoSize=[info sizeWithAttributes:dic];
    CGFloat numX=selfW-(selfW-infoSize.width)/2-infoSize.width;
    [info drawAtPoint:CGPointMake(numX,selfH*0.85-infoSize.height) withAttributes:dic];
    
    NSString* infoMin=@"min";
    
    NSMutableDictionary* dicMin=[NSMutableDictionary dictionary];
    dicMin[NSFontAttributeName]=[UIFont systemFontOfSize:selfW/10];
    dicMin[NSForegroundColorAttributeName]=[UIColor whiteColor];
    dicMin[NSStrokeColorAttributeName]=[UIColor blueColor];
    CGSize infoMinSize=[infoMin sizeWithAttributes:dicMin];
    CGFloat minX=selfW-(selfW-infoMinSize.width)/2-infoMinSize.width;
    [infoMin drawAtPoint:CGPointMake(minX, selfH*0.82-infoSize.height) withAttributes:dicMin];
    
    //3.绘制指针
    if (self.currentMinute==-1||self.maxMinute<=0) {
        return;
    }
    for (int i=1; i<=self.currentMinute; i++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGFloat outsideRadius = selfW/2- selfW/14; // 刻度 外点半径
        CGFloat insideRadius = selfW/2-selfW/8 ; // 刻度 内点半径
        [[UIColor whiteColor] set];
        if (i % 10 == 0) {
            path.lineWidth=selfW/90;
           // [[UIColor redColor] set];
            insideRadius -= 5;
        }
        CGFloat angle = M_PI*2-(M_PI*2/self.maxMinute)*i;// 角度
        CGPoint insidePoint = CGPointMake(selfW/2 - (insideRadius * sin(angle)), selfH/2 - (insideRadius * cos(angle)));// 刻度内点
        CGPoint outsidePoint = CGPointMake(selfW/2 - (outsideRadius * sin(angle)), selfH/2 - (outsideRadius * cos(angle)));// 刻度外点
        [path moveToPoint:insidePoint];
        [path addLineToPoint:outsidePoint];
        [path stroke];
    }
    
}

@end

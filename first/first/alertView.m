//
//  alertView.m
//  first
//
//  Created by cuiwenjuan on 14-11-27.
//  Copyright (c) 2014年 cuiwenjuan. All rights reserved.
//

#import "alertView.h"

@implementation alertView

{
    int i;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.girlVoice setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        NSLog(@"initWithFrame");
        i=0;
    }
    return self;
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"awakeFromNib");
    
    //先获得各个控件的状态，然后设置显示
    
     if(i== 0)
     {
         [self.defaultVoice setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
     }
     else if(i ==1)
     {
         [self.girlVoice setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
     }
     else
     {
         [self.boyVoice setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
     }
    
    
}


-(void)createView
{
//    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(40, 60, 160, 40)];
//    [button setTitle:@"默认" forState:UIControlStateNormal ];
//    [button setImage:@"" forState:UIControlStateNormal ];
    
}

- (IBAction)voiceButtonClick:(id)sender
{
    UIButton * button = (UIButton*)sender;
    

    
    switch (button.tag) {
        case 0:
            if(i!=0)
            {
                [button setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
                [self.girlVoice setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
                [self.boyVoice setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
                i=0;
            }
            break;
        case 1:
            if(i!=1)
            {
                [button setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
                 [self.defaultVoice setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
                [self.boyVoice setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
                i=1;
            }
            break;
        case 2:
            if(i!=2)
            {
                [button setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
                [self.defaultVoice setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
                [self.girlVoice setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
                i=2;
            }
            
            break;
        case 3://确定
            
            //保存
            
            [self removeFromSuperview];
            
            break;
        case 4://取消
            
            //不写入数据
            
            [self removeFromSuperview];
            break;
        
    }
    
    
}
@end

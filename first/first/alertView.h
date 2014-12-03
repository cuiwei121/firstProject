//
//  alertView.h
//  first
//
//  Created by cuiwenjuan on 14-11-27.
//  Copyright (c) 2014年 cuiwenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface alertView : UIView
@property (weak, nonatomic) IBOutlet UIButton *defaultVoice;
@property (weak, nonatomic) IBOutlet UIButton *girlVoice;
@property (weak, nonatomic) IBOutlet UIButton *boyVoice;



- (IBAction)voiceButtonClick:(id)sender;


@end

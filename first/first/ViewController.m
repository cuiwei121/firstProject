//
//  ViewController.m
//  first
//
//  Created by cuiwenjuan on 14-11-20.
//  Copyright (c) 2014年 cuiwenjuan. All rights reserved.
//


//tableView是继承于scrollview的所以可以实现scrollview中的代理方法，
#import "ViewController.h"
#import "alertView.h"


@interface ViewController ()


@property(nonatomic,retain)UITableView * tableView;


@end

@implementation ViewController
{
    int ll;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ll=0;
    [self createButton];
    
}


-(void)createButton
{
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(140, 40, 40, 40)];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"声音" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(voiceClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: button];
    
}


-(void)voiceClick:(UIButton *)button
{
    
       [self createView];
//    [self createTableView];
   
}


#pragma mark - 创建选择对话框
-(void)createView
{

    alertView * alertview = [[[NSBundle mainBundle] loadNibNamed:@"alertView" owner:nil options:nil] lastObject];
    //    alertview.bounds = CGRectMake(0, 0, 240, 200);
     alertview.frame = CGRectMake(60, 20,240, 200);
    
    CALayer *layer = [alertview layer];
    [layer setCornerRadius:10];
    [layer setShadowOffset:CGSizeMake( 10, 10)];
    [layer setMasksToBounds:NO];//设置边框可见
    layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    [layer setBorderWidth:2];
    [layer setShadowOpacity:0.5];
    
//    alertview.layer.cornerRadius = 6.0;//阴影部分已经设置过角度了
    [self.view addSubview:alertview];
}


#pragma mark - 创建tableView
-(void)createTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 200, 320, 500)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cells = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cells];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
    }
 
    cell.textLabel.text =[NSString stringWithFormat: @"时间的路人c %d",(int)[indexPath row]  ];
    
//    NSLog(@"x == %f y ==  %f", self.tableView.contentOffset.x,self.tableView.contentOffset.y);
    
//    NSLog(@"%f and111 %f", cell.textLabel.frame.origin.x,cell.textLabel.frame.origin.y);
    return cell;
    
    
}


//完成动画
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewDidEndScrollingAnimation//完成动画");
    [self setOff];
     NSLog(@"11x == %f y ==  %f", self.tableView.contentOffset.x,self.tableView.contentOffset.y);
}


//完成滑动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating//完成滑动");
    NSLog(@"11x == %f y ==  %f", self.tableView.contentOffset.x,self.tableView.contentOffset.y);
    [self setOff];
   
}


//完成拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{
    NSLog(@"scrollViewDidEndDragging//完成拖拽");
     NSLog(@"11x == %f y ==  %f", self.tableView.contentOffset.x,self.tableView.contentOffset.y);
    [self setOff];
     NSLog(@"22x == %f y ==  %f", self.tableView.contentOffset.x,self.tableView.contentOffset.y);
}




-(void)setOff
{
//    NSLog(@"11x == %f y ==  %f", self.tableView.contentOffset.x,self.tableView.contentOffset.y);
    //偏移值
    float offSetY =self.tableView.contentOffset.y;
    //判断偏移值的大小
    int valueRe = (int)offSetY%100 ;
    int setOff = 0;
    
    if(valueRe <= 50)
    {
        setOff = offSetY -valueRe;
     
        [self.tableView setContentOffset:CGPointMake(0, setOff) animated:YES];
    
    }
    
    else
    {
        setOff = (int)offSetY-valueRe + 100;
        
        [self.tableView setContentOffset:CGPointMake(0, setOff) animated:YES];
    }
}







@end

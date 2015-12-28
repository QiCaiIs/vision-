//
//  ViewController.m
//  视觉错觉
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 奇才. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController
{
    UIView *topView;
    NSMutableArray *nameArray;
    UIView *redView;
    UIScrollView *clearScrollView;
    UIColor *titlesHeightLightColor;
    NSInteger num;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    num = 1001;
    
    nameArray = [NSMutableArray arrayWithObjects:@"文化",@"缴费单",@"机场", nil];
    
    UIImageView *clearImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    clearImageView.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:clearImageView];
    
    UIView *groundView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 50)];
    groundView.backgroundColor = [UIColor whiteColor];
//    groundView.alpha = .7;
    [self.view addSubview:groundView];
    
    NSInteger weiNum = self.view.bounds.size.width/3;
    for (NSInteger i = 0 ; i < 3; i++) {
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(weiNum*i, 0, weiNum, 50)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.text = [nameArray objectAtIndex:i];
        [groundView addSubview:nameLabel];
    }
  
    redView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, weiNum, 50)];
    redView.backgroundColor = [UIColor redColor];
    redView.layer.cornerRadius = 15;
    redView.clipsToBounds = YES;
    [self.view addSubview:redView];
    
  topView  = [[UIView alloc]initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 50)];
    topView.backgroundColor = [UIColor clearColor];
    topView.alpha = .7;
    [self.view addSubview:topView];
    
    if (titlesHeightLightColor == nil) {
        titlesHeightLightColor = [UIColor whiteColor];
    }
    
    for (NSInteger i = 0 ; i < 3; i++) {
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(weiNum*i, 0, weiNum, 50)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.text = [nameArray objectAtIndex:i];
        nameLabel.textColor = titlesHeightLightColor;
        nameLabel.tag = 1000+i;
        NSLog(@"nameLabel.tag : %d",nameLabel.tag);
//        nameLabel.backgroundColor = [UIColor clearColor];
        [topView addSubview:nameLabel];
    }
 
    clearScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, self.view.bounds.size.width, self.view.bounds.size.height-90)];
    clearScrollView.backgroundColor = [UIColor clearColor];
    clearScrollView.delegate = self;
    clearScrollView.contentSize = CGSizeMake(self.view.bounds.size.width*3, 0);
    clearScrollView.pagingEnabled = YES;
    clearScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:clearScrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == clearScrollView) {
        redView.center = CGPointMake(20+redView.frame.size.width/3+scrollView.contentOffset.x/3, redView.center.y);
        NSInteger i = clearScrollView.contentOffset.x / self.view.bounds.size.width;
        NSLog(@"i : %d",i);
        NSLog(@"num : %d",num);
//      UILabel *nameLable = [self.view viewWithTag:1000+i];
//        nameLable.textColor = [UIColor whiteColor];
//        if (num != i) {
//            UILabel *nameLable = [self.view viewWithTag:1000+i];
//            nameLable.textColor = [UIColor clearColor];
//        }
//        num = i;
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSInteger i = clearScrollView.contentOffset.x / 375;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

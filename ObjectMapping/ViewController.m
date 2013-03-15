//
//  ViewController.m
//  ObjectMapping
//
//  Created by icreative-mini on 13-3-12.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+JTObjectMapping.h"
#import "Weatherinfo.h"
#import "ModelViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize scroll;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;                         //一页页滚动
    scroll.directionalLockEnabled = YES;
    scroll.showsHorizontalScrollIndicator = YES;        //水平指示
    scroll.showsVerticalScrollIndicator = YES;          //垂直指示
    scroll.backgroundColor = [UIColor blackColor];
    [scroll setContentSize:CGSizeMake(self.view.frame.size.width * 6, self.view.frame.size.height)];
    [self.view addSubview:scroll];                      //左右滚动视图

    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0, 425, self.view.frame.size.width, 1)];
    pageControl.numberOfPages = 6;
    pageControl.userInteractionEnabled = NO;
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.view addSubview:pageControl];                  //点点点

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://m.weather.com.cn/data/101210301.html"]] options:kNilOptions error:nil];//解析json地址
    
    NSDictionary *list = [NSDictionary dictionaryWithObjectsAndKeys:
                                              @"temp1",@"temp1",
                                              @"wind1",@"wind1",
                                              @"weather1",@"weather1",
                                              
                                              @"temp2",@"temp2",
                                              @"wind2",@"wind2",
                                              @"weather2",@"weather2",
                                              
                                              @"temp3",@"temp3",
                                              @"wind3",@"wind3",
                                              @"weather3",@"weather3",
                                              
                                              @"temp4",@"temp4",
                                              @"wind4",@"wind4",
                                              @"weather4",@"weather4",
                                              
                                              @"temp5",@"temp5",
                                              @"wind5",@"wind5",
                                              @"weather5",@"weather5",
                                              
                                              @"temp6",@"temp6",
                                              @"wind6",@"wind6",
                                              @"weather6",@"weather6", nil];    //第二层映射
    
    NSDictionary *mapping = [NSDictionary dictionaryWithObjectsAndKeys:[Convert mappingWithKey:@"weatherinfo" mapping:list],@"weatherinfo", nil];                                                  //第一层映射
    weather = [Weatherinfo objectFromJSONObject:json mapping:mapping];          //参1:解析出来的数据 参2:字典映射

    ModelViewController *itemViewController = nil;

    for (int i=0; i<6; i++) {
        itemViewController = [[ModelViewController alloc] initWithNibName:@"ModelViewController" bundle:nil];
        itemViewController.view.frame = CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.view.frame.size.height);

        itemViewController.view.backgroundColor = [UIColor colorWithRed:0 green:100 blue:100 alpha:1];
        [scroll addSubview:itemViewController.view];                            //添加6个ModelViewController

        [itemViewController loadWeatherinfo:weather.weatherinfo index:(i+1)];
//        itemViewController.wind.text = [weather.weatherinfo valueForKey:[NSString stringWithFormat:@"wind%d",(i+1)]];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/scrollView.frame.size.width;
    if (index == 0) {
        NSLog(@"first page");
    }if (index == 1) {
        NSLog(@"second page");
    }if (index == 2) {
        NSLog(@"third page");
    }if (index == 3) {
        NSLog(@"fourth page");
    }if (index == 4) {
        NSLog(@"fifth page");
    }if (index == 5) {
        NSLog(@"sixth page");
    }
    pageControl.currentPage = index;
//    pageControl.defersCurrentPageDisplay = YES;
//    pageControl.hidesForSinglePage = YES;
//    [pageControl updateCurrentPageDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

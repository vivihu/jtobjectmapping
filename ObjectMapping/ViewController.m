//
//  ViewController.m
//  ObjectMapping
//
//  Created by icreative-mini on 13-3-12.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import "ViewController.h"
#import "Convert.h"
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
    scroll.pagingEnabled = YES; //一页页滚动
    scroll.directionalLockEnabled = YES;
    scroll.showsHorizontalScrollIndicator = YES;  //水平指示
    scroll.showsVerticalScrollIndicator = YES;  //垂直指示
    scroll.backgroundColor = [UIColor blackColor];
    [scroll setContentSize:CGSizeMake(self.view.frame.size.width * 6, self.view.frame.size.height)];
    [self.view addSubview:scroll];
//    NSLog(@"%@",[NSNumber numberWithFloat:self.view.frame.size.height]);
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0, 401, self.view.frame.size.width, 80)];
    pageControl.numberOfPages = 6;
    pageControl.userInteractionEnabled = NO;
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.view addSubview:pageControl];

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
                          @"weather6",@"weather6", nil];//第二层数据
    
    NSDictionary *mapping = [NSDictionary dictionaryWithObjectsAndKeys:[Convert mappingWithKey:@"weatherinfo" mapping:list],@"weatherinfo", nil];//第一层数据
    weather = [Weatherinfo objectFromJSONObject:json mapping:mapping];//参1:解析数据 参2:字典映射


    for (int i=0; i<6; i++) {
        modelView = [[ModelViewController alloc]init];
        modelView.view.frame = CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.view.frame.size.height);
//        modelView.index = i+1;
//        NSLog(@"%d",modelView.index);

        [scroll addSubview:modelView.view];
//        switch (i) {
//            case 0:
//                modelView.wind.text = weather.weatherinfo.wind1;
//                modelView.temp.text = weather.weatherinfo.temp1;
//                modelView.weather.text = weather.weatherinfo.weather1;
//                modelView.view.backgroundColor = [UIColor redColor];
//                
//                modelView.date.text = [dateFormatter stringFromDate:[NSDate date]];
//                break;
//            case 1:
//                modelView.wind.text = weather.weatherinfo.wind2;
//                modelView.temp.text = weather.weatherinfo.temp2;
//                modelView.weather.text = weather.weatherinfo.weather2;
//                modelView.view.backgroundColor = [UIColor orangeColor];
//
//                modelView.date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60 )]];
//                break;
//            case 2:
//                modelView.wind.text = weather.weatherinfo.wind3;
//                modelView.temp.text = weather.weatherinfo.temp3;
//                modelView.weather.text = weather.weatherinfo.weather3;
//                modelView.view.backgroundColor = [UIColor yellowColor];
//
//                modelView.date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60 )*2]];
//                break;
//            case 3:
//                modelView.wind.text = weather.weatherinfo.wind4;
//                modelView.temp.text = weather.weatherinfo.temp4;
//                modelView.weather.text = weather.weatherinfo.weather4;
//                modelView.view.backgroundColor = [UIColor greenColor];
//
//                modelView.date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60 )*3]];
//                break;
//            case 4:
//                modelView.wind.text = weather.weatherinfo.wind5;
//                modelView.temp.text = weather.weatherinfo.temp5;
//                modelView.weather.text = weather.weatherinfo.weather5;
//                modelView.view.backgroundColor = [UIColor cyanColor];
//
//                modelView.date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60 )*4]];
//                break;
//            case 5:
//                modelView.wind.text = weather.weatherinfo.wind6;
//                modelView.temp.text = weather.weatherinfo.temp6;
//                modelView.weather.text = weather.weatherinfo.weather6;
//                modelView.view.backgroundColor = [UIColor grayColor];
//
//                modelView.date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60 )*5]];
//                break;
//            default:
//                break;
//        }
//        [self weatherImg];
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

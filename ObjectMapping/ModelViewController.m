//
//  ModelViewController.m
//  ObjectMapping
//
//  Created by icreative-mini on 13-3-13.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import "ModelViewController.h"

@interface ModelViewController ()

@end

@implementation ModelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//在此方法里完成数据载入
- (void)loadWeatherinfo:(Convert *)weather index:(int)indexNumber {
//    self.convert = weather;
    
    dateFormatter = [[NSDateFormatter alloc]init ];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    self.date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60)*(indexNumber-1)]];
    self.temp.text = [weather valueForKey:[NSString stringWithFormat:@"temp%d",indexNumber]];
    self.wind.text = [weather valueForKey:[NSString stringWithFormat:@"wind%d",indexNumber]];
    self.weather.text = [weather valueForKey:[NSString stringWithFormat:@"weather%d",indexNumber]];

    [self weatherImg];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)weatherImg
{
    NSRange sunny = [self.weather.text rangeOfString:@"晴"];
    NSRange cloudy = [self.weather.text rangeOfString:@"云"];
    NSRange rain = [self.weather.text rangeOfString:@"雨"];
    NSRange overcast= [self.weather.text rangeOfString:@"阴"];
    if (sunny.location != NSNotFound && [self.weather.text hasSuffix:@"云"]) {
        [self.imgView1 setImage:[UIImage imageNamed:@"sunny.gif"]];
        [self.imgView2 setImage:[UIImage imageNamed:@"cloudy.gif"]];
    }//晴转云
    if (rain.location != NSNotFound && [self.weather.text hasSuffix:@"阴"]) {
        [self.imgView1 setImage:[UIImage imageNamed:@"rain.gif"]];
        [self.imgView2 setImage:[UIImage imageNamed:@"overcast.gif"]];
    }//雨转阴
    if (sunny.location != NSNotFound && [self.weather.text hasSuffix:@"雨"]) {
        [self.imgView1 setImage:[UIImage imageNamed:@"sunny.gif"]];
        [self.imgView2 setImage:[UIImage imageNamed:@"rain.gif"]];
    }//晴转雨
    if (cloudy.location != NSNotFound && [self.weather.text hasSuffix:@"雨"]) {
        [self.imgView1 setImage:[UIImage imageNamed:@"cloudy.gif"]];
        [self.imgView2 setImage:[UIImage imageNamed:@"rain.gif"]];
    }//云转雨
    if (rain.location != NSNotFound && [self.weather.text hasSuffix:@"云"]) {
        [self.imgView1 setImage:[UIImage imageNamed:@"rain.gif"]];
        [self.imgView2 setImage:[UIImage imageNamed:@"cloudy.gif"]];
    }//雨转云
    if (cloudy.location != NSNotFound && [self.weather.text hasSuffix:@"阴"]) {
        [self.imgView1 setImage:[UIImage imageNamed:@"cloudy.gif"]];
        [self.imgView2 setImage:[UIImage imageNamed:@"overcast.gif"]];
    }//云转阴
    if (overcast.location != NSNotFound && [self.weather.text hasSuffix:@"雨"]) {
        [self.imgView1 setImage:[UIImage imageNamed:@"overcast.gif"]];
        [self.imgView2 setImage:[UIImage imageNamed:@"rain.gif"]];
    }//阴转雨
    if (overcast.location != NSNotFound && [self.weather.text hasSuffix:@"云"]) {
        [self.imgView1 setImage:[UIImage imageNamed:@"overcast.gif"]];
        [self.imgView2 setImage:[UIImage imageNamed:@"cloudy.gif"]];
    }//阴转云
        

    
    //等等。。。= =！
    
    if (overcast.location ==NSNotFound && cloudy.location == NSNotFound && rain.location == NSNotFound && sunny.location != NSNotFound) {
        [self.imgView1 setImage:[UIImage imageNamed:@"sunny.gif"]];
        [self.imgView2 setImage:nil];
    }//晴天
    if (overcast.location ==NSNotFound && cloudy.location == NSNotFound && rain.location != NSNotFound && sunny.location == NSNotFound) {
        [self.imgView1 setImage:[UIImage imageNamed:@"rain.gif"]];
        [self.imgView2 setImage:nil];
    }//雨天
    if (overcast.location ==NSNotFound && cloudy.location != NSNotFound && rain.location == NSNotFound && sunny.location == NSNotFound) {
        [self.imgView1 setImage:[UIImage imageNamed:@"cloudy.gif"]];
        [self.imgView2 setImage:nil];
    }//多云
    if (overcast.location !=NSNotFound && cloudy.location == NSNotFound && rain.location == NSNotFound && sunny.location == NSNotFound) {
        [self.imgView1 setImage:[UIImage imageNamed:@"overcast.gif"]];
        [self.imgView2 setImage:nil];
    }//阴天
}


@end

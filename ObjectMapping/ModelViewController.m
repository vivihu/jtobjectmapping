//
//  ModelViewController.m
//  ObjectMapping
//
//  Created by icreative-mini on 13-3-13.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import "ModelViewController.h"
#import "Convert.h"
#import "NSObject+JTObjectMapping.h"
#import "Weatherinfo.h"

@interface ModelViewController ()

@end

@implementation ModelViewController
@synthesize wind;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Weatherinfo *weather;
    self.wind.text = [weather valueForKey:[NSString stringWithFormat:@"weather.weatherinfo.wind%d",self.index]];
    self.temp.text = [NSString stringWithFormat:@"weather.weatherinfo.temp%d",self.index];
    self.weather.text = [NSString stringWithFormat:@"weather.weatherinfo.weather%d",self.index];
    self.view.backgroundColor = [UIColor redColor];
    
    self.date.text = [dateFormatter stringFromDate:[NSDate date]];
    [self weatherImg];
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
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


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://m.weather.com.cn/data/101210301.html"]] options:kNilOptions error:nil];

    NSDictionary *weatherinfoMapping = [NSDictionary dictionaryWithObjectsAndKeys:@"temp1",@"temp1",@"fl1",@"fl1",@"index_uv",@"index_uv",
                                        @"index_d",@"index_d",@"weather1",@"weather1",nil];
    
    NSDictionary *mapping = [NSDictionary dictionaryWithObjectsAndKeys:[Convert mappingWithKey:@"weatherinfo" mapping:weatherinfoMapping],@"weatherinfo", nil];

    Weatherinfo *weather = [Weatherinfo objectFromJSONObject:json mapping:mapping];
    NSLog(@"%@",weather.weatherinfo.fl1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

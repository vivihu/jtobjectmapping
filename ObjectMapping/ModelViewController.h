//
//  ModelViewController.h
//  ObjectMapping
//
//  Created by icreative-mini on 13-3-13.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Convert.h"
@class Weatherinfo;

@interface ModelViewController : UIViewController
{
    NSDateFormatter *dateFormatter;
}
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UIImageView *imgView1;
@property (strong, nonatomic) IBOutlet UIImageView *imgView2;
@property (strong, nonatomic) IBOutlet UILabel *weather;
@property (strong, nonatomic) IBOutlet UILabel *temp;
@property (strong, nonatomic) IBOutlet UILabel *wind;

@property (strong, nonatomic) Convert *convert;
@property (nonatomic) int index;

@end
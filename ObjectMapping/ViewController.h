//
//  ViewController.h
//  ObjectMapping
//
//  Created by icreative-mini on 13-3-12.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Weatherinfo;
@class ModelViewController;

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    ModelViewController *modelView;
    UIPageControl *pageControl;
    NSDateFormatter *dateFormatter;
    Weatherinfo *weather;

}
@property (nonatomic,strong)UIScrollView *scroll;
@property (nonatomic,strong)NSString *tempText;
@property (nonatomic,strong)NSMutableArray *viewControllers;
@end

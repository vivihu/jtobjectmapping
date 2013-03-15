//
//  ViewController.h
//  ObjectMapping
//
//  Created by icreative-mini on 13-3-12.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Weatherinfo;

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    UIPageControl *pageControl;
    Weatherinfo *weather;
}
@property (nonatomic,strong)UIScrollView *scroll;

@end

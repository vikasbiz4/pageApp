//
//  APPViewController.h
//  pageApp
//
//  Created by Sheetal Shinde on 10/11/14.
//
//

#import <UIKit/UIKit.h>

@interface APPViewController : UIViewController<UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageController;

@end

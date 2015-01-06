//
//  APPViewController.m
//  pageApp
//
//  Created by Sheetal Shinde on 10/11/14.
//
//

#import "APPViewController.h"
#import "APPChildViewController.h"
#import "ChildViewController.h"

@interface APPViewController ()

@end

@implementation APPViewController
NSArray *viewControllers;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+400)];
    
    APPChildViewController *initialViewController = [self viewControllerAtIndex:0];
    ChildViewController *childTwo=[[ChildViewController alloc]initWithNibName:@"ChildViewController" bundle:nil];
    childTwo.index=1;
    
    viewControllers = @[initialViewController,childTwo];
    
    [self.pageController setViewControllers:[NSArray arrayWithObject:initialViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
   // self.pageController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:self.pageController];
    
    UIScrollView *scroll=[[UIScrollView alloc]init];
    [scroll setFrame:[[self view] bounds]];
    scroll.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+100);

    [scroll addSubview:[self.pageController view]];
    [[self view] addSubview:scroll];
    [self.pageController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (APPChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    
    APPChildViewController *childViewController = [[APPChildViewController alloc] initWithNibName:@"APPChildViewController" bundle:nil];
    childViewController.index = index;
    
    return childViewController;
    
}
- (ChildViewController *)childviewControllerAtIndex:(NSUInteger)index {
    
    
    ChildViewController *childViewController = [[ChildViewController alloc] initWithNibName:@"ChildViewController" bundle:nil];
    childViewController.index = index;
    
    return childViewController;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [viewControllers indexOfObject:viewController];//[(APPChildViewController *)viewController index];
    NSLog(@"viewControllerBeforeViewController-------");
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return viewControllers[index];//[self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [viewControllers indexOfObject:viewController];//[(ChildViewController *)viewController index];
    NSLog(@"viewControllerAfterViewController-------");

    
    index++;
    
    if (index == 2) {
        return nil;
    }
    
    return viewControllers[index];//[self childviewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 2;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

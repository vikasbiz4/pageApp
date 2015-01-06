//
//  APPChildViewController.m
//  pageApp
//
//  Created by Sheetal Shinde on 10/11/14.
//
//

#import "APPChildViewController.h"

@interface APPChildViewController ()

@end

@implementation APPChildViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.screenNumber.text = [NSString stringWithFormat:@"Screen #%ld", (long)self.index];
    NSLog(@"inside child------");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

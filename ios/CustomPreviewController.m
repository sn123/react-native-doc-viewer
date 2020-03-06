//
//  CustomPreviewController.m
//  RNReactNativeDocViewer
//
//  Created by Sheethal on 07/01/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "CustomPreviewController.h"

@interface CustomPreviewController ()

@end
NSTimer *timer;
@implementation CustomPreviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([_hideShareButton  isEqual: @"1"]) {
        timer = [NSTimer scheduledTimerWithTimeInterval: 0.25
                                                 target: self
                                               selector:@selector(onTick:)
                                               userInfo: nil repeats:YES];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (timer != nil) {
        [timer invalidate];
    }
}

-(void)onTick:(NSTimer *)timer {
    [self hideShareButton:self.view];
}

-(void) hideShareButton: (UIView *) view {
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass: [UINavigationBar class]]) {
            UINavigationBar *bar = (UINavigationBar *)subview;
            if (bar.items.count > 0) {
                UINavigationItem *item = bar.items.firstObject;
                [item setRightBarButtonItem:nil animated:false];
            }
        }
        if (subview.subviews.count > 0) {
            [self hideShareButton:subview];
        }
    }
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

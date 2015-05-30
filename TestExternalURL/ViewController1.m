//
//  ViewController1.m
//  TestExternalURL
//
//  Created by https://github.com/ChenYilong/TestExternalURL on 5/24/15.
//  Copyright (c) 2015 http://weibo.com/luohanchenyilong/ Inc. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.messageLabel.text = [NSString stringWithFormat:@"Time: %@", [[NSDate date] description]];
}

- (IBAction)returnToWebpage:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:self.sourceURL];
    // if the method above is slow, replace it by the method below
    // [NSThread detachNewThreadSelector:@selector(openURL:) toTarget:[UIApplication sharedApplication] withObject:self.sourceURL];
}


@end

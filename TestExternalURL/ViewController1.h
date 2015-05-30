//
//  ViewController1.h
//  TestExternalURL
//
//  Created by Juan C Catalan on 5/24/15.
//  Copyright (c) 2015 http://weibo.com/luohanchenyilong/ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController1 : UIViewController

@property (nonatomic, strong) NSURL *sourceURL;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

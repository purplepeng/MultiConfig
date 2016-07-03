//
//  ViewController.m
//  MultiConfigDemo
//
//  Created by PURPLEPENG on 5/22/16.
//  Copyright © 2016 PURPLEPENG. All rights reserved.
//

#import "ViewController.h"
#import "AppConfig.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *bundleIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *bundleNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *appServerURLLabel;
@property (weak, nonatomic) IBOutlet UILabel *WBAPPKeyLabel;
@property (weak, nonatomic) IBOutlet UILabel *WBAPPScretKeyLabel;
@property (weak, nonatomic) IBOutlet UILabel *WBRedirectURLLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadConfigData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)loadConfigData
{
    self.bundleIDLabel.text = [NSString stringWithFormat:@"%@",[AppConfig bundleID]];
    self.bundleNameLabel.text = [NSString stringWithFormat:@"%@",[AppConfig bundleName]];
    
    self.WBAPPKeyLabel.text = [NSString stringWithFormat:@"%@",[AppConfig WBAPPKey]];
    self.WBAPPScretKeyLabel.text = [NSString stringWithFormat:@"%@",[AppConfig WBAPPScret]];
    self.WBRedirectURLLabel.text = [NSString stringWithFormat:@"%@",[AppConfig WBRedirectURL]];
}

@end

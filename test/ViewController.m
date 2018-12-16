//
//  ViewController.m
//  test
//
//  Created by NikSun on 2018/12/16.
//  Copyright © 2018 NikSun. All rights reserved.
//

#import "ViewController.h"
#import "BackgroundView.h"

@interface ViewController ()
@property (nonatomic, strong) BackgroundView* backgroundView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.backgroundView = [[BackgroundView alloc] initWithFrame:self.view.frame];
    self.backgroundView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.backgroundView];
}

@end

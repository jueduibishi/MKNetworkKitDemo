//
//  ViewController.m
//  MKNetworkKitDemo
//
//  Created by L on 14-2-26.
//  Copyright (c) 2014年 YYF. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    self.view.backgroundColor=[UIColor blueColor];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"demo" forState:UIControlStateNormal];
	[button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:17];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(100, 100, 50, 35);
    [self.view addSubview:button];
    
}
-(void)click:(id)sender{

    [engine getDataWithPath:@"/101010100.html" completionHandler:^(NSString *responseString) {
        ;
    } errorHandler:^(NSError *error) {
        ;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

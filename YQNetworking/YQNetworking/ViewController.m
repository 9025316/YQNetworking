//
//  ViewController.m
//  YQNetworking
//
//  Created by yingqiu huang on 2017/2/10.
//  Copyright © 2017年 yingqiu huang. All rights reserved.
//

#import "ViewController.h"
#import "YQNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"size is %lu",[YQNetworking totalCacheSize]);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *url = @"http://news-at.zhihu.com/api/4/news/latest";
    [YQNetworking getWithUrl:url refreshRequest:NO cache:YES params:nil progressBlock:^(int64_t bytesRead, int64_t totalBytes) {
        NSLog(@"%lld--%lld",bytesRead,totalBytes);
    } successBlock:^(id response) {
        NSLog(@"%@",response);
    } failBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    NSLog(@"size is %lu",[YQNetworking totalCacheSize]);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

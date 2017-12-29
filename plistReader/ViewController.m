//
//  ViewController.m
//  plistReader
//
//  Created by 刘浩 on 2017/12/29.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"
#import <MJExtension/MJExtension.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Books" ofType:@"plist"];
//    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSArray *dicAry = [dict objectForKey:@"Books"];
    NSMutableArray * modelAry = [NSMutableArray new];
   __block NSString * string = @"";
    
    [dicAry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Book * book = [[Book alloc] initWithDic:obj];
      string =  [string stringByAppendingString:[NSString stringWithFormat:@"\n%@",[book stringFormate]]];
    }];
    NSError * error ;
    [string writeToFile:@"/Users/liuhao/Desktop/apps2.json" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
//    [modelAry writeToFile:@"/Users/liuhao/Desktop/apps.json" atomically:YES];  //xml格式
//    NSData *data =[NSJSONSerialization dataWithJSONObject:modelAry options:NSJSONWritingPrettyPrinted error:0];
//    [data writeToFile:@"/Users/liuhao/Desktop/apps2.json" atomically:YES];//json
//
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

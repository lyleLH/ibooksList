//
//  Book.h
//  plistReader
//
//  Created by 刘浩 on 2017/12/29.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject
@property (nonatomic,copy)NSString *bookName;
@property (nonatomic,copy)NSString *authorName;
- (instancetype)initWithDic:(NSDictionary*)dic ;
- (NSString *)stringFormate;
@end

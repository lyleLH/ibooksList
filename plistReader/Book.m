//
//  Book.m
//  plistReader
//
//  Created by 刘浩 on 2017/12/29.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import "Book.h"
@interface Book ()

@property (nonatomic,strong)NSString* categoryName ;

@end


@implementation Book
- (instancetype)initWithDic:(NSDictionary*)dic  {
    self = [super init];
    if(self){
        NSString * itemName = [dic objectForKey:@"itemName"];
        if([itemName containsString:@"牛津通识读本："]) {
            _categoryName = @"牛津通识读本";
           itemName = [itemName stringByReplacingOccurrencesOfString:@"牛津通识读本：" withString:@""];
            itemName = [itemName stringByReplacingOccurrencesOfString:@"（中文版）" withString:@""];
            itemName = [itemName stringByReplacingOccurrencesOfString:@"(中文版)" withString:@""];
            
        }
        
        _bookName = itemName ;
        _authorName = [dic objectForKey:@"artistName"];
    }
    return self;
}

- (NSString *)stringFormate{
    if(_categoryName.length>0){
        return [NSString stringWithFormat:@"《%@》- %@ - %@",_bookName,_categoryName,_authorName];
    }else{
        return [NSString stringWithFormat:@"《%@》- %@",_bookName,_authorName];
    }
    
}

@end

//
//  main.m
//  MergeTwoList
//
//  Created by chendi on 2017/4/11.
//  Copyright © 2017年 chendi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>

@interface TestClass : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *value;

- (instancetype)initWithID:(NSString *)ID Value:(NSString *)value;

@end

@implementation TestClass

- (instancetype)initWithID:(NSString *)ID Value:(NSString *)value{
    if (self = [super init]) {
        _ID = ID;
        _value = value;
    }
    return self;
}


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        TestClass *test1 = [[TestClass alloc] initWithID:@"10" Value:@"100"];
        TestClass *test2 = [[TestClass alloc] initWithID:@"11" Value:@"200"];
        TestClass *test3 = [[TestClass alloc] initWithID:@"12" Value:@"300"];
        TestClass *test4 = [[TestClass alloc] initWithID:@"13" Value:@"400"];
        NSArray *oldArr = @[test1, test2, test3, test4];
        
        TestClass *test5 = [[TestClass alloc] initWithID:@"13" Value:@"500"];
        TestClass *test6 = [[TestClass alloc] initWithID:@"14" Value:@"600"];
        NSArray *newArr = @[test5, test6];
        
        /*
         需求：以ID为唯一标识 求满足以下条件的oldArr与newArr和集finalArr
              1.oldArr与newArr不存在交集，直接 oldArr + newArr
              2.如果oldArr与newArr存在交集，则交集部分取newArr中的value
                oldArr中非交集部分直接添加，newArr也一样
         */
        
        NSMutableDictionary *oldDict = [NSMutableDictionary dictionary];
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        for (TestClass *item in oldArr) {
            [oldDict setObject:item forKey:item.ID];
        }
        
        for (TestClass *item in newArr) {
            [newDict setObject:item forKey:item.ID];
        }
        
        NSMutableArray *finalArr = [NSMutableArray array];
        // 遍历oldArr的元素，如果该元素在newArr中也有，则取newDict中的value，否则直接添加
        for (TestClass *item in oldArr) {
            TestClass *t = [newDict objectForKey:item.ID];
            if (nil != t) {
                [finalArr addObject:t];
            }else{
                [finalArr addObject:item];
            }
        }
        
        // 遍历newArr的元素，如果该元素在oldArr中不存在则添加到finalArr中
        for (TestClass *item in newArr) {
            TestClass *t = [oldDict objectForKey:item.ID];
            if (nil == t) {
                [finalArr addObject:item];
            }
        }
        
    }
    return 0;
}

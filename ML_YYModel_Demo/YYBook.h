//
//  YYBook.h
//  ML_YYModel_Demo
//
//  Created by 马文星 on 16/5/20.
//  Copyright © 2016年 Demos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYBook : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) uint64_t pages;
@property (nonatomic, strong) NSDate *publishDate;


@end

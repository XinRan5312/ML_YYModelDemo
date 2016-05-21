//
//  YYRepo.h
//  ML_YYModel_Demo
//
//  Created by 马文星 on 16/5/20.
//  Copyright © 2016年 Demos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYRepo : NSObject

@property (nonatomic, assign) uint64_t rid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *createTime;
@property (nonatomic, strong) YYUser *owner;

@end

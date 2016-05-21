//
//  YYMessage.h
//  ML_YYModel_Demo
//
//  Created by 马文星 on 16/5/20.
//  Copyright © 2016年 Demos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYMessage : NSObject

@property (nonatomic, assign) uint64_t messageId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDate *time;

@end

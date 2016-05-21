//
//  ViewController.m
//  ML_YYModel_Demo
//
//  Created by 马文星 on 16/5/20.
//  Copyright © 2016年 Demos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/*!
 *  JSON转字符串
 */
- (IBAction)click1:(id)sender {
    
    //JSON -> 模型 （json -> 字典 -> 模型）
    YYBook *book = [YYBook yy_modelWithJSON:@"     \
                    {                                           \
                    \"name\": \"Harry Potter\",              \
                    \"pages\": 512,                          \
                    \"publishDate\": \"2010-01-01\"          \
                    }"];
    NSString *bookJSON = [book yy_modelToJSONString];
    NSLog(@"Book: %@", bookJSON);

}



/*!
 *  2. 焦点模型： YYBook (解释：普通字典转模型)
 */
- (IBAction)click2:(id)sender {
    
    NSDictionary *dic = @{
                          @"name": @"Harry Potter",
                          @"pages": @(512),
                          @"publishDate": @"2010-01-01"
                          };
    
    YYBook *book1 = [YYBook yy_modelWithDictionary:dic];
    NSString *bookJSON1 = [book1 yy_modelToJSONString];
    NSLog(@"bookJSON: %@",bookJSON1);
}

/*!
 *  3. 焦点模型： YYRepo (解释：属性有自定义模型YYUser)
 */
- (IBAction)click3:(id)sender {
    
    NSDictionary *dic = @{
                          @"rid": @(123456789),
                          @"name": @"YYKit",
                          @"createTime" : @"2011-06-09T06:24:26Z",
                          @"owner": @{
                                  @"uid" : @(989898),
                                  @"name" : @"mawenxing"
                                  }
                          };
    
    YYRepo *repo1 = [YYRepo yy_modelWithDictionary:dic];
    NSLog(@"Repo1: %@\nowner.name=%@", repo1.name,repo1.owner.name);
}



/*!
 *  4. 焦点模型： YYAblum (解释：属性有数组(自定义模型)、字典、集合)
 */
- (IBAction)click4:(id)sender {
    
    
    /*!
     *  第一种：字典版
     */
    /*
    /// 数组里有模型对象
    NSDictionary *photoDic1 = @{
                            @"url":@"http://example.com/1.png",
                            @"desc":@"Happy~"};
    NSDictionary *photoDic2 = @{
                             @"url":@"http://example.com/2.png",
                             @"desc":@"Yeah!~"};
    NSArray *photos = @[photoDic1,photoDic2];
    
    
    /// 字典里面有模型对象
    NSDictionary *userDic1 = @{
                               @"uid":@10001,
                               @"name":@"Jony"};
    NSDictionary *userDic2 = @{
                               @"uid":@10002,
                               @"name":@"Anna"};
    NSDictionary *likedUsers = @{
                                 @"Jony":userDic1,
                                 @"Anna":userDic2};
    
    /// 集合里有数据
    NSSet *likedUserIds = [NSSet setWithObjects:@10001,@10002, nil];
    
    
    NSDictionary *dic = @{
                          @"name" : @"Happy Birthday",
                          @"photos": photos,
                          @"likedUsers" : likedUsers ,
                          @"likedUserIds" :likedUserIds
                          };
    
    YYAlbum *ablum = [YYAlbum yy_modelWithDictionary:dic];
    NSString *ablumJSON1 = [ablum yy_modelToJSONString];
    NSLog(@"ablumJSON1: %@", ablumJSON1);
    */
    
    /*!
     *  第二种：JSON版
     */
    YYAlbum *album = [YYAlbum yy_modelWithJSON:@"          \
                      {                                                   \
                      \"name\" : \"Happy Birthday\",                      \
                      \"photos\" : [                                      \
                      {                                               \
                      \"url\":\"http://example.com/1.png\",       \
                      \"desc\":\"Happy~\"                         \
                      },                                              \
                      {                                               \
                      \"url\":\"http://example.com/2.png\",       \
                      \"desc\":\"Yeah!\"                          \
                      }                                               \
                      ],                                                  \
                      \"likedUsers\" : {                                  \
                      \"Jony\" : {\"uid\":10001,\"name\":\"Jony\"},   \
                      \"Anna\" : {\"uid\":10002,\"name\":\"Anna\"}    \
                      },                                                  \
                      \"likedUserIds\" : [10001,10002]                    \
                      }"];
    NSString *albumJSON = [album yy_modelToJSONString];
    NSLog(@"Album: %@", albumJSON);
}

/*!
 *  5. 焦点模型：YYMessage（解释：字典里的属性名与对象的属性名不一致，手动修改）
 */
- (IBAction)click5:(id)sender {
    
    /*!
     *  第一种：字典版
     */
    NSDictionary *dic = @{@"i":@2000000001,
                          @"c":@"Hello",
                          @"t":@1437237598000};
    
    YYMessage *message = [YYMessage yy_modelWithDictionary:dic];
    
    
    NSString *messageJSON = [message yy_modelToJSONString];
    
    NSLog(@"messageJSON: %@", messageJSON);
    
    /*!
     *  第二种：JSON版
     */
//    YYMessage *message = [YYMessage yy_modelWithJSON:@"{\"i\":\"2000000001\",\"c\":\"Hello\",\"t\":\"1437237598000\"}"];
//    NSString *messageJSON = [message yy_modelToJSONString];
//     NSLog(@"messageJSON: %@", messageJSON);
}



@end

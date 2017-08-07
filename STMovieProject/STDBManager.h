//
//  STDBManager.h
//  STMovieProject
//
//  Created by 张红利 on 2017/8/3.
//  Copyright © 2017年 张红利. All rights reserved.
//
/**
 根据传入的地址字符串创建、更新数据库
 **/


#import <Foundation/Foundation.h>

@interface STDBManager : NSObject
@property(strong, readonly, nonatomic)NSString* dbFilePath;

+(instancetype)sharedInstance;
-(void)setupDB;

@end

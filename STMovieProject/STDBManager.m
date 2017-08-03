//
//  STDBManager.m
//  STMovieProject
//
//  Created by 张红利 on 2017/8/3.
//  Copyright © 2017年 张红利. All rights reserved.
//

#import "STDBManager.h"

static NSString* const dbFIleName = @"stdb.sqlite";

@interface STDBManager()

@property(strong, readwrite,nonatomic)NSString* dbFilePath;

@end

@implementation STDBManager

#pragma mark- property
-(NSString*)dbFilePath{
    if(!_dbFilePath){
        //NSArray* searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        //NSString* documentFolderPath = searchPaths[0];
       // _dbFilePath = [documentFolderPath stringByAppendingString:dbFIleName];
        _dbFilePath = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"documents/%@",dbFIleName]];
    }
    
    return _dbFilePath;
}

@end

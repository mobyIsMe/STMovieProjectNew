//
//  STDBManager.m
//  STMovieProject
//
//  Created by 张红利 on 2017/8/3.
//  Copyright © 2017年 张红利. All rights reserved.
//

#import "STDBManager.h"
#import <FMDB/FMDB.h>

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

#pragma mark - life circle
+(instancetype)sharedInstance{
    static STDBManager* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}

#pragma mark- uitlity
-(void)setupDB{
    //如果已经存在数据表，直接返回
    if([self isDBFileExist]){
        return;
    }
    //从资源文件中取数据表
    bool isSuccess = [self copyDBFileFromMainBundle];
    if(isSuccess){
        return;
    }
    
    if([self createDB]){
        [self updateDB];
    }
}

-(bool)isDBFileExist{
    return [[NSFileManager defaultManager] fileExistsAtPath:self.dbFilePath];
}

-(bool)copyDBFileFromMainBundle{
    bool result = NO;
    //没有找到数据表，就去资源文件里取
    NSString* backupDBPath = [[NSBundle mainBundle]pathForResource:@"stdb" ofType:@"sqlite"];
    if(!backupDBPath){
        return NO;//返回NO，去copy数据表
    }else{//否则就更新数据表
        bool isSuccess = [[NSFileManager defaultManager]copyItemAtPath:backupDBPath toPath:self.dbFilePath error:nil];
        if(!isSuccess){
            result = NO;
        }else{
            result = YES;
        }
    }
    return result;
}

-(bool)createDB{
    if([FMDatabase databaseWithPath:self.dbFilePath]){
        return YES;
    }
    return NO;
}

-(void)updateDB{
    FMDatabaseQueue* dbQueue = [FMDatabaseQueue databaseQueueWithPath:self.dbFilePath];
    [dbQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:[NSString stringWithFormat:@"create table if not exists st_movie (rowid integer primary key not null, name text, year text, synopsis text, thumbnail_url text)"]];
    }];

}

@end

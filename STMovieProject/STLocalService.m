//
//  STLocalService.m
//  STMovieProject
//
//  Created by 张红利 on 2017/8/3.
//  Copyright © 2017年 张红利. All rights reserved.
//

#import "STLocalService.h"
#import "STDBManager.h"
#import <FMDB/FMDB.h>


@implementation STLocalService

+(NSArray*) getAllMovies{
    NSMutableArray* __block objArr = [[NSMutableArray alloc]init];
    NSString* sql = @"select * from st_movie";
    FMDatabaseQueue* dbQueue = [FMDatabaseQueue databaseQueueWithPath:[STDBManager sharedInstance]];
}


@end

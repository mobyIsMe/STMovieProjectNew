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
    FMDatabaseQueue* dbQueue = [FMDatabaseQueue databaseQueueWithPath:[STDBManager sharedInstance].dbFilePath];
    [dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet* resultSet = [db executeQuery:sql];
        while([resultSet next]){
            [objArr addObject:[STLocalService getObjectsFromResultSet:resultSet]];
        }
    }];
    return [objArr copy];
}

+(int64_t)addOrUpdateMovie:(STMovieModel*)movie{
    int64_t __block result = -1;
    NSString* sql = [NSString stringWithFormat:@"replace into st_movie(rowid,name,year,synopsis,thumbnail_url) values(?,?,?,?,?)"];
    FMDatabaseQueue* dbQueue = [FMDatabaseQueue databaseQueueWithPath:[STDBManager sharedInstance].dbFilePath];
    [dbQueue inDatabase:^(FMDatabase *db) {
        if([db executeUpdate:sql,[NSNumber numberWithLongLong:movie.rowid],movie.name,movie.year,movie.synopsis,movie.thumbnailImageUrlStr]){
            result = (int64_t)[db lastInsertRowId];
        
        }
    }];
    return result;
};


+(bool)removeAllMovies{
    bool __block result = NO;
    NSString* sql = @"delete from st_movie";
    FMDatabaseQueue* dbQueue = [FMDatabaseQueue databaseQueueWithPath:[STDBManager sharedInstance].dbFilePath];
    [dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    
    }];
    return result;
};

+(STMovieModel*)getObjectsFromResultSet:(FMResultSet*)set{
    STMovieModel* model = [[STMovieModel alloc]init];
    model.rowid = [set longLongIntForColumn:@"rowid"];
    model.name = [set stringForColumn:@"name"];
    model.year = [set stringForColumn:@"year"];
    model.synopsis = [set stringForColumn:@"synopsis"];
    model.thumbnailImageUrlStr = [set stringForColumn:@"thumbnail_url"];
    return model;
}
@end

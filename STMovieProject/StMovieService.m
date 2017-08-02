//
//  MttMovieService.m
//  MttHD
//
//  Created by 张红利 on 2017/8/1.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import "StMovieService.h"
#import <AFNetworking/AFNetworking.h>

static NSString* const STRequestMovieDataURL = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=7waqfqbprs7pajbz28mqf6vz&page_limit=%@&page=%@";


@implementation StMovieService

#pragma mark- fetch web data
+ (void) requestMovieDataWithParamaters:(id)parameters start:(void(^)(void))start success:(void(^)(NSDictionary* result))success failure:(void(^)(NSError *error))failure{
    
    start();
    
    NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager* manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
    NSString* pageLimit = [NSString stringWithFormat:@"%d",(int32_t)[parameters[@"pageLimit"] intValue]];
    NSString* pageNum = [NSString stringWithFormat:@"%d", (int32_t)[parameters[@"pageNum"]intValue]];
    NSString* urlStr = [NSString stringWithFormat: STRequestMovieDataURL,pageLimit,pageNum];
    NSURL* url = [NSURL URLWithString:urlStr];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask* dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if(error){
            failure(error);
        }else{
            NSArray* movieList = [StMovieService parseMovieListFromData: responseObject];
            NSDictionary* result = @{@"movieList" : movieList};
            success(result);
        }
    }];
    [dataTask resume];
}

#pragma mark- utility
+ (NSArray* )parseMovieListFromData: (NSDictionary*)data{
    if(!data){
        return nil;
    }
    NSMutableArray* movieList = [[NSMutableArray alloc]init];
    NSArray* movieDataList = [data objectForKey:@"movieList"];
    for(int32_t i = 0; i< movieDataList.count; i++){
        STMovieModel* model = [[STMovieModel alloc]init];
        NSDictionary* movieData = movieDataList[i];
        model.rowid = [[movieData objectForKey:@"id"]longLongValue];
        model.name = [movieData objectForKey:@"title"];
        model.year = [movieData objectForKey:@"year"];
        model.synopsis = [movieData objectForKey:@"synopsis"];
        NSDictionary* posersData = [movieData objectForKey:@"posters"];
        if(posersData){
            model.thumbnailImageUrlStr = [posersData objectForKey:@"thumbnail"];
        }else{
            model.thumbnailImageUrlStr = nil;
        }
        [movieList addObject:model];
    }
    return [movieList copy];
}
@end

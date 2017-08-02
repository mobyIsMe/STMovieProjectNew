//
//  MttMovieService.h
//  MttHD
//
//  Created by 张红利 on 2017/8/1.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STMovieModel.h"

@interface StMovieService : NSObject

+(void)requestMovieDataWithParamaters:(id)parameters start:(void(^)(void))start success:(void(^)(NSDictionary* result))success failure:(void(^)(NSError *error))failure;
+ (void)getJsonDataWithJsonFilenName:(NSString *)jsonname start:(void(^)(void))start success:(void (^)(NSDictionary* result))success failure:(void(^)(NSError* error))failure;

@end

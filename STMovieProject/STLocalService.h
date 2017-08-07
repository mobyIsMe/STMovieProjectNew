//
//  STLocalService.h
//  STMovieProject
//
//  Created by 张红利 on 2017/8/3.
//  Copyright © 2017年 张红利. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STMovieModel.h"


@interface STLocalService : NSObject

+(NSArray*)getAllMovies;
+(int64_t)addOrUpdateMovie:(STMovieModel*)movie;
+(bool)removeAllMovies;
@end

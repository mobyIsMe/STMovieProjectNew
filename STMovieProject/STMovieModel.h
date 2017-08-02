//
//  MttSTMovieModel.h
//  MttHD
//
//  Created by 张红利 on 2017/8/1.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STMovieModel : NSObject

@property(assign, nonatomic) int64_t rowid;
@property(copy, nonatomic) NSString* name;
@property(copy, nonatomic) NSString* year;
@property(copy, nonatomic) NSString* synopsis;
@property(copy, nonatomic) NSString* thumbnailImageUrlStr;

@end

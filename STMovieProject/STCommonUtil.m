//
//  STMovieCommonUtil.m
//  STMovieProject
//
//  Created by 张红利 on 2017/7/28.
//  Copyright © 2017年 张红利. All rights reserved.
//

#import "STCommonUtil.h"

@implementation STCommonUtil

#pragma mark - Image Util

+(UIImage*)imageWithColor: (UIColor *)color{
    return [STCommonUtil imageWithColor:color withSize:CGSizeMake(1.0, 1.0)];
}

+ (UIImage *)imageWithColor: (UIColor *)color withSize: (CGSize)size{
    CGRect rect = CGRectMake(.0f, .0f,size.width,size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end

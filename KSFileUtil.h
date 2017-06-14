//
//  KSFileUtil.h
//  KevinExamples
//
//  Created by zhejunshen on 17/6/14.
//  Copyright © 2017年 zhejunshen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSFileUtil : NSObject

/**
 *  指定路径文件是否存在
 *
 *  @param filePath 文件路径
 *
 *  @return 文件是否存在
 */
+(BOOL)fileExists:(NSString *)filePath;

/**
 *  获取指定文件字节数
 *
 *  @param filePath 指定文件路径
 *
 *  @return 文件字节数
 */
+ (long long)fileSize:(NSString *)filePath;

/**
 *  根据制定目录类型／目录名称创建目录
 *
 *  @param directory     目录类型
 *  @param directoryName 目录名称
 *
 *  @return 目录路径
 */
+ (NSURL *)createDirectory:(NSSearchPathDirectory)directory directoryName:(NSString *)directoryName;

/**
 *  移除指定路径的文件元素
 *
 *  @param rootDir     目录类型
 *
 *  @return 是否移除成功
 */
+(BOOL)removeFileItem:(NSURL *)rootDir;

/**
 *  拷贝指定路径的文件元素
 *
 *  @param srcURL 原路径
 *  @param dstURL 目标路径
 *
 *  @return 是否拷贝成功
 */
+ (BOOL)copyFileItem:(NSURL *)srcURL dstURL:(NSURL *)dstURL;

/**
 *  移动指定路径的文件元素
 *
 *  @param srcURL 原路径
 *  @param dstURL 目标路径
 *
 *  @return 是否移动成功
 */
+(BOOL)moveFileItem:(NSURL *)srcURL dstURL:(NSURL *)dstURL;

/**
 *  获取Document路径
 *
 *  @return document路径
 */
+ (NSString *)documentPath;

/**
 *  获取Cache路径
 *
 *  @return cache路径
 */
+ (NSString *)cachePath;

@end

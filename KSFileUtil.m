//
//  KSFileUtil.m
//  KevinExamples
//
//  Created by zhejunshen on 17/6/14.
//  Copyright © 2017年 zhejunshen. All rights reserved.
//

#import "KSFileUtil.h"

@implementation KSFileUtil

+ (BOOL)fileExists:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL fileExists = [fileManager fileExistsAtPath:filePath];
    
    return fileExists;
}

+ (long long)fileSize:(NSString *)filePath {
    long long fileSize;
    
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:filePath]) {
        NSDictionary *fileInfo = [fm attributesOfItemAtPath:filePath error:nil];
        fileSize = [fileInfo[NSFileSize] longLongValue];
    }
    else {
        fileSize = 0;
    }
    
    return fileSize;
}

+ (NSURL *)createDirectory:(NSSearchPathDirectory)directory directoryName:(NSString *)directoryName {
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSURL *documentURL = [[fm URLsForDirectory:directory inDomains:NSUserDomainMask] firstObject];
    __block NSURL *storeURL = [documentURL URLByAppendingPathComponent:[NSString stringWithFormat:@"%@/",directoryName]];
    
    if (![fm fileExistsAtPath:storeURL.path]) {
        NSError *error;
        BOOL isSuccess = [fm createDirectoryAtPath:storeURL.path withIntermediateDirectories:YES attributes:nil error:&error];
        
        if (!isSuccess) {
            storeURL = nil;
        }
    }
    
    return storeURL;
}

+ (BOOL)removeFileItem:(NSURL *)rootDir {
    NSFileManager *fm = [NSFileManager defaultManager];
    return [fm removeItemAtURL:rootDir error:nil];
}

+ (BOOL)copyFileItem:(NSURL *)srcURL dstURL:(NSURL *)dstURL {
    NSFileManager *fm = [NSFileManager defaultManager];
    return [fm copyItemAtURL:srcURL toURL:dstURL error:nil];
}

+ (BOOL)moveFileItem:(NSURL *)srcURL dstURL:(NSURL *)dstURL {
    NSFileManager *fm = [NSFileManager defaultManager];
    return [fm moveItemAtURL:srcURL toURL:dstURL error:nil];
}

+ (NSString *)documentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths lastObject];
}

+ (NSString *)cachePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths lastObject];
}

@end

//
//  MainEngine.h
//  MKNetworkKitDemo
//
//  Created by L on 14-2-26.
//  Copyright (c) 2014年 YYF. All rights reserved.
//

#import "MKNetworkEngine.h"
/*
 注意 要使用缓存的话 必须在MainEngine init之后直接调用useCache方法
 //*/

typedef void (^ResponseBlock)(NSString *responseString);

@interface MainEngine : MKNetworkEngine

-(id) initWithDefaultSettings;
-(MKNetworkOperation*)getDataWithPath:(NSString*)urlString
                         completionHandler:(ResponseBlock)completionBlock
                              errorHandler:(MKNKErrorBlock)errorBlock;
-(MKNetworkOperation*)postDataWithPath:(NSString*)urlString
                                params:(NSDictionary*)body
                            completionHandler:(ResponseBlock)completionBlock
                                 errorHandler:(MKNKErrorBlock)errorBlock;

/*----
NSString *file = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat:@"/SampleImage.jpg"];
----*/
-(MKNetworkOperation*) uploadWithPath:(NSString*)urlString
                               params:(NSDictionary*)body
                               file:(NSString*)file
                           completionHandler:(ResponseBlock)completionBlock
                                errorHandler:(MKNKErrorBlock)errorBlock;

/*----
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
NSString *cachesDirectory = paths[0];
NSString *filePath = [cachesDirectory stringByAppendingPathComponent:@"DownloadedFile.pdf"];
 ----*/
-(MKNetworkOperation*) downloadFatAssFileFrom:(NSString*)remoteURL
                                       toFile:(NSString*)filePath;
-(void) emptyCache;
@end

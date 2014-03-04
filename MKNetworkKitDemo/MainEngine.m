//
//  MainEngine.m
//  MKNetworkKitDemo
//
//  Created by L on 14-2-26.
//  Copyright (c) 2014年 YYF. All rights reserved.
//

#import "MainEngine.h"

@implementation MainEngine
-(id) initWithDefaultSettings {
    
    if(self = [super initWithHostName:@"www.weather.com.cn/data/sk" customHeaderFields:@{@"x-client-identifier" : @"iOS"}]) {
        
    }
    return self;
}
#pragma mark -
#pragma mark - get
-(MKNetworkOperation*)getDataWithPath:(NSString*)urlString
                    completionHandler:(ResponseBlock)completionBlock
                         errorHandler:(MKNKErrorBlock)errorBlock{
    MKNetworkOperation *op=[self operationWithPath:urlString params:nil httpMethod:@"GET"];
    [op setFreezable:YES];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         // the completionBlock will be called twice.
         // if you are interested only in new values, move that code within the else block
         NSString *value=[completedOperation responseString];
         
         if([completedOperation isCachedResponse]) {
             DLog(@"Data from cache %@", value);
         }
         else {
             DLog(@"Data from server %@", value);
         }
         
         completionBlock(value);
         
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
         
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
}
#pragma mark -
#pragma mark - post
-(MKNetworkOperation*)postDataWithPath:(NSString*)urlString
                                params:(NSDictionary*)body
                     completionHandler:(ResponseBlock)completionBlock
                          errorHandler:(MKNKErrorBlock)errorBlock{
    MKNetworkOperation *op=[self operationWithPath:urlString params:body httpMethod:@"POST"];
    [op setFreezable:YES];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         // the completionBlock will be called twice.
         // if you are interested only in new values, move that code within the else block
         NSString *value=[completedOperation responseString];
         
         if([completedOperation isCachedResponse]) {
             DLog(@"Data from cache %@", value);
         }
         else {
             DLog(@"Data from server %@", value);
         }
         
         completionBlock(value);
         
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
         
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
}
#pragma mark -
#pragma mark - upload
-(MKNetworkOperation*) uploadWithPath:(NSString*)urlString
                               params:(NSDictionary*)body
                                 file:(NSString*)file
                    completionHandler:(ResponseBlock)completionBlock
                         errorHandler:(MKNKErrorBlock)errorBlock{
    MKNetworkOperation *op = [self operationWithPath:urlString
                                              params:body
                                          httpMethod:@"POST"];
    
    [op addFile:file forKey:@"media"];
    
    // setFreezable uploads your images after connection is restored!
    [op setFreezable:YES];
    
    [op addCompletionHandler:^(MKNetworkOperation* completedOperation) {
        
        NSString *value = [completedOperation responseString];
        
        completionBlock(value);
    }errorHandler:^(MKNetworkOperation *errorOp, NSError* error){
                 
                 errorBlock(error);
             }];
    
    [self enqueueOperation:op];
    
    return op;

}
#pragma mark -
#pragma mark - down
-(MKNetworkOperation*) downloadFatAssFileFrom:(NSString*) remoteURL
                                       toFile:(NSString*) filePath {
    
    MKNetworkOperation *op = [self operationWithURLString:remoteURL];
    [op setFreezable:YES];
    [op addDownloadStream:[NSOutputStream outputStreamToFileAtPath:filePath
                                                            append:YES]];
    
    [self enqueueOperation:op];
    return op;
}
#pragma mark -
#pragma mark - emptyCache
-(void) emptyCache{
    [super emptyCache];
}
@end

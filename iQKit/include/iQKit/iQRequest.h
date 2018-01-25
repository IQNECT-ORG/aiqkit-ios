//
//  IQRequest.h
//  AIQ
//
//  Created by Ricardo Santos on 27/08/2014.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

/**
 * Liyi Comment here
 * iQRequest itself not used by iQKit, but used by AIQMobile
 * iQAPISearchRequest uses iQAPIRequest class, which is quite
 * similiar with iQRequest that send http request to server, with
 * URL, parameters and post data
 */

#import <Foundation/Foundation.h>

#define DATA(X)	[X dataUsingEncoding:NSUTF8StringEncoding]

// Posting constants
#define IMAGE_CONTENT @"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\nContent-Type: image/jpeg\r\n\r\n"
#define BOUNDARY @"--iQNECT--0x0x0x0x0x0x0x0x--iQNECT--"

@interface iQRequest : NSObject

// Protected
@property (nonatomic, strong) NSMutableDictionary *params;
- (NSURL *)URLWithString:(NSString *)string andParameters:(NSDictionary *)params;
- (void)addParam:(id)param forKey:(NSString *)key;
- (NSMutableURLRequest *)URLRequestWithURL:(NSURL *)URL;
- (NSMutableURLRequest *)POSTURLRequestWithURL:(NSURL *)URL andParams:(NSDictionary *)params;
- (NSMutableURLRequest *)multipartPOSTURLRequestWithURL:(NSURL *)URL andParams:(NSDictionary *)params;
- (void)sendRequest:(NSURLRequest *)request withCompletionHandler:(void (^)(NSInteger statusCode, id jsonObject))completionHandler;

// Public
+ (instancetype)request;
- (void)runWithCompletionHandler:(void (^)(void))handler;

@end

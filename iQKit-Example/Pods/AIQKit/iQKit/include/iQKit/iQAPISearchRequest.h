//
//  iQAPISearchRequest.h
//  iQKit
//
//  Copyright (c) 2015 AIQ. All rights reserved.
//

#import "iQAPIRequest.h"
#import "iQAPISearchResponse.h"

@interface iQAPISearchRequest : iQAPIRequest

+ (instancetype)requestWithKeyword:(NSString *)keyword;
+ (instancetype)requestWithBarcode:(NSString *)barcode;
+ (instancetype)requestWithImage:(UIImage *)image;
+ (instancetype)requestWithImageData:(NSData *)imageData;

- (void)runWithCompletionHandler:(void (^)(iQAPISearchResponse *response))handler;

@end

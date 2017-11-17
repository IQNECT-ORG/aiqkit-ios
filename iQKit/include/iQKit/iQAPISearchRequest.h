//
//  iQAPISearchRequest.h
//  iQKit
//
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import "iQAPIRequest.h"
#import "iQAPISearchResponse.h"
#import <CoreLocation/CLBeaconRegion.h>

@interface iQAPISearchRequest : iQAPIRequest

+ (instancetype)requestWithKeyword:(NSString *)keyword;
+ (instancetype)requestWithBarcode:(NSString *)barcode;
+ (instancetype)requestWithImage:(UIImage *)image;
+ (instancetype)requestWithImageData:(NSData *)imageData;
+ (instancetype)requestWithBeacon:(CLBeacon *)beacon;

- (void)runWithCompletionHandler:(void (^)(iQAPISearchResponse *response))handler;

@end

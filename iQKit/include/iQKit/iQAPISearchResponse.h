//
//  iQAPISearchResponse.h
//  iQKit
//
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, iQAPISearchResponseTriggerType) {
    iQAPISearchResponseTriggerTypeImage = 1,
    iQAPISearchResponseTriggerTypeVideo = 4,
    iQAPISearchResponseTriggerTypePDF = 6,
};

@interface iQAPISearchResponse : NSObject

@property (nonatomic, assign) BOOL success;
@property (nonatomic, assign) BOOL showLogoRama;
@property (nonatomic, assign) iQAPISearchResponseTriggerType triggerType;
@property (nonatomic, strong) NSNumber *triggerID;
@property (nonatomic, strong) NSString *campaignID;
@property (nonatomic, strong) NSString *rulesetID;
@property (nonatomic, strong) NSString *brandID;
@property (nonatomic, strong) NSString *productID;
@property (nonatomic, strong) NSString *ruleID;
@property (nonatomic, strong) NSURL *payload;
@property (nonatomic, strong) NSURL *matchedURL;
@property (nonatomic, strong) NSString *searchBarTitle;
@property (nonatomic, strong) NSString *popupMessage;
@property (nonatomic, strong) NSString *htmlString;
@property (nonatomic, strong) NSMutableArray *multiplePayloads;
@property (nonatomic, strong) NSDate *searchDateTime;
@property (nonatomic, strong) NSNumber *frame;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end

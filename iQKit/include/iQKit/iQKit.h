//
//  iQKit.h
//  iQKit
//
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "iQStyle.h"
#import "iQScannerViewController.h"
#import "iQAPISearchRequest.h"
#import "iQNetworkStatus.h"
#import "iQDataStore.h"

typedef NS_ENUM(NSUInteger, iQKitAPIServer) {
    iQKitAPIServerProduction,
    iQKitAPIServerStaging,
    iQKitAPIServerDevelopment
};

@protocol iQKitDelegate <NSObject>

- (CLLocationCoordinate2D)iQKitCurrentLocation;

@optional
- (void)iQKitWantsToShowAPIError:(iQAPIErrorResponse *)errorResponse withTitle:(NSString *)title;
- (void)iQKitAnalyticEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label;

@end

@interface iQKit : NSObject

+ (instancetype)sharedInstance;

///--------------------------------------
/// @name Configuring iQKit
///--------------------------------------

/*!
 @abstract Sets the appId and appToken of your application.
 
 @param appId The app ID for your iQKit application.
 @param appToken The app token for your iQKit application.
 */
+ (void)setAppID:(NSString *)appID andAppSecret:(NSString *)appSecret;

/*!
 @abstract Sets the youtubeApiKey of your application.
 
 @param youtubeApiKey The API Key for your Youtube requests.
 */
+ (void)setYoutubeApiKey:(NSString *)youtubeApiKey;

/*!
 @abstract The current app id that was used to configure iQKit.
 */
+ (NSString *)appId;

/*!
 @abstract The current client key that was used to configure Parse framework.
 */
+ (NSString *)appSecret;

/*!
 @abstract API Key for Youtube search requests.
 */
+ (NSString *)youtubeApiKey;

/*!
 @abstract Set which API server you want to reference
 */
+ (void)setAPIServerType:(iQKitAPIServer)serverType;

/*!
 @abstract Set a custom API path to reference for all API requests
 */
+ (void)setAPIBasePath:(NSString *)apiBasePathOverride;

/*!
 @abstract Sets the iQKit delegate object.
 
 @param delegate the delegate.
 */
@property (nonatomic, assign) NSObject<iQKitDelegate> *delegate;

/*!
 @abstract Sets the age of the app user.
 
 @param age The age of the user.
 */
+ (void)setUserAge:(NSNumber *)userAge;

/*!
 @abstract The age of the user.
 */
+ (NSNumber *)userAge;

/*!
 @abstract Sets the gender of the app user.
 
 @param gender The gender of the user, accepts single character 'm' or 'f' or blank.
 */
+ (void)setUserGender:(NSString *)userGender;

/*!
 @abstract The gender of the user.
 */
+ (NSString *)userGender;

@end

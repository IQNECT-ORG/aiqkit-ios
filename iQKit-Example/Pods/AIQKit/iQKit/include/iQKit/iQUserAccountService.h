//
//  iQUserAccountService.h
//  AIQ
//
//  Created by Liyi Huang on 17/01/2018.
//  Copyright (c) 2018 AIQ Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@class iQMOUserAccount;

@interface iQUserAccountService : NSObject

@property (readonly, nonatomic) BOOL userLoggedIn;

+ (instancetype)sharedInstance;

- (void)saveContext;

- (BOOL)isAccountCreated;
- (iQMOUserAccount *)fetchAccount;

- (iQMOUserAccount *)updateAccountFromFacebook:(id)graphDictionary accessToken:(FBSDKAccessToken*)accessToken apiUserDictionary:(NSDictionary *)userDictionary;

- (iQMOUserAccount *)createAccountWithDictionary:(NSDictionary*)userDictionary password:(NSString *)password photo:(NSData *)photo;
- (iQMOUserAccount *)updateAccountWithDictionary:(NSDictionary*)userDictionary;
- (iQMOUserAccount *)updateAccountWithDictionary:(NSDictionary*)userDictionary photo:(NSData *)photo;

- (UIImage *) getUserPhoto;

- (void)refreshUserSession;
- (void)logOutUser;

- (void) presentSignInView;
- (void)presentFacebookLoginWithCompletionHandler:(void (^)(bool success))handler;

@end

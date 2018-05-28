//
//  iQMOUserAccount.h
//  
//
//  Created by Liyi Huang on 17/01/2018.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface iQMOUserAccount : NSManagedObject

@property (nonatomic, retain) NSString * avatarURLString;
@property (nonatomic, retain) NSDate * birthday;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * facebookAccessToken;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * mobileNumber;
@property (nonatomic, retain) NSString * mobilePrefix;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * shopperReference;

@end

//
//  IQBrowserTab.h
//  iQNECT
//
//  Created by Ric Santos on 28/11/2014.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "iQModelObject.h"

@interface iQBrowserTab : iQModelObject

@property (nonatomic, strong) NSString *archiveFilename;
@property (nonatomic, strong) NSString *snapshotFilename;
@property (nonatomic, strong) NSString *searchBarText;
@property (nonatomic, strong) NSNumber *channelID;
@property (nonatomic, strong) NSNumber *appMode;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, strong) NSNumber *scrollPosition;


// lazy loaded
@property (nonatomic, strong) UIImage *snapshotImage;
@property (nonatomic, strong) NSData *archiveData;

@end

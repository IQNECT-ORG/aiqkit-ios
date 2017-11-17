//
//  iQDataStore.h
//  iQKit
//
//  Created by Dan Silk on 17/07/2015.
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "iQBrowserTab.h"

#import "MOSearchLog.h"
#import "MOMusicLog.h"
#import "MOEvent.h"

extern NSString * const iQDataStoreSaveChannelSetCompleteNotification;

@class iQMusicItem;

@interface iQDataStore : NSObject

+ (instancetype)sharedInstance;
- (void)saveToDisk;
- (void)saveContext;
- (void)flushEvents;
- (void)clearDataStore;

@property (nonatomic, readonly) NSMutableArray *browserTabs;
- (void)addBrowserTab:(iQBrowserTab *)broswerTab;
- (void)updateBrowserTab:(iQBrowserTab *)browserTab;
- (void)removeBrowserTabAtIndex:(NSUInteger)index;
- (void)loadSnapshotForBrowserTab:(iQBrowserTab *)browserTab;
- (void)loadArchivedDataForBrowserTab:(iQBrowserTab *)browserTab;
- (iQBrowserTab *)selectedBrowserTab;

@property (nonatomic, strong) NSMutableArray *newsItems;

// Core Data

- (NSManagedObjectContext *)managedObjectContext;

- (void)addSearchLogWithQuery:(NSString *)query andChannelID:(NSNumber *)channelID;
- (void)addMusicLog:(iQMusicItem*)musicItem;
- (void)addEventWithCategory:(NSString *)category andAction:(NSString *)action andLabel:(NSString *)label andValue:(NSNumber *)value;

@end

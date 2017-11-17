//
//  IQMusicRecord.h
//  iQNECT
//
//  Created by Xu Zhao on 17/12/14.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iQMusicItem.h"

@interface iQMusicRecord : iQModelObject
@property BOOL haveLoadedImage;
@property (nonatomic, strong) iQMusicItem *musicItem;
@property (nonatomic, strong) NSString *artistID;
@property (nonatomic, strong) NSString *albumID;
@property (nonatomic, strong) NSString *trackID;
@property (nonatomic, strong) NSString *albumURL;
@property (nonatomic, strong) NSString *trackPreViewURLString;
@end

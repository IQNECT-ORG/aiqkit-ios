//
//  IQWebViewController.h
//  iQNECT
//
//  Created by Xu Zhao on 9/1/15.
//  Copyright (c) 2015 NextFaze Pty Ltd. All rights reserved.
//

#import "iQViewController.h"

@interface iQWebViewController : iQViewController

@property (nonatomic, assign) BOOL showDoneButton;

- (id)initWithURL:(NSURL*)URL;

@end

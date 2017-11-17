//
//  IQSharer.h
//  iQNECT
//
//  Created by Ricardo Santos on 14/05/2015.
//  Copyright (c) 2015 NextFaze Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface iQSharer : NSObject

@property (nonatomic, strong) NSString *productTitle;
@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, strong) UIImage *image;

- (void)presentFromViewController:(UIViewController *)viewController;

@end

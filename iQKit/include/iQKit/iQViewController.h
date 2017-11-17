//
//  iQViewController.h
//  iQKit
//
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NFAllocInit/NFAllocInit.h>

@class iQViewController;

@protocol iQViewControllerDelegate<NSObject>

@optional
- (void)iqViewControllerWantsMainDisplayed:(iQViewController *)viewController;
- (void)iqViewController:(iQViewController *)viewController wantsViewControllerPresented:(UIViewController *)viewControllerToPresent;

@end

@interface iQViewController : UIViewController <UIViewControllerTransitioningDelegate>

/*!
 The screen name, for purposes of Google Analytics tracking. If this is `nil`,
 no tracking calls will be made.
 */
@property (nonatomic, copy)   NSString *screenName;

@property (nonatomic, weak) NSObject<iQViewControllerDelegate> *delegate;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@property (nonatomic, strong) UIView *statusBarView;
@property (nonatomic, strong) UITableView *tableView;

@end

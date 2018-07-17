//
//  iQNothingScannedViewController.h
//  AIQ
//
//  Created by Liyi on 11/07/2018.
//  Copyright © 2018 AIQ Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iQNothingScannedViewController;

@protocol iQNothingScannedViewControllerDelegate <NSObject>

- (void)nothingScannedViewController:(iQNothingScannedViewController *)nothingScannedViewController didChangePageWithIndex:(NSInteger)pageIndex;
- (void)nothingScannedViewControllerDidTapClose:(iQNothingScannedViewController *)nothingScannedViewController;

@end

@interface iQNothingScannedViewController : UIPageViewController

@property (nonatomic, weak) NSObject<iQNothingScannedViewControllerDelegate> *hintsDelegate;

- (instancetype)initWithFirstPageIndex:(NSInteger)firstPageIndex;

@end

//
//  iQScannerOverlayView.h
//  iQKit
//
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class iQScannerOverlayView;

@protocol iQScannerOverlayViewDelgate <NSObject>

- (void)scannerOverlayViewDidTapCancel:(iQScannerOverlayView *)overlayView;
- (void)scannerOverlayViewDidTapCamera:(iQScannerOverlayView *)overlayView;
- (void)scannerOverlayViewDidTapHints:(iQScannerOverlayView *)overlayView;
- (void)scannerOverlayViewDidTapFlashON:(iQScannerOverlayView *)overlayView;
- (void)scannerOverlayViewDidTapFlashOFF:(iQScannerOverlayView *)overlayView;
@optional
- (void)scannerOverlayViewDidTapToFocus:(iQScannerOverlayView *)overlayView atPoint:(CGPoint)point;
- (void)scannerOverlayViewDidZoom:(CGFloat)zoom;
@end

@interface iQScannerOverlayView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
- (void)setTitle:(NSString *)title;

@property (nonatomic, strong) UIButton *hintButton;
@property (nonatomic, strong) UIButton *menuButton;
@property (nonatomic, strong) UIButton *musicButton;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *galleryButton;
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIButton *flashButton;
@property (nonatomic, strong) UILabel *flashLabel;
@property (nonatomic) AVCaptureTorchMode torchMode;
@property (nonatomic, assign) BOOL deviceUnstableDisplayed;
@property (nonatomic, assign) NSObject<iQScannerOverlayViewDelgate> *delegate;
@property (strong, nonatomic) NSTimer * steadyMessageTimer;
@property (nonatomic, assign) BOOL showHintsButton;

- (void)setDeviceUnstableDisplayed:(BOOL)deviceUnstableDisplayed;

@end

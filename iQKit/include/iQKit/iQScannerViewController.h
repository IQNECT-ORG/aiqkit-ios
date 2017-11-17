//
//  iQScannerViewController.h
//  iQKit
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import "iQViewController.h"
#import "iQScannerOverlayView.h"
#import <AVFoundation/AVFoundation.h>

@class iQScannerViewController;
@class iQAPISearchResponse;

typedef NS_ENUM(NSInteger, iQScannerViewControllerIntent) {
    iQScannerViewControllerIntentBarcode,
    iQScannerViewControllerIntentQR,
    iQScannerViewControllerIntentPhoto,
    iQScannerViewControllerIntentBusinessCard
};

@protocol iQScannerViewControllerDelegate <NSObject, iQViewControllerDelegate>

- (void)scannerViewController:(iQScannerViewController *)scannerViewController didLoadSearchResponse:(iQAPISearchResponse *)searchResponse;
- (void)scannerViewController:(iQScannerViewController *)scannerViewController didSearchWithKeyword:(NSString *)keyword;
@optional
- (void)scannerViewController:(iQScannerViewController *)scannerViewController didScanQRCodeWithURL:(NSURL *)url;
- (void)scannerViewController:(iQScannerViewController *)scannerViewController didTakePhoto:(NSData *)imageData;
- (void)scannerViewController:(iQScannerViewController *)scannerViewController didPassBackFrame:(NSData *)imageData;
- (void)scannerViewControllerDidCancel:(iQScannerViewController *)scannerViewController;
- (void)scannerViewControllerDidTapMic:(iQScannerViewController *)scannerViewController;

@end

@interface iQScannerViewController : iQViewController <AVCaptureMetadataOutputObjectsDelegate, AVCaptureVideoDataOutputSampleBufferDelegate>

@property (nonatomic, assign) NSObject<iQScannerViewControllerDelegate> *delegate;

/*!
 @abstract Determines how the scanner should handle failed image searches.
 
 @param handleFailedImages - If YES, the scanner will present a form for the user to submit the failed image to the image database. If NO the scanner will return with a nil response. Defaults to YES.
 */
@property (nonatomic, assign) BOOL handleFailedImages;

/*!
 @abstract Determines if the scanner should return the image data.
 
 @param passBackImageData - If YES, the scanner will return the image data via the scannerViewController:didTakePhoto: delegate, and will not send a search request. Defaults to NO.
 */
@property (nonatomic, assign) BOOL passBackImageData;
@property (nonatomic, assign) BOOL passBackNextFrame;

@property (nonatomic, nonatomic) BOOL continuousScanEnabled;

@property (strong, nonatomic) UIView *previewView;
@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic, strong) iQScannerOverlayView *scannerOverlayView;

@property (nonatomic, strong) UIButton *menuButton;
-(void)setLeftMenuButton:(UIButton*)leftButton;

-(void)resetCaptureScreen;
-(void)startBarAnimation;
-(void)stopScreenCapturing;

- (void)showScannerOverlayView;

@property (nonatomic, assign) BOOL hintsDisplayed;

- (void)takePhoto;
- (void)takePhotoWithCompletionHandler:(void (^)(NSData *imageData))handler;

- (void)checkIfCameraPermissionIsGranted:(void (^)(BOOL granted))completion;
- (void)showCameraPermissionsRequiredAlert;

-(void)startRunning;
-(void)stopRunning;
-(void)startOpenGL;
-(void)stopOpenGL;

- (void)setTorchMode:(AVCaptureTorchMode)torchMode;

@end

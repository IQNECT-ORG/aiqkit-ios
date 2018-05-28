//
//  iQScannerViewController.h
//  iQKit
//  Copyright (c) 2015 AIQ. All rights reserved.
//

#import "iQViewController.h"
#import "iQScannerOverlayView.h"
#import <AVFoundation/AVFoundation.h>

@class iQScannerViewController;
@class iQAPISearchResponse;


@class iQScannerView;

typedef NS_ENUM(NSInteger, iQScannerViewIntent) {
    iQScannerViewIntentBarcode,
    iQScannerViewIntentQR,
    iQScannerViewIntentPhoto,
    iQScannerViewIntentBusinessCard
};

@protocol iQScannerViewDelegate <NSObject>

- (void)scannerView:(iQScannerView *)scannerView didLoadSearchResponse:(iQAPISearchResponse *)searchResponse;
- (void)scannerView:(iQScannerView *)scannerView didSearchWithKeyword:(NSString *)keyword;
@optional
- (void)scannerView:(iQScannerView *)scannerView didScanQRCodeWithURL:(NSURL *)url;
- (void)scannerView:(iQScannerView *)scannerView didTakePhoto:(NSData *)imageData;
- (void)scannerView:(iQScannerView *)scannerView didPassBackFrame:(NSData *)imageData;
- (void)scannerViewDidCancel:(iQScannerView *)scannerView;
- (void)scannerViewDidTapMic:(iQScannerView *)scannerView;

@end

@interface iQScannerView : UIView <AVCaptureMetadataOutputObjectsDelegate, AVCaptureVideoDataOutputSampleBufferDelegate>



/////////
- (void)load;
- (void)appearView;
- (void)disappearView;
////////


@property (nonatomic, assign) NSObject<iQScannerViewDelegate> *delegate;

/*!
 @abstract Determines how the scanner should handle failed image searches.
 
 @param handleFailedImages - If YES, the scanner will present a form for the user to submit the failed image to the image database. If NO the scanner will return with a nil response. Defaults to YES.
 */
@property (nonatomic, assign) BOOL handleFailedImages;

/*!
 @abstract Determines if the scanner should return the image data.
 
 @param passBackImageData - If YES, the scanner will return the image data via the scannerView:didTakePhoto: delegate, and will not send a search request. Defaults to NO.
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

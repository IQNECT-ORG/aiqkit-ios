//
//  ViewController.m
//  AIQKit-Example
//
//  Copyright (c) 2018 AIQ. All rights reserved.
//

#import <MobileCoreServices/UTCoreTypes.h>
#import <AIQKit/iQKit.h>
#import "ViewController.h"
#import "SVProgressHUD.h"
#import "SVWebViewController.h"

@interface ViewController () <iQScannerViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *scannerButton;
@property (strong, nonatomic) IBOutlet UILabel *shortDescription;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* tips = nil;
    NSString* btnTitle = nil;
#if IMAGESOURCE == 1
    btnTitle = @"Take Picture";
    tips = @"Search an image from camera capture.";
#elif IMAGESOURCE == 2
    btnTitle = @"Pick Image";
    tips = @"Search an image from Photo Gallery.";
#elif IMAGESOURCE == 3 // scanner
    btnTitle = @"Open Scanner";
    tips = @"Open AIQ Scanner to start search.";
#else
    
#endif
    
    _scannerButton.layer.cornerRadius = 16.0;
    [_scannerButton setTitle:btnTitle forState:UIControlStateNormal];
    _shortDescription.text = tips;
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

- (void)scannerButtonTapped:(UIButton *)sender
{
    iQScannerViewController *scannerViewController = [[iQScannerViewController alloc] init];
    scannerViewController.delegate = self;
    self.definesPresentationContext = YES;
    [self presentViewController:scannerViewController animated:YES completion:nil];
    
    // to enable QR Code handling
    scannerViewController.handlesQRCode = YES;
}

- (void)cameraButtonTapped:(UIButton *)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = NO;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)galleryButtonTapped:(UIButton *)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = NO;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (IBAction)buttonClicked:(UIButton *)sender {
#if IMAGESOURCE == 1
    [self cameraButtonTapped: sender];
#elif IMAGESOURCE == 2
    [self galleryButtonTapped: sender];
#elif IMAGESOURCE == 3
    [self scannerButtonTapped: sender];
#else
    
#endif
}

#pragma mark - show payload

- (void)processSearchResponse:(iQAPISearchResponse *)searchResponse
{    
    if (searchResponse.payload) {
        SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithURL:searchResponse.payload];
        [self presentViewController:webViewController animated:YES completion:nil];
    } else {
        [SVProgressHUD showErrorWithStatus:@"No result found."];
    }
}

#pragma mark - iQScannerViewControllerDelegate

- (void)scannerViewController:(iQScannerViewController *)scannerViewController didSearchWithKeyword:(NSString *)keyword
{
    //reserved, do nothing here
}

- (void)scannerViewController:(iQScannerViewController *)scannerViewController didLoadSearchResponse:(iQAPISearchResponse *)searchResponse
{
    [scannerViewController dismissViewControllerAnimated:YES completion:^{
        [self processSearchResponse:searchResponse];
    }];
}

- (void)scannerViewControllerDidCancel:(iQScannerViewController *)scannerViewController
{
    [scannerViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [SVProgressHUD show];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [[iQAPISearchRequest requestWithImage:image] runWithCompletionHandler:^(iQAPISearchResponse *response) {
            [SVProgressHUD dismiss];
            [self processSearchResponse:response];
        }];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// QR code handler
//- (void)scannerViewController:(iQScannerViewController *)scannerViewController didScanQRCodeWithURL:(NSURL *)url {  
//    // QRcode detected
//    NSLog(@"QR code URL is %@",url);
//}
@end

//
//  ViewController.m
//  AIQKit-Example
//
//  Copyright (c) 2015 AIQ. All rights reserved.
//

#import <MobileCoreServices/UTCoreTypes.h>
#import <AIQKit/iQKit.h>
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ViewController.h"
#import "SVProgressHUD.h"
#import "SVWebViewController.h"

@interface ViewController () <iQScannerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
{
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString* tips = nil;
    NSString* btnTitle = nil;
    CGFloat padding = 60.0;
    SEL btnClicked  = nil;
    CGFloat fontSize = 16;
#if IMAGESOURCE == 3 // scanner
    btnTitle = @"Open Scanner";
    btnClicked = @selector(scannerButtonTapped:);
    tips = @"Open AIQ Scanner to start search!";
    fontSize = 16;
#elif IMAGESOURCE == 1 // take picture from camera
    btnTitle = @"Take Picture";
    btnClicked = @selector(cameraButtonTapped:);
    tips = @"Search an image from camera capture!";
    fontSize = 14;
#else // IMAGESOURCE == "image picker" // 2
    btnTitle = @"Pick Image";
    btnClicked = @selector(galleryButtonTapped:);
    tips = @"Search an image from Photo Gallery!";
    fontSize = 15;
#endif
    [self.view setBackgroundColor:UIColorFromRGB(0xf6921e)];
    // add button
    UIButton *scannerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    scannerButton.frame = CGRectMake(padding, 260.0 + padding, self.view.frame.size.width - 2*padding, 44.0);
    scannerButton.backgroundColor = [UIColor whiteColor];
    [scannerButton setTitleColor:UIColorFromRGB(0xf6921e) forState:UIControlStateNormal];
    scannerButton.layer.cornerRadius = 16.0;
    [scannerButton setTitle:btnTitle forState:UIControlStateNormal];
    [scannerButton addTarget:self action:btnClicked forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scannerButton];
    
    // add tips
    padding = 30.0;
    UILabel* labelTip = [[UILabel alloc] initWithFrame:CGRectMake(padding, 340.0 + padding, self.view.frame.size.width - 2*padding, 40.0)];
    labelTip.backgroundColor = UIColorFromRGB(0xf6921e);
    labelTip.textColor = [UIColor whiteColor];
    [labelTip setFont:[UIFont systemFontOfSize:fontSize]];
    labelTip.lineBreakMode = NSLineBreakByWordWrapping;
    labelTip.numberOfLines = 0;
    labelTip.text = tips;
    [self.view addSubview:labelTip];
    
    // test register
    /*_loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(padding, scannerButton.bottom + 2 * padding + 1*scannerButton.height, scannerButton.width, scannerButton.height);
    _loginButton.backgroundColor = [UIColor lightGrayColor];
    _loginButton.layer.cornerRadius = 4.0;
    [_loginButton setTitle:@"Register" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(registerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];*/
    
    // test login
    /*_loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(padding, scannerButton.bottom + 3 * padding + 2*scannerButton.height, scannerButton.width, scannerButton.height);
    _loginButton.backgroundColor = [UIColor lightGrayColor];
    _loginButton.layer.cornerRadius = 4.0;
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];*/
    
    
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)scannerButtonTapped:(id)sender
{
    iQScannerViewController *scannerViewController = [[iQScannerViewController alloc] init];
    scannerViewController.delegate = self;
    
    [self presentViewController:scannerViewController animated:YES completion:nil];
}

- (void)cameraButtonTapped:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = NO;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}


- (void)galleryButtonTapped:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = NO;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)loginButtonTapped:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController* lc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:lc animated:NO completion:nil];
}

- (void)registerButtonTapped:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegisterViewController* rc = [storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self presentViewController:rc animated:NO completion:nil];
}

#pragma mark -

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

@end

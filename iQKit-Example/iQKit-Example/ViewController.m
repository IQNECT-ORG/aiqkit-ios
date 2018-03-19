//
//  ViewController.m
//  iQKit-Example
//
//  Copyright (c) 2015 iQNECT. All rights reserved.
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
    
    CGFloat padding = 20.0;
    
    UIButton *scannerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    scannerButton.frame = CGRectMake(padding, 20.0 + padding, self.view.frame.size.width - 2*padding, 44.0);
    scannerButton.backgroundColor = [UIColor lightGrayColor];
    scannerButton.layer.cornerRadius = 4.0;
    [scannerButton setTitle:@"Open Scanner" forState:UIControlStateNormal];
    [scannerButton addTarget:self action:@selector(scannerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scannerButton];
    
    UIButton *galleryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    galleryButton.frame = CGRectMake(padding, scannerButton.bottom + padding, scannerButton.width, scannerButton.height);
    galleryButton.backgroundColor = [UIColor lightGrayColor];
    galleryButton.layer.cornerRadius = 4.0;
    [galleryButton setTitle:@"Image Picker" forState:UIControlStateNormal];
    [galleryButton addTarget:self action:@selector(galleryButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:galleryButton];
    
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

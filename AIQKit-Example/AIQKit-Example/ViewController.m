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



@interface ViewController () <iQScannerViewDelegate, iQScannerViewControllerDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
{
    iQScannerView* _vv;
    UIButton *scannerButton;
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
#elif IMAGESOURCE == 4 // take picture from camera
    btnTitle = @"Open Scanner";
    btnClicked = @selector(embedButtonTapped:);
    tips = @"Embed scanner as subview of this page!";
    fontSize = 14;
    padding = 30;
#else // IMAGESOURCE == "image picker" // 2
    btnTitle = @"Pick Image";
    btnClicked = @selector(galleryButtonTapped:);
    tips = @"Search an image from Photo Gallery!";
    fontSize = 15;
#endif
    [self.view setBackgroundColor:UIColorFromRGB(0xf6921e)];
    // add button
    scannerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    scannerButton.frame = CGRectMake(padding, self.view.frame.size.height*3/5 + padding, self.view.frame.size.width - 2*padding, 44.0);
    scannerButton.backgroundColor = [UIColor whiteColor];
    [scannerButton setTitleColor:UIColorFromRGB(0xf6921e) forState:UIControlStateNormal];
    scannerButton.layer.cornerRadius = 16.0;
    [scannerButton setTitle:btnTitle forState:UIControlStateNormal];
    [scannerButton addTarget:self action:btnClicked forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scannerButton];
    
    // add tips
    padding = 30.0;
    UILabel* labelTip = [[UILabel alloc] initWithFrame:CGRectMake(padding, self.view.frame.size.height*3/5 + 2*padding + 44,
                                                                  self.view.frame.size.width - 2*padding, 40.0)];
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
    
    /*_vv = [[iQScannerView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height/2)];
    _vv.backgroundColor = [UIColor redColor];
    [self.view addSubview:_vv];
    [_vv load];*/

    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //[_vv appearView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //[_vv disappearView];
}

- (void)embedButtonTapped:(id)sender
{
    static BOOL added = NO;
    if( !added )
    {
        _vv = [[iQScannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*3/5)];
        _vv.backgroundColor = [UIColor redColor];
        [self.view addSubview:_vv];
        added = YES;
        [scannerButton setTitle:@"Close Scanner" forState:UIControlStateNormal];
    }
    else{
        [_vv removeFromSuperview];
        added = NO;
        [scannerButton setTitle:@"Open Scanner" forState:UIControlStateNormal];
    }
}

- (void)scannerButtonTapped:(id)sender
{

    iQScannerViewController *scannerViewController = [[iQScannerViewController alloc] init];
    
    scannerViewController.delegate = self;
    //scannerViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width, 2*self.view.frame.size.height/3);
 
    //scannerViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    //scannerViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //scannerViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 2*self.view.frame.size.height/3);
    self.definesPresentationContext = YES;
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
    
    [self processSearchResponse:searchResponse];
}

- (void)scannerView:(iQScannerView *)scannerView didLoadSearchResponse:(iQAPISearchResponse *)searchResponse
{
    //[self processSearchResponse:searchResponse];
}

- (void)scannerViewControllerDidCancel:(iQScannerViewController *)scannerViewController
{
    [scannerViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)scannerViewDidCancel:(iQScannerView *)scannerView
{
    // here we do nothing
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

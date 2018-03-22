//
//  LoginViewController.m
//  AIQKit-Example
//
//  Created by AIQ on 18/1/18.
//  Copyright © 2018 AIQ. All rights reserved.
//

#import "LoginViewController.h"
#import "iQUserLoginRequest.h"
#import "iQUserAccountService.h"
#import "MessageViewController.h"
#import "SVProgressHUD.h"

@interface LoginViewController ()
{
    NSString* mode;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if( [self->mode isEqualToString:@"register"])
    {
        [self.pageTitle setText:@"Sign Up"];
        [self.signButton setTitle:@"SIGN UP" forState:UIControlStateNormal];
        [self.loginFButton setHidden:YES];
    }
    else
    {
        // do nothing
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)onSign:(id)sender
{
    NSLog(@"Login");
    [self.view endEditing:YES];

    iQUserLoginRequest *logInRequest = [iQUserLoginRequest new];
    
    logInRequest.email = self.email.text;
    logInRequest.password = self.password.text;
    
    [logInRequest runWithCompletionHandler:^(NSDictionary *userDictionary, NSString *errorMessage) {
        
        NSLog(@"got response");
        if (!errorMessage)
        {
            NSLog(@"no error got response");
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            MessageViewController* mvc = [storyboard instantiateViewControllerWithIdentifier:@"MessageViewController"];
            [mvc message:@"Login Successfully"];
            [self presentViewController:mvc animated:YES completion:nil];
        }
    }];
    
    //[self.loginButton setTitle:@"Login" forState:UIControlStateNormal];

}

- (void)initWithMode:(NSString*)mode
{
    self->mode = [[NSString alloc] initWithString:mode];
}

- (IBAction)loginFButtonTapped:(id)sender
{
    NSLog(@"facebook Login");
    [[iQUserAccountService sharedInstance] presentFacebookLoginWithCompletionHandler:^(bool success) {
        if (success) {
            
            //[self.loginFButton setTitle:@"FaceBook Logout" forState:UIControlStateNormal];
        }
        else
        {
            [NFViewUtils showAlertWithTitle:NSLocalizedString(@"Error Logging In", nil)
                                 andMessage:NSLocalizedString(@"Cannot log in via Facbook at the moment.\n\nPlease try again later.", nil)];
        }
    }];

}

- (IBAction)onBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

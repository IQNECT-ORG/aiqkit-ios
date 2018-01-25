//
//  RegisterViewController.m
//  iQKit-Example
//
//  Created by AIQ on 19/1/18.
//  Copyright © 2018 iQNECT. All rights reserved.
//

#import "RegisterViewController.h"
#import "iQUserRegisterRequest.h"
#import "iQUserAccountService.h"
#import "iQUserLoginRequest.h"
#import "MessageViewController.h"

#define maleConstant NSLocalizedString(@"Male", nil)
#define femaleConstant NSLocalizedString(@"Female",nil)
#define noneConstant NSLocalizedString(@"None",nil)

@interface RegisterViewController ()
@property(nonatomic) BOOL registerd;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->test = 1;
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

- (IBAction)onBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onRegister:(id)sender {
    if ( [self.email.text isEqualToString:@""] || [self.password.text isEqualToString:@""]) {
        return;
    }
    iQUserRegisterRequest *userRegisterRequest = [iQUserRegisterRequest new];
    userRegisterRequest.email = self.email.text;
    userRegisterRequest.password = self.password.text;
    if (![self.gender.text isEqualToString:@""]) {
        
        if([self.gender.text isEqualToString:maleConstant]){
            userRegisterRequest.gender = @"m";
        }else if ([self.gender.text isEqualToString:femaleConstant]){
            userRegisterRequest.gender = @"f";
        }else if ([self.gender.text isEqualToString:noneConstant]){
            userRegisterRequest.gender = @"";
        }
    }
    if(![self.age.text isEqualToString:@""]){
        //Convert the given age into the year
        //Get the current year
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeZone:[NSTimeZone systemTimeZone]];
        [formatter setDateFormat:@"yyyy"];
        NSString *yearString = [formatter stringFromDate:[NSDate date]];
        NSString *ageYear = [NSString stringWithFormat:@"%d",[yearString intValue]-[self.age.text intValue]];
        //Make a fake DOB with year difference.
        userRegisterRequest.birthdayDate = [NSString stringWithFormat:@"01/01/%@",ageYear];
        
    }
    [userRegisterRequest runWithCompletionHandler:^(NSDictionary *userDictionary, NSString *errorMessage) {
        NSLog(@"register returned");
        if (!errorMessage) {
            if(userDictionary){
                
                iQUserLoginRequest *loginRequest = [iQUserLoginRequest new];
                
                loginRequest.email = userRegisterRequest.email;
                loginRequest.password = userRegisterRequest.password;
                
                [loginRequest runWithCompletionHandler:^(NSDictionary *userDictionary, NSString *errorMessage) {
                    if (!errorMessage) {
                        NSLog(@"register and logined");
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        MessageViewController* mvc = [storyboard instantiateViewControllerWithIdentifier:@"MessageViewController"];
                        [mvc message:@"User Regsitered Successfully"];
                        [self presentViewController:mvc animated:YES completion:nil];
                    }else{
                        
                        //[IQProgressHUD hideProgressHUD];
                        
                    }
                    
                }];
                
            }
            
            
        }else{
            
            //[IQProgressHUD hideProgressHUD];
            
        }
        
    }];
}
@end

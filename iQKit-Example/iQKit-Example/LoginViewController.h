//
//  LoginViewController.h
//  iQKit-Example
//
//  Created by AIQ on 18/1/18.
//  Copyright © 2018 iQNECT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *pageTitle;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *signButton;
- (IBAction)onSign:(id)sender;
- (IBAction)loginFButtonTapped:(id)sender;
- (IBAction)onBack:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginFButton;

- (void)initWithMode:(NSString*)mode;
@end

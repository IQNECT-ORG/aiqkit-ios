//
//  RegisterViewController.h
//  AIQKit-Example
//
//  Created by AIQ on 19/1/18.
//  Copyright © 2018 AIQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
{
    int cc;
    @private
    int test;
    @public
    int pub;
}
- (IBAction)onBack:(id)sender;
- (IBAction)onRegister:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@end

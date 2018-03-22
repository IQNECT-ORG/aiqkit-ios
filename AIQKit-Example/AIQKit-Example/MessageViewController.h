//
//  MessageViewController.h
//  AIQKit-Example
//
//  Created by AIQ on 24/1/18.
//  Copyright © 2018 AIQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *messageTF;
@property (strong, nonatomic) NSString *message;
- (IBAction)onBack:(id)sender;
- (void)message:(NSString*)msg;

@end

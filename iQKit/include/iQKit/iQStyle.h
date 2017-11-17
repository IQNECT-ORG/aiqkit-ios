//
//  iQStyle.h
//  iQKit
//
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, iQKitLabelStyle) {
    iQKitLabelStyleHeader = 1 <<  0,
    iQKitLabelStyleContent = 1 <<  1,
};

typedef NS_OPTIONS(NSUInteger, iQKitButtonStyle) {
    iQKitButtonStyleBordered = 1 <<  0,
    iQKitButtonStyleWithoutBorder = 1 <<  1,
};

@interface iQStyle : NSObject

+ (instancetype)sharedInstance;
- (void)setupAppearance;

+ (UIColor *)redColor;
+ (UIColor *)tintColor;
+ (UIColor *)grayColor;
+ (UIColor *)lightGrayColor;
+ (UIColor *)extraLightGrayColor;
+ (UIColor *)themeColor;
+ (UIColor *)backgroundColor;
+ (UIColor *)pinkColor;
+ (UIColor *)darkGrayColor;
+ (UIColor *)cyanColor;
+ (UIColor *)FBBlueColor;
+ (UIColor *)lightPinkColor;
+ (UIColor *)darkGraysihBlueColor;
+ (UIColor *)grayishBlackColor;

+ (UIColor *)textColor;

+ (UIFont *)fontRegularWithSize:(CGFloat)size;
+ (UIFont *)fontItalicWithSize:(CGFloat)size;
+ (UIFont *)fontBoldWithSize:(CGFloat)size;
+ (UIFont *)fontHeavyWithSize:(CGFloat)size;
+ (UILabel *)labelWithFrame:(CGRect)frame;
+ (UILabel *)labelWithText:(NSString *)text andFont:(UIFont *)font andFrame:(CGRect)frame andColor:(UIColor *)color;
+ (UIButton *)roundedRectButtonWithTitle:(NSString *)title;
+ (UIButton *)buttonWithImageNamed:(NSString *)imageName;

+ (UIImage *)cellPlaceholderImage;

+(UILabel *)labelForNewStyle:(NSString *)text andFrame:(CGRect)frame andLabelStyle:(iQKitLabelStyle)labelStyle;
+(UIButton *)roundedRectButtonForNewStyleWithTitle:(NSString *)title andBGColor:(UIColor *)button andFrame:(CGRect)frame andButtonStyle:(iQKitButtonStyle)buttonStyle andTextColor:(UIColor *)textColor andTextFont:(UIFont *)textFont;

@end

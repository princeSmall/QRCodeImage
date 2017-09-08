//
//  ColorfulQRCodeView.h
//  QRCode
//
//  Created by tongle on 2017/9/8.
//  Copyright © 2017年 tong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorfulQRCodeView : UIView
- (void)syncFrame;
- (void)setQRCodeImage:(UIImage *)qrcodeImage;

@end

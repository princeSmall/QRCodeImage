//
//  ColorfulQRCodeView.h
//  QRCode
//
//  Created by iOS on 2017/9/8.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorfulQRCodeView : UIView
- (void)syncFrame;
- (void)setQRCodeImage:(UIImage *)qrcodeImage;

@end

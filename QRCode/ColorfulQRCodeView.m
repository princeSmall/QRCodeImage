//
//  ColorfulQRCodeView.m
//  QRCode
//
//  Created by tongle on 2017/9/8.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ColorfulQRCodeView.h"
@interface ColorfulQRCodeView()

@property (strong, nonatomic) CALayer *maskLayer;
@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@end
@implementation ColorfulQRCodeView


- (CALayer *)maskLayer {
    if (_maskLayer == nil) {
        _maskLayer = [CALayer new];
        [self.layer addSublayer:_maskLayer];
    }
    return _maskLayer;
}

- (CAGradientLayer *)gradientLayer {
    if (_gradientLayer == nil) {
        _gradientLayer = [CAGradientLayer new];
        
        _gradientLayer.colors = @[
                                  (__bridge id)[UIColor colorWithRed: 0x2a / 255.0 green:0x9c / 255.0 blue: 0x1f / 255.0 alpha:1.0].CGColor,
                                  (__bridge id)[UIColor colorWithRed: 0xe6 / 255.0 green:0xcd / 255.0 blue: 0x27 / 255.0 alpha:1.0].CGColor,
                                  (__bridge id)[UIColor colorWithRed: 0xe6 / 255.0 green:0x27 / 255.0 blue: 0x57 / 255.0 alpha:1.0].CGColor
                                  ];
        [self.layer addSublayer: _gradientLayer];
        _gradientLayer.frame = self.bounds;
    }
    return _gradientLayer;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = UIColor.whiteColor;
}

- (void)syncFrame {
    self.maskLayer.frame = self.bounds;
    self.gradientLayer.frame = self.bounds;
}

// 设置黑白二维码图片
- (void)setQRCodeImage:(UIImage *)qrcodeImage {
    UIImage *maskImage = [self genQRCodeImageMask: qrcodeImage];
    self.maskLayer.contents = (__bridge id)maskImage.CGImage;
    self.maskLayer.frame = self.bounds;
    self.gradientLayer.mask = self.maskLayer;
}

- (UIImage *)genQRCodeImageMask:(UIImage *)image {
    if (image != nil) {
        int bitsPerComponent = 8;
        int bytesPerPixel = 4;
        int width = image.size.width;
        int height = image.size.height;
        unsigned char * imageData = (unsigned char *)malloc(width * height * bytesPerPixel);
        
        // 将原始黑白二维码图片绘制到像素格式为ARGB的图片上，绘制后的像素数据在imageData中。
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef imageContext = CGBitmapContextCreate(imageData, width, height, bitsPerComponent, bytesPerPixel * width, colorSpace, kCGImageAlphaPremultipliedFirst);
        UIGraphicsPushContext(imageContext);
        CGContextTranslateCTM(imageContext, 0, height);
        CGContextScaleCTM(imageContext, 1, -1);
        [image drawInRect:CGRectMake(0, 0, width, height)];
        
        CGColorSpaceRelease(colorSpace);
        
        // 根据每个像素R通道的值修改Alpha通道的值，当Red大于100，则将Alpha置为0，反之置为255
        for (int row = 0; row < height; ++row) {
            for (int col = 0; col < width; ++col) {
                int offset = row * width * bytesPerPixel + col * bytesPerPixel;
                unsigned char r = imageData[offset + 1];
                unsigned char alpha = r > 100 ? 0 : 255;
                imageData[offset] = alpha;
            }
        }
        
        CGImageRef cgMaskImage = CGBitmapContextCreateImage(imageContext);
        UIImage *maskImage = [UIImage imageWithCGImage:cgMaskImage];
        CFRelease(cgMaskImage);
        UIGraphicsPopContext();
        CFRelease(imageContext);
        
        free(imageData);
        return maskImage;
    }
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

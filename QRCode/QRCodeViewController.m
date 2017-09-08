//
//  QRCodeViewController.m
//  QRCode
//
//  Created by tongle on 2017/9/8.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "QRCodeViewController.h"
#import "ColorfulQRCodeView.h"
#import "QRCodeImage.h"

@interface QRCodeViewController ()
@property (nonatomic,strong)UIImageView * QRImageView;
@property (nonatomic,strong)UIImageView * BARImageView;
@property (nonatomic,strong)ColorfulQRCodeView * ColorImageView;

@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.type == 0) {
        self.QRImageView.image = [QRCodeImage qrCodeImageWithContent:@"http://princesmall.cn" codeImageSize:200];
         [self.view addSubview:self.QRImageView];
    }else if (self.type == 1){
        self.BARImageView.image = [QRCodeImage barcodeImageWithContent:@"66666666" codeImageSize:CGSizeMake(200, 90)];
        [self.view addSubview:self.BARImageView];
    }else if (self.type == 2){
        self.QRImageView.image = [QRCodeImage qrCodeImageWithContent:@"http://princesmall.cn" codeImageSize:200 logo:[UIImage imageNamed:@"IMG_2593.jpg"] logoFrame:CGRectMake(75, 75, 50, 50) red:1.0 green:0 blue:0];
        [self.view addSubview:self.QRImageView];
    }else if (self.type == 3){
        self.BARImageView.image = [QRCodeImage barcodeImageWithContent:@"6666666" codeImageSize:CGSizeMake(200, 90) red:1.0 green:0 blue:0];
        [self.view addSubview:self.BARImageView];
    }else if (self.type == 4){
        UIImage * image = [QRCodeImage qrCodeImageWithContent:@"http://princesmall.cn" codeImageSize:200];
        [self.ColorImageView  syncFrame];
        [self.ColorImageView setQRCodeImage:image];
        [self.view addSubview:self.ColorImageView];
    }
    // Do any additional setup after loading the view.
}

-(UIImageView *)QRImageView{
    if (_QRImageView == nil) {
        float QRWidth = self.view.frame.size.width / 2;
        float QRHeight = self.view.frame.size.height / 2;
        _QRImageView = [[UIImageView alloc]initWithFrame:CGRectMake(QRWidth - 100, QRHeight - 100, 200, 200)];
    }
    return _QRImageView;
}
-(UIImageView *)BARImageView{
    if (_BARImageView == nil) {
        float BARWidth = self.view.frame.size.width / 2;
        float BARHeight = self.view.frame.size.height / 2;
        _BARImageView = [[UIImageView alloc]initWithFrame:CGRectMake(BARWidth - 100, BARHeight - 45, 200, 90)];
    }
    return _BARImageView;
}
-(ColorfulQRCodeView *)ColorImageView{
    if (_ColorImageView == nil) {
        float ColorWidth = self.view.frame.size.width / 2;
        float ColorHeight = self.view.frame.size.height / 2;
        _ColorImageView = [[ColorfulQRCodeView alloc]initWithFrame:CGRectMake(ColorWidth - 100, ColorHeight - 100, 200, 200)];
        
    }
    return _ColorImageView;
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

@end

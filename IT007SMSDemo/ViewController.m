//
//  ViewController.m
//  IT007SMSDemo
//
//  Created by Mac on 16/6/22.
//  Copyright © 2016年 byp. All rights reserved.
//

#import "ViewController.h"
#import <SMS_SDK/SMSSDK.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;

@property (weak, nonatomic) IBOutlet UITextField *codeTF;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *array=[NSMutableArray arrayWithObjects:@"111",@"222",@"333",@"444",@"555", nil];
    for (NSString *str in array){
        [array removeObject:str];
        break;
    }

//    for (NSInteger i = 0; i <array.count; i++) {
//        NSString *str = array[i];
//        [array removeObject:str];
//    }
    
    
    
    
    
}

- (IBAction)sendClick:(id)sender {
    
    if ([self.phoneTF.text isEqualToString:@""]) {
        return;
    }
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneTF.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            NSLog(@"获取验证码成功");
        }else{
            NSLog(@"错误信息：%@",error);
        }
    }];
    
}

- (IBAction)yanzhengClick:(id)sender {
    
    if (![self.codeTF.text isEqualToString:@""]) {
        return;
    }
    
    [SMSSDK commitVerificationCode:self.codeTF.text phoneNumber:self.phoneTF.text zone:@"86" result:^(NSError *error) {
        
        if (!error) {
            NSLog(@"验证成功");
        }
        else
        {
            NSLog(@"错误信息:%@",error);
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

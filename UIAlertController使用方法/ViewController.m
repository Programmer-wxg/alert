//
//  ViewController.m
//  UIAlertController使用方法
//
//  Created by xhkj on 2018/8/3.
//  Copyright © 2018年 WXG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 100);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"测试" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(100, 300, 200, 100);
    button2.backgroundColor = [UIColor blueColor];
    [button2 setTitle:@"测试2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonClick2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
//    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
//    button3.frame = CGRectMake(100, 500, 200, 50);
//    button3.backgroundColor = [UIColor blueColor];
//    [button3 setTitle:@"测试3" forState:UIControlStateNormal];
//    [button3 addTarget:self action:@selector(buttonClick3:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button3];
}

- (void)buttonClick3:(UIButton *)button{
    
    //[self createPopoverPresentationController_popover:button];
}

- (void)buttonClick2{
    
    [self createAlertController_alert];
}

- (void)buttonClick{
    
    [self createAlertController_sheet];
}

- (void)createAlertController_sheet{
    
    /*
     先创建UIAlertController，preferredStyle：选择UIAlertControllerStyleActionSheet，这个就是相当于创建8.0版本之前的UIActionSheet；
     
     typedef NS_ENUM(NSInteger, UIAlertControllerStyle) {
     UIAlertControllerStyleActionSheet = 0,
     UIAlertControllerStyleAlert
     } NS_ENUM_AVAILABLE_IOS(8_0);
     
     */
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"测试标题" message:@"测试内容..." preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"block1回调");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"block2回调");
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"block3回调");
    }];
    
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}

- (void)createAlertController_alert{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题2" message:@"没有内容，随便写点东西" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"输入账号";
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"输入密码";
    }];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"block1回调");
        //textFields是一个数组，获取所输入的字符串
        NSLog(@"%@",alert.textFields.lastObject.text);
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"block2回调");
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    [self presentViewController:alert animated:YES completion:nil];
}

/*
 ipad中的方法
*/
- (void)createPopoverPresentationController_popover:(UIButton *)button{
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"测试标题" message:@"测试内容..." preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"block1回调");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"block2回调");
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"block3回调");
    }];
    
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    
    UIPopoverPresentationController *popover = actionSheet.popoverPresentationController;
    if (popover)
    {
        popover.sourceView = button;
        popover.sourceRect = button.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
    
    // 3.显示警报控制器
    [self presentViewController:actionSheet animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

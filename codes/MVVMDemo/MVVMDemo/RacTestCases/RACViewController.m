//
//  RACViewController.m
//  MVVMDemo
//
//  Created by evol on 2018/11/14.
//  Copyright © 2018 evol. All rights reserved.
//

#import "RACViewController.h"
#import "ReactiveObjC.h"
#import "SecondViewController.h"

@interface RACViewController ()
{
    RACSignal * _signal;
}

@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField * field = [[UITextField alloc] initWithFrame:CGRectMake(10, 150, 200, 30)];
    field.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:field];
    [[field rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(CGRectGetMaxX(field.frame) + 20, 150, 59, 30)];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"button click -- ");
        button.selected = !button.selected;
    }];
    
    RACSignal * buttonClickSignal = [[button rac_signalForControlEvents:UIControlEventTouchUpInside] map:^id _Nullable(__kindof UIControl * _Nullable value) {
        UIButton * button = value;
        return @(button.selected);
    }];;
    
    // 测试绑定属性
    RAC(field, backgroundColor) = [buttonClickSignal map:^id _Nullable(id  _Nullable value) {
        NSLog(@" set background color!");
        if ([value boolValue]){
            return [UIColor yellowColor];
        }else{
            return [UIColor redColor];
        }
    }];
    
    _signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"create");
        [subscriber sendNext:@"send next"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"dispose");
        }];
    }];
    
    [_signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"1: %@", x);
    }];
    
    [_signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"2: %@", x);
    }];
    
    UIButton * pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pushButton setFrame:CGRectMake(CGRectGetMaxX(field.frame) + 20, 180, 59, 30)];
    [pushButton setTitle:@"PushButton" forState:UIControlStateNormal];
    [pushButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:pushButton];
    @weakify(self);
    [[pushButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        [self_weak_ testDelegate];
        [self testDelegate];
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"touch begin");
    }];
}


- (void)testDelegate {
    
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

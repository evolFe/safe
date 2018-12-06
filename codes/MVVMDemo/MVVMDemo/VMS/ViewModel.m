//
//  ViewModel.m
//  MVVMDemo
//
//  Created by evol on 2018/11/14.
//  Copyright © 2018 evol. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)_setup {
}

- (void)loadDatas {
    self.datas = @[@"Rac Tests"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.refreshUISignal sendNext:nil];

    });
}

#pragma mark -- Getters --

- (RACCommand *)refreshTableCommand {
    if (!_refreshTableCommand) {
        _refreshTableCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                printf("refresh doing");
                return [RACDisposable disposableWithBlock:^{
                    NSLog(@" dispose");
                }];
            }];
        }];
    }
    return _refreshTableCommand;
}

- (RACSubject *)refreshUISignal {
    if (!_refreshUISignal) {
        _refreshUISignal = [RACSubject subject];
    }
    return _refreshUISignal;
}

@end

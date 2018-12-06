//
//  ViewModel.h
//  MVVMDemo
//
//  Created by evol on 2018/11/14.
//  Copyright © 2018 evol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveObjC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject

@property (nonatomic, copy) NSArray * datas;

@property (nonatomic, strong) RACCommand * refreshTableCommand;

@property (nonatomic, strong) RACSubject * refreshUISignal;

- (void)loadDatas;

@end

NS_ASSUME_NONNULL_END

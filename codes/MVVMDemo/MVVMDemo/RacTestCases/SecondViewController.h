//
//  SecondViewController.h
//  MVVMDemo
//
//  Created by evol on 2018/11/20.
//  Copyright © 2018 evol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveObjC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController

@property (nonatomic, strong) RACSubject * delegate;

@end

NS_ASSUME_NONNULL_END

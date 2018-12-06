//
//  UITableView+ELTool.h
//  MVVMDemo
//
//  Created by evol on 2018/11/14.
//  Copyright © 2018 evol. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ELCellConfigBlock)(UITableViewCell * cell, id model, NSIndexPath * indexPath);
typedef NSString * _Nullable (^ELCellIdentifierBlock)(NSIndexPath * indexPath);

@interface UITableView (ELTool)

- (void)setDatas:(NSArray *)datas;

// 一种类型的Cell
- (void)configCellWithIdentifier:(NSString *)identifier config:(ELCellConfigBlock)config;

// 多种Cell
- (void)configCellWithIdentifierBlock:(ELCellIdentifierBlock)identifierBlock config:(ELCellConfigBlock)config;

@end

NS_ASSUME_NONNULL_END

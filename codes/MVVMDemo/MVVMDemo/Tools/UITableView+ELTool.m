//
//  UITableView+ELTool.m
//  MVVMDemo
//
//  Created by evol on 2018/11/14.
//  Copyright © 2018 evol. All rights reserved.
//

#import "UITableView+ELTool.h"
#import "NSObject+ELTool.h"

@interface _ELTableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, copy) NSArray * datas;

@property (nonatomic, copy) NSString * identifier;

@property (nonatomic, copy) ELCellIdentifierBlock identifierBlock;

@property (nonatomic, copy) ELCellConfigBlock configBlock;

@end

@implementation _ELTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * identifier = self.identifier ? self.identifier : self.identifierBlock(indexPath);
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    self.configBlock(cell, self.datas[indexPath.row], indexPath);
    return cell;
}


@end

@implementation UITableView (ELTool)


- (void)configCellWithIdentifier:(NSString *)identifier config:(ELCellConfigBlock)config {
    NSParameterAssert(config!=nil && identifier.length > 0);
    _ELTableViewDataSource * dele = [self _el_dataSource];
    self.dataSource = dele;
    dele.identifier = identifier;
    dele.configBlock = config;
}

- (void)configCellWithIdentifierBlock:(ELCellIdentifierBlock)identifierBlock config:(ELCellConfigBlock)config {
    NSParameterAssert(config && identifierBlock);

    _ELTableViewDataSource * dele = [self _el_dataSource];
    self.dataSource = dele;
    dele.identifierBlock = identifierBlock;
    dele.configBlock = config;
}

- (void)setDatas:(NSArray *)datas {
    [self _el_dataSource].datas = datas;
}

- (_ELTableViewDataSource *)_el_dataSource {
    _ELTableViewDataSource * dele = [self getAssociatedObjectWithKey:"d"];
    if (!dele) {
        dele = [[_ELTableViewDataSource alloc] init];
        [self setAssociatedObject:dele withKey:"d"];
    }
    return dele;
}

@end

//
//  ViewController.m
//  MVVMDemo
//
//  Created by evol on 2018/11/14.
//  Copyright © 2018 evol. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveObjC.h"
#import "RacTestCases/RACViewController.h"
#import "Tools/UITableView+ELTool.h"
#import "RacTestCases/RACViewController.h"

@interface ViewController ()<UITableViewDelegate>

@property (nonatomic, strong) ViewModel * vm;

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _vm = [[ViewModel alloc] init];
    
    @weakify(self);
    [_vm.refreshUISignal subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.tableView setDatas:self.vm.datas];
        [self.tableView reloadData];
    }];
    
    [self.view addSubview:self.tableView];
    [_vm loadDatas];
}

#pragma mark -- Getters --

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"Cell"];
        _tableView.delegate = self;
        [_tableView configCellWithIdentifier:@"Cell"
                                      config:^(UITableViewCell * _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            NSString * string = model;
            cell.textLabel.text = string;
        }];
    }
    return _tableView;
}

#pragma mark -- UITableDelegate --

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[RACViewController new] animated:YES];
}

@end

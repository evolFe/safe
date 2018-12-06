//
//  NSObject+ELTool.m
//  MVVMDemo
//
//  Created by evol on 2018/11/14.
//  Copyright © 2018 evol. All rights reserved.
//

#import "NSObject+ELTool.h"
#import <objc/runtime.h>

@implementation NSObject (ELTool)

- (void)setAssociatedObject:(id _Nonnull)object withKey:(void *)key{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)getAssociatedObjectWithKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

@end

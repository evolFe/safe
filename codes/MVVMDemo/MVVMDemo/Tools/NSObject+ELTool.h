//
//  NSObject+ELTool.h
//  MVVMDemo
//
//  Created by evol on 2018/11/14.
//  Copyright © 2018 evol. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ELTool)

/** runtime 绑定属性 */
- (void)setAssociatedObject:(id _Nonnull)object withKey:(void *)key;

- (id)getAssociatedObjectWithKey:(void *)key;

@end

NS_ASSUME_NONNULL_END

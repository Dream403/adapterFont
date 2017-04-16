//
//  UIFont+ZL_Adapter.m
//  FontDemo
//
//  Created by Snow_lu on 2017/4/16.
//  Copyright © 2017年 Shrimps_ZL. All rights reserved.
//
#import "UIFont+ZL_Adapter.h"
#import <objc/runtime.h>
@implementation UIFont (ZL_Adapter)

+(void)load{
    
    //获取系统的方法
    Method originalMethod = class_getClassMethod([self class], @selector(systemFontOfSize:));
    
    Method newMethod  = class_getClassMethod([self class], @selector(zl_systemFontOfSize:));
    
    method_exchangeImplementations(newMethod, originalMethod);
    
}

+(UIFont *)zl_systemFontOfSize:(CGFloat)fontSize{
    
    return  [UIFont zl_systemFontOfSize:fontSize*[UIScreen mainScreen].bounds.size.width /375 ];
    
    
}
@end

//
//  PasswordValidator.h
//  UnitTestLearn
//
//  Created by 杨志远 on 2017/12/3.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYInputValidator.h"


/**
 密码的验证类型
 
 - ZYInputPasswordValidatorTypeDefault:
 1、密码必须由数字、字符、特殊字符三种中的两种组成；
 2、密码长度不能少于8个字符；
 - ZYInputPasswordValidatorTypeIntensityLow:
 弱:由纯数字 或者 纯字母 或者 纯特殊符号组成
 - ZYInputPasswordValidatorTypeIntensityMid:
 中:由字母+数字 或者 字母+特殊字符 或者 数字+特殊字符 组成
 - ZYInputPasswordValidatorTypeIntensityHigh:
 强:由字母+数字+特殊字符组成
 - ZYInputPasswordValidatorType1:
 至少一个 大写字母 一个小写字母 一个数字 其他为任意字符 8-20位
 - ZYInputPasswordValidatorType2:
 字母开头 任意数字 字母 下划线 8-20位  (注:同时不能使用双下划线 例如__)
 - ZYInputPasswordValidatorType3:
 数字 字母组合 8-20位
 */
typedef NS_ENUM(NSUInteger, ZYInputPasswordValidatorType) {
    ZYInputPasswordValidatorTypeDefault,
    ZYInputPasswordValidatorTypeIntensityLow,
    ZYInputPasswordValidatorTypeIntensityMid,
    ZYInputPasswordValidatorTypeIntensityHigh,
    ZYInputPasswordValidatorType1,
    ZYInputPasswordValidatorType2,
    ZYInputPasswordValidatorType3
};



@interface ZYInputPasswordValidator : ZYInputValidator

-(instancetype)initWithPasswordType:(ZYInputPasswordValidatorType)type;

@end


//
//  UITextField+Validator.h
//  UnitTestLearn
//
//  Created by 杨志远 on 2017/12/3.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZYInputValidator.h"

#import "ZYInputPasswordValidator.h"
#import "ZYInputDateValidator.h"

NS_ASSUME_NONNULL_BEGIN
@interface UITextField (ZYValidator)
/**
 使用验证的类型初始化textField
 
 @param type 验证类型
 @return self
 */
-(instancetype)initWithValidatorType:(ZYInputValidatorType)type;
/**
 使用密码的验证类型初始化textField
 
 @param type 密码的验证类型 比如:PasswordValidatorType3代表 数字 字母 组合 8-20位
 @return self
 */
-(instancetype)initWithPasswordType:(ZYInputPasswordValidatorType)type;

/**
 使用日期的验证类型初始化textField
 
 @param type 日期的类型
 @return self
 */
-(instancetype)initWithDateType:(ZYInputDateValidatorType)type;
/**
 验证输入的内容是否通过
 使用用例:
 NSError *error;
 BOOL result = [textField validate:&error];
 if (error) {
 NSLog(@"%@",[error localizedDescription]);
 }
 @param error error信息
 @return 验证是否通过
 */
-(BOOL)validate:(NSError* _Nullable * _Nullable)error;
/**
 以某种规则验证输入的内容是否通过 进而返回详细的error信息 比如:验证输入是否全为数字 是否包含大写字母等  不包含则返回详细的error信息:不包含大写字母
 
 @param options 验证规则  提供InputValidatorOptions
 @param error error信息
 @return 验证是否通过
 */
-(BOOL)validate:(ZYInputValidatorOptions)options error:(NSError* _Nullable * _Nullable)error;


@end
NS_ASSUME_NONNULL_END


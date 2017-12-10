//
//  InputValidator.h
//  
//
//  Created by 杨志远 on 16/9/26.
//  Copyright © 2016年 杨志远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
extern NSString * const ZYInputValidatorErrorDomain;



/**
 输入的类型
 
 - InputValidatorTypeEmail: 邮箱
 - InputValidatorTypePhone: 手机号
 - InputValidatorTypeUserName: 用户名（数字/字母/汉字)(3-20位)
 - InputValidatorTypePassword: 密码:密码必须由数字、字符、特殊字符三种中的两种组成,密码长度不能少于8个字符.
 - InputValidatorTypeIDCard: 身份证号码
 - InputValidatorTypeCarNumber: 车牌号码
 - InputValidatorTypeDate: 时间
 - InputValidatorTypePostCode: 邮编
 - InputValidatorTypeURL: URL地址
 */
typedef NS_ENUM(NSUInteger, ZYInputValidatorType) {
    ZYInputValidatorTypeEmail,
    ZYInputValidatorTypePhone,
    ZYInputValidatorTypeUserName,
    ZYInputValidatorTypePassword,
    ZYInputValidatorTypeIDCard,
    ZYInputValidatorTypeCarNumber,
    ZYInputValidatorTypeDate,
    ZYInputValidatorTypePostCode,
    ZYInputValidatorTypeURL
};

typedef NS_ENUM(NSUInteger, ZYInputValidatorError) {
    ZYInputValidatorErrorEmail,
    ZYInputValidatorErrorPhone,
    ZYInputValidatorErrorUserName,
    ZYInputValidatorErrorPassword,
    ZYInputValidatorErrorIDCard,
    ZYInputValidatorErrorCarNumber,
    ZYInputValidatorErrorDate,
    ZYInputValidatorErrorPostCode,
    ZYInputValidatorErrorURL,
    ZYInputValidatorErrorOptions
};


typedef NS_ENUM(NSUInteger, ZYInputValidatorOptions) {
    ZYInputValidatorOptionsIntensityLow = 1,
    ZYInputValidatorOptionsIntensityMid,
    ZYInputValidatorOptionsIntensityHigh,
    
    ZYInputValidatorOptionsNotAllNumbers,
    ZYInputValidatorOptionsNotAllLetters,
    ZYInputValidatorOptionsNotAllSymbols,
    ZYInputValidatorOptionsNotAllChinese,
    
    ZYInputValidatorOptionsAllNumbers,
    ZYInputValidatorOptionsAllLetters,
    ZYInputValidatorOptionsAllSymbols,
    ZYInputValidatorOptionsAllChinese,
    
    
    ZYInputValidatorOptionsUppercaseAtLeast,
    ZYInputValidatorOptionsLowercaseAtLeast,
    ZYInputValidatorOptionsNumberAtLeast,
    
};

#define ZYRX(rex,input) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@",rex] evaluateWithObject:input];

@interface ZYInputValidator : NSObject

+(instancetype)validateWithType:(ZYInputValidatorType)type;
- (BOOL)validateInput:(UITextField *)input error:(NSError* _Nullable * _Nullable)error;
-(BOOL)validateInput:(UITextField *)input options:(ZYInputValidatorOptions)options error:(NSError* _Nullable * _Nullable)error;
@end
NS_ASSUME_NONNULL_END


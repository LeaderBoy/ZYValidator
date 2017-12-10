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
 
 - ZYInputValidatorTypeEmail: 邮箱
 - ZYInputValidatorTypePhone: 手机号
 - ZYInputValidatorTypeUserName: 用户名（数字/字母/汉字)(3-20位)
 - ZYInputValidatorTypePassword: 密码:密码必须由数字、字符、特殊字符三种中的两种组成,密码长度不能少于8个字符.
 - ZYInputValidatorTypeIDCard: 身份证号码
 - ZYInputValidatorTypeCarNumber: 车牌号码
 - ZYInputValidatorTypeDate: 时间
 - ZYInputValidatorTypePostCode: 邮编
 - ZYInputValidatorTypeURL: URL地址
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


/**
 详细的验证

 - ZYInputValidatorOptionsIntensityLow: 密码强度低 返回error -1
 - ZYInputValidatorOptionsIntensityMid: 密码强度中 返回error 0
 - ZYInputValidatorOptionsIntensityHigh: 密码强度高 返回error 1
 - ZYInputValidatorOptionsNotAllNumbers: 不能全是数字
 - ZYInputValidatorOptionsNotAllLetters: 不能全是字母
 - ZYInputValidatorOptionsNotAllSymbols: 不能全是特殊字符
 - ZYInputValidatorOptionsNotAllChinese: 不能全是中文
 - ZYInputValidatorOptionsAllNumbers: 必须全是数字
 - ZYInputValidatorOptionsAllLetters: 必须全是字母
 - ZYInputValidatorOptionsAllSymbols: 必须全是特殊字符
 - ZYInputValidatorOptionsAllChinese: 必须全是中文
 - ZYInputValidatorOptionsUppercaseAtLeast: 至少一个大写字母
 - ZYInputValidatorOptionsLowercaseAtLeast: 至少一个小写字母
 - ZYInputValidatorOptionsNumberAtLeast: 至少一个数字
 */
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


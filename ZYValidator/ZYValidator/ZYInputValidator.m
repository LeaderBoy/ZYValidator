//
//  InputValidator.m
//  策略2
//
//  Created by 杨志远 on 16/9/26.
//  Copyright © 2016年 杨志远. All rights reserved.
//

#import "ZYInputValidator.h"

#import "ZYInputEmailValidator.h"
#import "ZYInputPhoneNumberValidator.h"
#import "ZYInputUserNameValidator.h"
#import "ZYInputIDCardValidator.h"
#import "ZYInputCarNumberValidator.h"
#import "ZYInputPostCodeValidator.h"
#import "ZYInputURLValidator.h"
#import "ZYInputDateValidator.h"
#import "ZYInputPasswordValidator.h"

NSString *const ZYInputValidatorErrorDomain = @"com.ZY.InputValidator";

static NSString *const kValidatorErrorEmpty = @"输入内容为空";
static NSString *const kValidatorErrorFormat = @"输入内容格式错误";

static NSString *const kInputValidatorIntensityLow = @"^(?:\\d+|[a-zA-Z]+|[!@#$%^&*_]+)$";
static NSString *const kInputValidatorIntensityMid = @"^(?![a-zA-z]+$)(?!\\d+$)(?![!@#$%^&*_]+$)[a-zA-Z\\d!@#$%^&*_]+$";
static NSString *const kInputValidatorIntensityHigh = @"^(?![a-zA-z]+$)(?!\\d+$)(?![!@#$%^&*]+$)(?![a-zA-z\\d]+$)(?![a-zA-z!@#$%^&*]+$)(?![\\d!@#$%^&*]+$)[a-zA-Z\\d!@#$%^&*]+$";
/**
 至少一个大写字母
 */
static NSString *const kUppercaseAtLeast = @"(?=.*[A-Z].*).+";
/**
 至少一个小写字母
 */
static NSString *const kLowercaseAtLeast = @"(?=.*[a-z].*).+";
/**
 至少一个数字
 */
static NSString *const kNumberAtLeast = @"(?=.*[0-9].*).+";
/**
 任意字符
 */
static NSString *const kAny = @"[^]";
/**
 最少多少位
 */
static NSString *const kMini = @"{1,}";
/**
 不能全是数字
 */
static NSString *const kNotAllNumbers = @"(?!^\\d+$).+";
/**
 不能全是字母
 */
static NSString *const kNotAllLetters = @"(?!^[a-zA-Z]+$).+";
/**
 不能全是特殊符号
 */
static NSString *const kNotAllSymbols = @"(?!^[!@#$%^&*_]+$).+";
/**
 不能全是汉字
 */
static NSString *const kNotAllChinese = @"(?!^[\u4e00-\u9fa5]+$).+";
/**
 字母/数字/特殊符号的组合
 */
static NSString *const kN_L_S = @"[a-zA-Z\\d!@#$%^&*_]+";
/**
 纯数字
 */
static NSString *const kAllNumbers = @"(^\\d+$)";
/**
 纯字母
 */
static NSString *const kAllLetters = @"(^[a-zA-Z]+$)";
/**
 纯特殊符号
 */
static NSString *const kAllSymbols = @"(^[!@#$%^&*_]+$)";
/**
 纯汉字
 */
static NSString *const kAllChinese = @"^[\u4e00-\u9fa5]+$";

@implementation ZYInputValidator

+(instancetype)validateWithType:(ZYInputValidatorType)type {
    switch (type) {
        case ZYInputValidatorTypeEmail:
            return [[ZYInputEmailValidator alloc] init];
            break;
        case ZYInputValidatorTypePhone:
            return [[ZYInputPhoneNumberValidator alloc] init];
            break;
        case ZYInputValidatorTypeUserName:
            return [[ZYInputUserNameValidator alloc] init];
            break;
        case ZYInputValidatorTypePassword:
            return [[ZYInputPasswordValidator alloc] init];
            break;
        case ZYInputValidatorTypeIDCard:
            return [[ZYInputIDCardValidator alloc] init];
            break;
        case ZYInputValidatorTypeCarNumber:
            return [[ZYInputCarNumberValidator alloc] init];
            break;
        case ZYInputValidatorTypeDate:
            return [[ZYInputDateValidator alloc] init];
            break;
        case ZYInputValidatorTypePostCode:
            return [[ZYInputPostCodeValidator alloc]init];
            break;
        case ZYInputValidatorTypeURL:
            return [[ZYInputURLValidator alloc]init];
            break;
    }
}

-(BOOL)validateInput:(UITextField *)input error:(NSError *__autoreleasing  _Nullable *)error {
    NSAssert(NO, @"需要子类实现validateInput:(UITextField *)input");
    return NO;
}

-(BOOL)validateInput:(UITextField *)input options:(ZYInputValidatorOptions)options error:(NSError *__autoreleasing  _Nullable *)error {
    if (input.text.length <= 0) {
        *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorOptions userInfo:@{NSLocalizedDescriptionKey : kValidatorErrorEmpty}];
        return NO;
    } else {
        
        NSAssert(options, @"InputValidatorOptions不存在");
        NSString *rx = nil;
        NSString *localizedDescription = kValidatorErrorFormat;
        
        rx = [self handleValidatorOptions:options];
        localizedDescription = [self transformOptionsToLocalizedDescription:options];
        BOOL isMatch = ZYRX(rx,input.text);
        
        if (isMatch == NO) {
            *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorPassword userInfo:@{NSLocalizedDescriptionKey : localizedDescription}];
            return NO;
        }
        return YES;
    }
}

-(NSString *)handleValidatorOptions:(ZYInputValidatorOptions)options {
    
    NSMutableString *rx = [NSMutableString stringWithString:@"^$"];
    
    switch (options) {
        case ZYInputValidatorOptionsIntensityLow:
            [rx insertString:kInputValidatorIntensityLow atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsIntensityMid:
            [rx insertString:kInputValidatorIntensityMid atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsIntensityHigh:
            [rx insertString:kInputValidatorIntensityHigh atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsNotAllNumbers:
            [rx insertString:kNotAllNumbers atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsNotAllLetters:
            [rx insertString:kNotAllLetters atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsNotAllSymbols:
            [rx insertString:kNotAllSymbols atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsNotAllChinese:
            [rx insertString:kNotAllChinese atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsAllNumbers:
            [rx insertString:kAllNumbers atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsAllLetters:
            [rx insertString:kAllLetters atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsAllSymbols:
            [rx insertString:kAllSymbols atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsAllChinese:
            [rx insertString:kAllChinese atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsUppercaseAtLeast:
            [rx insertString:kUppercaseAtLeast atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsLowercaseAtLeast:
            [rx insertString:kLowercaseAtLeast atIndex:rx.length-1];
            break;
        case ZYInputValidatorOptionsNumberAtLeast:
            [rx insertString:kNumberAtLeast atIndex:rx.length-1];
            break;
    }
    
    return [rx copy];
}

-(NSString *)transformOptionsToLocalizedDescription:(ZYInputValidatorOptions)options {
    
    switch (options) {
        case ZYInputValidatorOptionsIntensityLow:
            return @"-1";
            break;
        case ZYInputValidatorOptionsIntensityMid:
            return @"0";
            break;
        case ZYInputValidatorOptionsIntensityHigh:
            return @"1";
            break;
        case ZYInputValidatorOptionsNotAllNumbers:
            return @"不能全为数字";
            break;
        case ZYInputValidatorOptionsNotAllLetters:
            return @"不能全为字母";
            break;
        case ZYInputValidatorOptionsNotAllSymbols:
            return @"不能全为符号";
            break;
        case ZYInputValidatorOptionsAllNumbers:
            return @"必须全为数字";
            break;
        case ZYInputValidatorOptionsAllLetters:
            return @"必须全为字母";
            break;
        case ZYInputValidatorOptionsAllSymbols:
            return @"必须全为符号";
            break;
        case ZYInputValidatorOptionsNumberAtLeast:
            return @"至少一个数字";
            break;
        case ZYInputValidatorOptionsLowercaseAtLeast:
            return @"至少一个小写字母";
            break;
        case ZYInputValidatorOptionsUppercaseAtLeast:
            return @"至少一个大写字母";
            break;
        case ZYInputValidatorOptionsNotAllChinese:
            return @"不能全为汉字";
            break;
        case ZYInputValidatorOptionsAllChinese:
            return @"必须全为汉字";
            break;
    }
}




@end


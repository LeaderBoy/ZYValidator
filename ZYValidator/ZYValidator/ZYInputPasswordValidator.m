//
//  PasswordValidator.m
//  UnitTestLearn
//
//  Created by 杨志远 on 2017/12/3.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYInputPasswordValidator.h"
// 提示信息
static NSString *const kPasswordValidatorErrorEmpty = @"密码为空";
static NSString *const kPasswordValidatorErrorFormat = @"密码格式不正确";

// 正则
static NSString *const kPasswordValidatorTypeDefault = @"(?!^\\d+$)(?!^[a-zA-Z]+$)(?!^[!@#$%^&*_]+$).{8,}";

static NSString *const kPasswordValidatorTypeIntensityLow = @"^(?:\\d+|[a-zA-Z]+|[!@#$%^&*_]+)$";
static NSString *const kPasswordValidatorTypeIntensityMid = @"^(?![a-zA-z]+$)(?!\\d+$)(?![!@#$%^&*_]+$)[a-zA-Z\\d!@#$%^&*_]+$";
static NSString *const kPasswordValidatorTypeIntensityHigh = @"^(?![a-zA-z]+$)(?!\\d+$)(?![!@#$%^&*]+$)(?![a-zA-z\\d]+$)(?![a-zA-z!@#$%^&*]+$)(?![\\d!@#$%^&*]+$)[a-zA-Z\\d!@#$%^&*]+$";

static NSString *const kPasswordValidatorType1 = @"^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*).{8,20}$";
static NSString *const kPasswordValidatorType2 = @"^[a-zA-Z]\\w{8,20}";
static NSString *const kPasswordValidatorType3 = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$";


@interface ZYInputPasswordValidator()
@property(nonatomic,assign)ZYInputValidatorOptions validatorOptions;
@property(nonatomic,assign)PasswordValidatorType validatorType;
@end
@implementation ZYInputPasswordValidator

//http://www.css88.com/archives/8100

-(instancetype)initWithPasswordType:(PasswordValidatorType)type {
    self = [super init];
    if (self) {
        self.validatorType = type;
    }
    return self;
}



//大概介绍一下：
//密码字符包括：小写字母、大写字母、数字、符号等；
//这个正则会得到五个捕获组，前四个捕获组会告诉我们这个字符串包含有多少种组合（返回多少个匹配代表多少种组合）
//如果这个字符串小于6位的话,则会得到第五个捕获组,长度为1（即强度为1），如果没有输入，就连捕获组5都不会得到（强度为0）
// "^(?:([a-z])|([A-Z])|([0-9])|(.)){6,}|(.)+$"


-(BOOL)validateInput:(UITextField *)input error:(NSError *__autoreleasing*)error {
    if (input.text.length <= 0) {
        *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorPassword userInfo:@{NSLocalizedDescriptionKey : kPasswordValidatorErrorEmpty}];
        return NO;
    } else {
        NSString *rx = nil;
        NSString *localizedDescription = kPasswordValidatorErrorFormat;
        if(self.validatorType){
            rx = [self handleValidatorType:self.validatorType];
        }else{
            rx = kPasswordValidatorTypeDefault;
        }
        
        BOOL isMatch = ZYRX(rx,input.text);
        
        if (isMatch == NO) {
            *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorPassword userInfo:@{NSLocalizedDescriptionKey : localizedDescription}];
            return NO;
        }
        return YES;
    }
}

-(NSString *)handleValidatorType:(PasswordValidatorType)type {
    switch (type) {
        case PasswordValidatorTypeDefault:
            return kPasswordValidatorTypeDefault;
            break;
        case PasswordValidatorTypeIntensityLow:
            return kPasswordValidatorTypeIntensityLow;
            break;
        case PasswordValidatorTypeIntensityMid:
            return kPasswordValidatorTypeIntensityMid;
            break;
        case PasswordValidatorTypeIntensityHigh:
            return kPasswordValidatorTypeIntensityHigh;
            break;
        case PasswordValidatorType1:
            return kPasswordValidatorType1;
            break;
        case PasswordValidatorType2:
            return kPasswordValidatorType2;
            break;
        case PasswordValidatorType3:
            return kPasswordValidatorType3;
            break;
    }
}



@end


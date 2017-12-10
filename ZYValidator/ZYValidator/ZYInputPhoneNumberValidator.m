//
//  PhoneNumberValidator.m
//  
//
//  Created by 杨志远 on 16/9/26.
//  Copyright © 2016年 杨志远. All rights reserved.
//

#import "ZYInputPhoneNumberValidator.h"

// 提示信息
static NSString *const kPhoneNumberValidatorErrorEmpty = @"手机号为空";
static NSString *const kPhoneNumberValidatorErrorFormat = @"手机号格式不正确";
// 正则表达式
static NSString *const kPhoneNumberValidatorDefault = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";

@implementation ZYInputPhoneNumberValidator


-(BOOL)validateInput:(UITextField *)input error:(NSError **)error {
    
    if (input.text.length <= 0) {
        *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorPhone userInfo:@{NSLocalizedDescriptionKey : kPhoneNumberValidatorErrorEmpty}];
        return NO;
    } else {
        //^(\\d{3,4}-)\\d{7,8}$
        BOOL isMatch = ZYRX(kPhoneNumberValidatorDefault,input.text)
        
        if (isMatch == NO) {
            *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorPhone userInfo:@{NSLocalizedDescriptionKey : kPhoneNumberValidatorErrorFormat}];
            return NO;
        }
        return YES;
    }
}
@end


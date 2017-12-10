//
//  IDCardValidator.m
//  UnitTestLearn
//
//  Created by 杨志远 on 2017/12/4.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYInputIDCardValidator.h"
// 提示信息
static NSString *const kIDCardValidatorErrorEmpty = @"身份证号为空";
static NSString *const kIDCardValidatorErrorFormat = @"身份证格式不正确";
// 正则表达式
static NSString *const kIDCardValidatorDefault = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
@implementation ZYInputIDCardValidator


-(BOOL)validateInput:(UITextField *)input error:(NSError **)error {
    
    if (input.text.length <= 0) {
        *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorIDCard userInfo:@{NSLocalizedDescriptionKey : kIDCardValidatorErrorEmpty}];
        return NO;
    } else {
        
        BOOL isMatch = ZYRX(kIDCardValidatorDefault,input.text)
        
        if (isMatch == NO) {
            *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorIDCard userInfo:@{NSLocalizedDescriptionKey : kIDCardValidatorErrorFormat}];
            return NO;
        }
        return YES;
    }
}
@end


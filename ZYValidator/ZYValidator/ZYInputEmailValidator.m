//
//  EmailValidator.m
// 
//
//  Created by 杨志远 on 16/9/26.
//  Copyright © 2016年 杨志远. All rights reserved.
//

#import "ZYInputEmailValidator.h"
// 提示信息
static NSString *const kEmailValidatorErrorEmpty= @"邮箱为空";
static NSString *const kEmailValidatorErrorFormat= @"邮箱格式不正确";
// 正则表达式
static NSString *const kEmailValidatorDefault = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

@implementation ZYInputEmailValidator


-(BOOL)validateInput:(UITextField *)input error:(NSError **)error {
    
    if (input.text.length <= 0) {
        *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorEmail userInfo:@{NSLocalizedDescriptionKey : kEmailValidatorErrorEmpty}];
        return NO;
    } else {
        BOOL isMatch = ZYRX(kEmailValidatorDefault,input.text);
        if (isMatch == NO) {
            *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorEmail userInfo:@{NSLocalizedDescriptionKey : kEmailValidatorErrorFormat}];
            return NO;
        }
        return YES;
    }
}


@end


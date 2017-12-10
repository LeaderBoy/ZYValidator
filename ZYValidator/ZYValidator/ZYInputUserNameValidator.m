//
//  UserNameValidator.m
//  UnitTestLearn
//
//  Created by 杨志远 on 2017/12/3.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYInputUserNameValidator.h"

@implementation ZYInputUserNameValidator

// 提示信息
static NSString *const kUserNameValidatorErrorEmpty = @"用户名为空";
static NSString *const kUserNameValidatorErrorFormat = @"用户名格式不正确";
// 正则表达式
//static NSString *const kUserNameValidatorDefault = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";

static NSString *const kUserNameValidatorDefault = @"(^[A-Za-z0-9\u4E00-\u9FA5]{3,20}$)";

/**
 用户名（数字/字母/汉字)(3-20位)
 
 @param input 输入内容
 @param error 验证错误
 @return 验证是否通过
 */
-(BOOL)validateInput:(UITextField *)input error:(NSError **)error {
    
    if (input.text.length <= 0) {
        *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorUserName userInfo:@{NSLocalizedDescriptionKey : kUserNameValidatorErrorEmpty}];
        return NO;
    } else {
        BOOL isMatch = ZYRX(kUserNameValidatorDefault,input.text)
        
        if (isMatch == NO) {
            *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorUserName userInfo:@{NSLocalizedDescriptionKey : kUserNameValidatorErrorFormat}];
            return NO;
        }
        return YES;
    }
}
@end


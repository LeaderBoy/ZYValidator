//
//  PostCodeValidator.m
//  UnitTestLearn
//
//  Created by 杨志远 on 2017/12/4.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYInputPostCodeValidator.h"
// 提示信息
static NSString *const kPostCodeValidatorErrorEmpty = @"邮编为空";
static NSString *const kPostCodeValidatorErrorFormat = @"邮编格式不正确";
// 正则表达式
static NSString *const kPostCodeValidatorDefault = @"^[1-9][0-9]{5}$";
@implementation ZYInputPostCodeValidator
// 邮编大全
// https://wenku.baidu.com/view/b88de513de80d4d8d15a4feb.html

-(BOOL)validateInput:(UITextField *)input error:(NSError **)error {
    
    if (input.text.length <= 0) {
        *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorPostCode userInfo:@{NSLocalizedDescriptionKey : kPostCodeValidatorErrorEmpty}];
        return NO;
    } else {
        
        BOOL isMatch = ZYRX(kPostCodeValidatorDefault,input.text)
        
        if (isMatch == NO) {
            *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorPostCode userInfo:@{NSLocalizedDescriptionKey : kPostCodeValidatorErrorFormat}];
            return NO;
        }
        return YES;
    }
}
@end


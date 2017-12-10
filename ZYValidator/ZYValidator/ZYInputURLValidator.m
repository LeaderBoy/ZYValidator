//
//  URLValidator.m
//  UnitTestLearn
//
//  Created by 杨志远 on 2017/12/4.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYInputURLValidator.h"

// 提示信息
static NSString *const kURLValidatorErrorEmpty = @"URL地址为空";
static NSString *const kURLValidatorErrorFormat = @"URL地址格式不正确";
// 正则表达式
//static NSString *const kURLValidatorDefault = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
static NSString *const kURLValidatorDefault = @"http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&amp;=]*)?";


@implementation ZYInputURLValidator
// 网址大全
// http://www.flvcd.com/url.php
// 正则表达式
// https://stackoverflow.com/questions/1471201/how-to-validate-an-url-on-the-iphone
-(BOOL)validateInput:(UITextField *)input error:(NSError **)error {
    
    if (input.text.length <= 0) {
        *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorURL userInfo:@{NSLocalizedDescriptionKey : kURLValidatorErrorEmpty}];
        return NO;
    } else {
        
        BOOL isMatch = ZYRX(kURLValidatorDefault,input.text)
        
        if (isMatch == NO) {
            *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorURL userInfo:@{NSLocalizedDescriptionKey : kURLValidatorErrorFormat}];
            return NO;
        }
        return YES;
    }
}
@end


//
//  CarNumberValidator.m
//  UnitTestLearn
//
//  Created by 杨志远 on 2017/12/4.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYInputCarNumberValidator.h"
// 提示信息
static NSString *const kCarNumberValidatorErrorEmpty = @"车牌号为空";
static NSString *const kCarNumberValidatorErrorFormat = @"车牌号格式不正确";
// 正则表达式
static NSString *const kCarNumberValidatorDefault = @"^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[警京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼]{0,1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}|[黑黄蓝绿]{1}$";
@implementation ZYInputCarNumberValidator
/*
 车牌号的第一个是汉字：代表该车户口所在省的简称：如四川就是川
 第二个是英文：代表该车所在地的地市一级代码，规律一般是这样的，A是省会，B是该省第二大城市，C是该省第三大城市，依此类推
 然后就是后五位啦，这后五位是这样的规律，如果你是第一个在该省该地区上的第一个车牌，从理论上讲你车牌后五位就是00001，如果你是第8965位车主，你的车牌的后五位理论上就应该是08965，如果车牌超过了数字的容量就是第100000万位时，就从第一位开始用字母A，后面用0001至9999，用完后第一位改成B再跟0001至9999，依此类推，也就是说如果车牌号越大说明车越新，前面的英文字母越靠后，说明车越新，这就是一般规律。
 */


-(BOOL)validateInput:(UITextField *)input error:(NSError **)error {
    if (input.text.length <= 0) {
        *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorCarNumber userInfo:@{NSLocalizedDescriptionKey : kCarNumberValidatorErrorEmpty}];
        return NO;
    } else {
        
        BOOL isMatch = ZYRX(kCarNumberValidatorDefault,input.text)
        
        if (isMatch == NO) {
            *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorCarNumber userInfo:@{NSLocalizedDescriptionKey : kCarNumberValidatorErrorFormat}];
            return NO;
        }
        return YES;
    }
}
@end


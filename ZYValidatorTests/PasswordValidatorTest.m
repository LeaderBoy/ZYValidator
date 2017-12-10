//
//  PasswordValidatorTest.m
//  UnitTestLearnTests
//
//  Created by 杨志远 on 2017/12/5.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UITextField+ZYValidator.h"
@interface PasswordValidatorTest : XCTestCase

@end

@implementation PasswordValidatorTest

- (void)setUp {
    [super setUp];
}

-(void)testZYInputPasswordValidatorTypeDefault {
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeDefault];
// false
    // 少于8位的
    XCTAssertFalse([self validateWith:password]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password]);
    // 数字 字母
    password.text = @"1234";
    XCTAssertFalse([self validateWith:password]);
    // 数字 符号 字母
    password.text = @"123@#A";
    XCTAssertFalse([self validateWith:password]);
    // 大于8位的
    // 字母
    password.text = @"AWDdwdawwerf";
    XCTAssertFalse([self validateWith:password]);
    // 符号
    password.text = @"!@#$%^&*_!@#";
    XCTAssertFalse([self validateWith:password]);
    // 数字
    password.text = @"123456787654";
    XCTAssertFalse([self validateWith:password]);
    //true
    // 数字 符号
    password.text = @"123@#$$%^";
    XCTAssertTrue([self validateWith:password]);
    // 数字 字母
    password.text = @"1234dwadAdaw";
    XCTAssertTrue([self validateWith:password]);
    // 符号 字母
    password.text = @"!@#QWefsfefe";
    XCTAssertTrue([self validateWith:password]);
    // 符号 数字 字母
    password.text = @"@#$1234wqertA";
    XCTAssertTrue([self validateWith:password]);

}

//中：纯字母，纯字符，纯数字
-(void)testZYInputPasswordValidatorTypeIntensityLow {
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityLow];
// false
    XCTAssertFalse([self validateWith:password]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password]);
    // 数字 字母
    password.text = @"12345A6789A";
    XCTAssertFalse([self validateWith:password]);
    // 数字 符号
    password.text = @"123456A789@#";
    XCTAssertFalse([self validateWith:password]);
    // 字母 符号
    password.text = @"AWDdwdaw!@#$%";
    XCTAssertFalse([self validateWith:password]);
    // 数字 字母 符号
    password.text = @"123456Ab!@#$%^&*_";
    XCTAssertFalse([self validateWith:password]);
    
//true
    // 数字
    password.text = @"123";
    XCTAssertTrue([self validateWith:password]);
    // 数字 大写
    password.text = @"aaa";
    XCTAssertTrue([self validateWith:password]);
    // 数字 大写 小写
    password.text = @"!@#$%^&_";
    XCTAssertTrue([self validateWith:password]);
}

//中：字母+数字，字母+特殊字符，数字+特殊字符
-(void)testZYInputPasswordValidatorTypeIntensityMid {
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityMid];
    // false
    XCTAssertFalse([self validateWith:password]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password]);
    // 数字
    password.text = @"123";
    XCTAssertFalse([self validateWith:password]);
    // 字母
    password.text = @"aaa";
    XCTAssertFalse([self validateWith:password]);
    // 特殊符号
    password.text = @"!@#$%^&";
    XCTAssertFalse([self validateWith:password]);
    
// true
    // 数字 字母
    password.text = @"12345A6789A";
    XCTAssertTrue([self validateWith:password]);
    // 数字 符号
    password.text = @"123456A789@#";
    XCTAssertTrue([self validateWith:password]);
    // 字母 符号
    password.text = @"AWDdwdaw!@#$%";
    XCTAssertTrue([self validateWith:password]);
    // 数字 字母 符号
    password.text = @"123456Ab!@#$%^&*_";
    XCTAssertTrue([self validateWith:password]);
}

// 强:由字母+数字+特殊字符组成
-(void)testZYInputPasswordValidatorTypeIntensityHigh {
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    // false
    XCTAssertFalse([self validateWith:password]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password]);
    // 数字
    password.text = @"123";
    XCTAssertFalse([self validateWith:password]);
    // 字母
    password.text = @"aaa";
    XCTAssertFalse([self validateWith:password]);
    // 特殊字符
    password.text = @"!@#$%^&";
    XCTAssertFalse([self validateWith:password]);
    
    // 特殊字符 数字
    password.text = @"!@#$%^&234";
    XCTAssertFalse([self validateWith:password]);
    
    // 特殊字符 字母
    password.text = @"!@#$%^&ADWDd";
    XCTAssertFalse([self validateWith:password]);
    
    // 数字 字母
    password.text = @"12Q3eqe45";
    XCTAssertFalse([self validateWith:password]);
    
    // true
    // 数字 字母 符号
    password.text = @"12@#345A6789A";
    XCTAssertTrue([self validateWith:password]);
    // 数字 字母 符号
    password.text = @"1234567890qwertyuiqwer!@#$%^&*";
    XCTAssertTrue([self validateWith:password]);
}
//至少一个 大写字母 一个小写字母 一个数字 其他为任意字符 8-20位

-(void)testZYInputPasswordValidatorType1 {
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorType1];
// false
    XCTAssertFalse([self validateWith:password]);
    // 空
    password.text = @"";
// 小于8位
    XCTAssertFalse([self validateWith:password]);
    // 数字
    password.text = @"123";
    XCTAssertFalse([self validateWith:password]);
    // 字母
    password.text = @"aaa";
    XCTAssertFalse([self validateWith:password]);
    // 特殊字符
    password.text = @"!@#$%^&";
    XCTAssertFalse([self validateWith:password]);
    // 数字 小写
    password.text = @"123ass";
    XCTAssertFalse([self validateWith:password]);
    
    password.text = @"23asAda";
    XCTAssertFalse([self validateWith:password]);
// 大于8位
    // 数字 小写
    password.text = @"1234qwer";
    XCTAssertFalse([self validateWith:password]);
    // 数字 大写
    password.text = @"123QWRWER";
    XCTAssertFalse([self validateWith:password]);
    // 大写 小写
    password.text = @"QewWRWeqER";
    XCTAssertFalse([self validateWith:password]);
    
    // 特殊字符 字母
    password.text = @"!@#$%^&ADWDd";
    XCTAssertFalse([self validateWith:password]);
    
    // 数字 大写
    password.text = @"Q3EQQEWQ45";
    XCTAssertFalse([self validateWith:password]);
// 超过20位
    // 数字 字母
    password.text = @"12Q3eqe4EEQ5wjdji214i1i2h1uih1i4";
    XCTAssertFalse([self validateWith:password]);
// true
    // 数字 大写 小写
    password.text = @"1qw2weQQ";
    XCTAssertTrue([self validateWith:password]);
    // 数字 大写 小写
    password.text = @"QQ1ww2ww3ee45r67";
    XCTAssertTrue([self validateWith:password]);
    
    // 数字 大写 小写
    password.text = @"QQ13ee45@#$r67";
    XCTAssertTrue([self validateWith:password]);
}

-(void)testZYInputPasswordValidatorType2 {
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorType2];
    // false
    XCTAssertFalse([self validateWith:password]);
    // 空
    password.text = @"";
    // 小于8位
    XCTAssertFalse([self validateWith:password]);
    // 数字
    password.text = @"123";
    XCTAssertFalse([self validateWith:password]);
    // 字母
    password.text = @"aaa";
    XCTAssertFalse([self validateWith:password]);
    // 特殊字符
    password.text = @"!@#$%^&";
    XCTAssertFalse([self validateWith:password]);
    // 数字 小写
    password.text = @"123ass";
    XCTAssertFalse([self validateWith:password]);
    
    password.text = @"z23Ada";
    XCTAssertFalse([self validateWith:password]);
    // 大于8位
    // 数字 字母
    password.text = @"2ew345rew67";
    XCTAssertFalse([self validateWith:password]);
    // 数字 下划线
    password.text = @"1_3253453453";
    XCTAssertFalse([self validateWith:password]);
    // 下划线 数字 字母
    password.text = @"_2313weqeq";
    XCTAssertFalse([self validateWith:password]);
    
    // true
    // 字母
    password.text = @"wertydawda";
    XCTAssertTrue([self validateWith:password]);
    // 字母 数字 下划线
    password.text = @"d12dad_dwa_";
    XCTAssertTrue([self validateWith:password]);
    // 字母 下划线
    password.text = @"Q_dwa_da_123e4";
    XCTAssertTrue([self validateWith:password]);
    // 字母 数字
    password.text = @"Q12334567";
    XCTAssertTrue([self validateWith:password]);
    // 字母 数字 下划线
    password.text = @"Q12da_dwdwa";
    XCTAssertTrue([self validateWith:password]);
}
// 数字 字母组成 8-20位
-(void)testZYInputPasswordValidatorType3 {
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorType3];
    // false
    XCTAssertFalse([self validateWith:password]);
    // 空
    password.text = @"";

    XCTAssertFalse([self validateWith:password]);
    // 数字
    password.text = @"123";
    XCTAssertFalse([self validateWith:password]);
    // 字母 数字
    password.text = @"aaa121";
    XCTAssertFalse([self validateWith:password]);
    // 特殊字符 数字  字母
    password.text = @"121312eweaAdwad!@!";
    XCTAssertFalse([self validateWith:password]);
    // 数字 特殊字符
    password.text = @"ass!@!#$#$@";
    XCTAssertFalse([self validateWith:password]);
    
    password.text = @"z23Ada";
    XCTAssertFalse([self validateWith:password]);
    
    // true
    // 字母 数字
    password.text = @"1234weqw";
    XCTAssertTrue([self validateWith:password]);
    password.text = @"qwe12wqeweq";
    XCTAssertTrue([self validateWith:password]);
    password.text = @"q1w2e3r4t5";
    XCTAssertTrue([self validateWith:password]);
    
}

-(void)testZYInputValidatorOptionsIntensityLow {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    ZYInputValidatorOptions options = ZYInputValidatorOptionsIntensityLow;

    // false
    XCTAssertFalse([self validateWith:password options:options]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字
    password.text = @"123wda";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字 字母
    password.text = @"123@#$";
    XCTAssertFalse([self validateWith:password options:options]);
    
    // 符号 字母
    password.text = @"@#$dwadaw";
    XCTAssertFalse([self validateWith:password options:options]);
    
    // 数字 字母符号
    password.text = @"1234@#$dwada";
    XCTAssertFalse([self validateWith:password options:options]);
    
    // true
    // 字母 数字
    password.text = @"1234";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"dfgh";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"!@#$%^&*_";
    XCTAssertTrue([self validateWith:password options:options]);
    
}

-(void)testZYInputValidatorOptionsIntensityMid {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    
    ZYInputValidatorOptions options = ZYInputValidatorOptionsIntensityMid;

    // false
    XCTAssertFalse([self validateWith:password options:options]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字
    password.text = @"123";
    XCTAssertFalse([self validateWith:password options:options]);

    password.text = @"@#$";
    XCTAssertFalse([self validateWith:password options:options]);
    
    password.text = @"wadwfgnj";
    XCTAssertFalse([self validateWith:password options:options]);
    
    // true
    // 字母 数字
    password.text = @"1234EQdwada";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"123!#1$@42";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"@daw#!EQdawa";
    XCTAssertTrue([self validateWith:password options:options]);
    
    password.text = @"213#!#@dawdaQw";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsIntensityHigh {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    ZYInputValidatorOptions options = ZYInputValidatorOptionsIntensityHigh;

    // false
    XCTAssertFalse([self validateWith:password options:options]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字
    password.text = @"123";
    XCTAssertFalse([self validateWith:password options:options]);
    
    password.text = @"@#$";
    XCTAssertFalse([self validateWith:password options:options]);
    
    password.text = @"wadwfgnj";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"1234EQdwada";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"123!#1$@42";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"@daw#!EQdawa";
    XCTAssertFalse([self validateWith:password options:options]);
    // true
    // 字母 数字    
    password.text = @"213#!#@dawdaQw";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsNotAllNumbers {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    
    ZYInputValidatorOptions options = ZYInputValidatorOptionsNotAllNumbers;
    // false
    XCTAssertFalse([self validateWith:password options:options]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字
    password.text = @"1234";
    XCTAssertFalse([self validateWith:password options:options]);
    
    // 
    password.text = @"@#$";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"wdawDADa";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"wadwfgnj";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"1234EQdwada";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"123!#1$@42";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"@daw#!EQdawa";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsNotAllLetters {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    
    ZYInputValidatorOptions options = ZYInputValidatorOptionsNotAllLetters;
    // false
    XCTAssertFalse([self validateWith:password options:options]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字
    password.text = @"ADADgrdawdaw";
    XCTAssertFalse([self validateWith:password options:options]);
    //
    password.text = @"@#$";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"12345";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"1234EQdwada";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"123!#1$@42";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"@daw#!EQdawa";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsNotAllSymbols {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    
    ZYInputValidatorOptions options = ZYInputValidatorOptionsNotAllSymbols;
    // false
    XCTAssertFalse([self validateWith:password options:options]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字
    password.text = @"!@#$%^&*_";
    XCTAssertFalse([self validateWith:password options:options]);
    //
    password.text = @"1234";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"qwert";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"1234EQdwada";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"123!#1$@42";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"@daw#!EQdawa";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsNotAllChinese {
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    ZYInputValidatorOptions options = ZYInputValidatorOptionsNotAllChinese;
    // false
    XCTAssertFalse([self validateWith:password options:options]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字
    password.text = @"测试";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"嘎嘣在1234";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"测试qdwert";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"1234EQ测试dwada";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"123!#测试1$@42";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"测试@daw#!EQdawa";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsAllNumbers {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    
    ZYInputValidatorOptions options = ZYInputValidatorOptionsAllNumbers;
    // false
    XCTAssertFalse([self validateWith:password options:options]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"@#$";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"wdawDADa";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"wadwfgnj";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"1234EQdwada";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"123!#1$@42";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"@daw#!EQdawa";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字
    password.text = @"1234";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsAllLetters {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    
    ZYInputValidatorOptions options = ZYInputValidatorOptionsAllLetters;
    // false
    XCTAssertFalse([self validateWith:password options:options]);
    //
    password.text = @"@#$";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"12345";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"1234EQdwada";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"123!#1$@42";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"@daw#!EQdawa";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字
    password.text = @"ADADgrdawdaw";
    XCTAssertTrue([self validateWith:password options:options]);
    
}
-(void)testZYInputValidatorOptionsAllSymbols {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    ZYInputValidatorOptions options = ZYInputValidatorOptionsAllSymbols;
    //false
    password.text = @"1234";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"qwert";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"1234EQdwada";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"123!#1$@42";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"@daw#!EQdawa";
    XCTAssertFalse([self validateWith:password options:options]);
    //true
    password.text = @"!@#$%^&*_";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsAllChinese {
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    ZYInputValidatorOptions options = ZYInputValidatorOptionsAllChinese;
    // false
    XCTAssertFalse([self validateWith:password options:options]);
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"嘎嘣在1234";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"测试qdwert";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"1234EQ测试dwada";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"123!#测试1$@42";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"测试@daw#!EQdawa";
    XCTAssertFalse([self validateWith:password options:options]);
    // 数字
    password.text = @"测试";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsUppercaseAtLeast {
    
UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    ZYInputValidatorOptions options = ZYInputValidatorOptionsUppercaseAtLeast;
    //false
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"1234";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"qwert";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"1234dwada";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"123!#1$@42";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"@daw#!dawa";
    XCTAssertFalse([self validateWith:password options:options]);
    //true
    password.text = @"W";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"W234";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"W@#$%";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"Wdwadadiuwa";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"1234W@#$%";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsLowercaseAtLeast {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    ZYInputValidatorOptions options = ZYInputValidatorOptionsLowercaseAtLeast;
    //false
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"1234";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"WERTY";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"1234WERTG";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"123!#1$@42";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"@WERFG#!WER";
    XCTAssertFalse([self validateWith:password options:options]);
    //true
    password.text = @"w";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"w234";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"w@#$%";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"Wdwadadiuwa";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"1234Ww@#$%";
    XCTAssertTrue([self validateWith:password options:options]);
}

-(void)testZYInputValidatorOptionsNumberAtLeast {
    
    UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeIntensityHigh];
    ZYInputValidatorOptions options = ZYInputValidatorOptionsNumberAtLeast;
    //false
    // 空
    password.text = @"";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"WERTY";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"!@#$%^";
    XCTAssertFalse([self validateWith:password options:options]);
    password.text = @"@WERFG#!WER";
    XCTAssertFalse([self validateWith:password options:options]);
    //true
    password.text = @"1";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"w234";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"12@#$";
    XCTAssertTrue([self validateWith:password options:options]);
    password.text = @"1234#$%sdwDWA";
    XCTAssertTrue([self validateWith:password options:options]);
}


-(BOOL)validateWith:(UITextField *)textField {
    NSError *error;
    BOOL result = [textField validate:&error];
    if (error) {
        NSLog(@"%@",[error localizedDescription]);
    }
    return result;
}

-(BOOL)validateWith:(UITextField *)textField options:(ZYInputValidatorOptions)options {
    NSError *error;
    BOOL result = [textField validate:options error:&error];
    if (error) {
        NSLog(@"%@",[error localizedDescription]);
    }
    return result;
}

@end

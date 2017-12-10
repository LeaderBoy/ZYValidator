//
//  EmailValitorTest.m
//  UnitTestLearnTests
//
//  Created by 杨志远 on 2017/10/23.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <XCTest/XCTest.h>
//#import "InputValidator.h"
#import "UITextField+ZYValidator.h"
@interface EmailValitorTest : XCTestCase
@end

@implementation EmailValitorTest

- (void)setUp {
    [super setUp];
}

/**
 主流邮箱的几种格式
 123456@qq.com
 xiaohuozi@qq.com
 xiaohuozi12345@qq.com
 xiaohuo_zi@qq.com
 xiaohuo.zi@qq.com
 xiaohuo.zi@qq.vip.com
 */
-(void)testEmail {
    UITextField *qq = [[UITextField alloc]initWithValidatorType:ZYInputValidatorTypeEmail];
    // false
    XCTAssertFalse([self validateWith:qq]);
    qq.text = @"";
    XCTAssertFalse([self validateWith:qq]);
    qq.text = @"123";
    XCTAssertFalse([self validateWith:qq]);
    qq.text = @"123@";
    XCTAssertFalse([self validateWith:qq]);
    qq.text = @"123@qq";
    XCTAssertFalse([self validateWith:qq]);
    qq.text = @"123@qq.";
    XCTAssertFalse([self validateWith:qq]);
    qq.text = @"123@qq.c";
    XCTAssertFalse([self validateWith:qq]);
    
    // true
    qq.text = @"123456@qq.com";
    XCTAssertTrue([self validateWith:qq]);
    qq.text = @"xiaohuozi@qq.com";
    XCTAssertTrue([self validateWith:qq]);
    qq.text = @"xiaohuozi12345@qq.com";
    XCTAssertTrue([self validateWith:qq]);
    qq.text = @"xiaohuo_zi@qq.com";
    XCTAssertTrue([self validateWith:qq]);
    qq.text = @"xiaohuo.zi@qq.com";
    XCTAssertTrue([self validateWith:qq]);
    qq.text = @"xiaohuo.zi@qq.vip.com";
    XCTAssertTrue([self validateWith:qq]);
    // 163
    qq.text = @"xiaohuo@163.com";
    XCTAssertTrue([self validateWith:qq]);
    // 139
    qq.text = @"xiaohuo@139.com";
    XCTAssertTrue([self validateWith:qq]);
    // sohu
    qq.text = @"xiaohuo@sohu.com";
    XCTAssertTrue([self validateWith:qq]);
    // 189
    qq.text = @"xiaohuo@189.com";
    XCTAssertTrue([self validateWith:qq]);
    // tom
    qq.text = @"xiaohuo@tom.com";
    XCTAssertTrue([self validateWith:qq]);
    // sina
    qq.text = @"xiaohuo@sina.com";
    XCTAssertTrue([self validateWith:qq]);
    // outlook
    qq.text = @"xiaohuo@outlook.com";
    XCTAssertTrue([self validateWith:qq]);
    // aliyun
    qq.text = @"xiaohuo@aliyun.com";
    XCTAssertTrue([self validateWith:qq]);
    // foxmail
    qq.text = @"xiaohuo@foxmail.com";
    XCTAssertTrue([self validateWith:qq]);
    // 21cn
    qq.text = @"xiaohuo@21cn.com";
    XCTAssertTrue([self validateWith:qq]);
    // 2980
    qq.text = @"xiaohuo@2980.com";
    XCTAssertTrue([self validateWith:qq]);
    // 188
    qq.text = @"xiaohuo@188.com";
    XCTAssertTrue([self validateWith:qq]);
    // yeah.net
    qq.text = @"xiaohuo@yeah.net";
    XCTAssertTrue([self validateWith:qq]);
    // wo.cn
    qq.text = @"xiaohuo@wo.cn";
    XCTAssertTrue([self validateWith:qq]);
    // vip.163.com
    qq.text = @"xiaohuo@yeah.net";
    XCTAssertTrue([self validateWith:qq]);
    // css.com.cn
    qq.text = @"xiaohuo@css.com.cn";
    XCTAssertTrue([self validateWith:qq]);
}

-(BOOL)validateWith:(UITextField *)textField {
    NSError *error;
    BOOL result = [textField validate:&error];
    return result;
}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
   
}

@end

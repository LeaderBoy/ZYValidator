//
//  IDCardValidatorTest.m
//  UnitTestLearnTests
//
//  Created by 杨志远 on 2017/12/4.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UITextField+ZYValidator.h"

@interface IDCardValidatorTest : XCTestCase

@end

@implementation IDCardValidatorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}




/**
 18位身份证号码各位的含义:
 1-2位省、自治区、直辖市代码；
 3-4位地级市、盟、自治州代码；
 5-6位县、县级市、区代码；
 7-14位出生年月日，比如19670401代表1967年4月1日；
 15-17位为顺序号，其中17位（倒数第二位）男为单数，女为双数；
 18位为校验码，0-9和X。作为尾号的校验码，是由把前十七位数字带入统一的公式计算出来的，计算的结果是0-10，如果某人的尾号是0－9，都不会出现X，但如果尾号是10，那么就得用X来代替，因为如果用10做尾号，那么此人的身份证就变成了19位。X是罗马数字的10，用X来代替10。
 */
-(void)testIDCard {
    UITextField*number = [[UITextField alloc]initWithValidatorType:ZYInputValidatorTypeIDCard];
    // false
// 18位的  (15位的已经不能使用)
    XCTAssertFalse([self validateWith:number]);
    number.text = @"";
    XCTAssertFalse([self validateWith:number]);
    // 位数不够的错误
    number.text = @"13082519912142233";
    XCTAssertFalse([self validateWith:number]);
    // 年 错误12
    number.text = @"130825199713232233";
    XCTAssertFalse([self validateWith:number]);
    // 月 错误33
    number.text = @"130825199713332233";
    XCTAssertFalse([self validateWith:number]);
    // 带X
    number.text = @"37152319940206569X";
    XCTAssertTrue([self validateWith:number]);

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(BOOL)validateWith:(UITextField *)textField {
    NSError *error;
    BOOL result = [textField validate:&error];
    if (error) {
        NSLog(@"%@",[error localizedDescription]);
    }
    return result;
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

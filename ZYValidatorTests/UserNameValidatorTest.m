//
//  UserNameValidatorTest.m
//  UnitTestLearnTests
//
//  Created by 杨志远 on 2017/12/5.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UITextField+ZYValidator.h"
@interface UserNameValidatorTest : XCTestCase

@end

@implementation UserNameValidatorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
-(void)testUserName {
    UITextField *userName = [[UITextField alloc]initWithValidatorType:ZYInputValidatorTypeUserName];
    // false
    XCTAssertFalse([self validateWith:userName]);
    userName.text = @"";
    XCTAssertFalse([self validateWith:userName]);
    userName.text = @"12";
    XCTAssertFalse([self validateWith:userName]);
    userName.text = @"!@!2";
    XCTAssertFalse([self validateWith:userName]);
    userName.text = @"我的的额$";
    XCTAssertFalse([self validateWith:userName]);
    // true
    userName.text = @"123";
    XCTAssertTrue([self validateWith:userName]);
    userName.text = @"我的43";
    XCTAssertTrue([self validateWith:userName]);
    userName.text = @"我的43";
    XCTAssertTrue([self validateWith:userName]);

}
-(BOOL)validateWith:(UITextField *)textField {
    NSError *error;
    BOOL result = [textField validate:&error];
    if (error) {
        NSLog(@"%@",[error localizedDescription]);
    }
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
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

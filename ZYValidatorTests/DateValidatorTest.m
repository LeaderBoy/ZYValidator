//
//  DateValidatorTest.m
//  UnitTestLearnTests
//
//  Created by 杨志远 on 2017/12/5.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UITextField+ZYValidator.h"
@interface DateValidatorTest : XCTestCase

@end

@implementation DateValidatorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
-(void)testDate {
UITextField *date= [[UITextField alloc]initWithValidatorType:ZYInputValidatorTypeDate];
    // false
    XCTAssertFalse([self validateWith:date]);
    date.text = @"";
    XCTAssertFalse([self validateWith:date]);
    date.text = @"2013-12-1";
    XCTAssertFalse([self validateWith:date]);
    date.text = @"12-12-12";
    XCTAssertFalse([self validateWith:date]);
    date.text = @"2012-13-12";
    XCTAssertFalse([self validateWith:date]);
    date.text = @"2012-12-32";
    XCTAssertFalse([self validateWith:date]);
    // true
    date.text = @"2012-12-12";
    XCTAssertTrue([self validateWith:date]);
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

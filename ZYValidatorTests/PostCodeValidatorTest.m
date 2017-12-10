//
//  PostCodeValidatorTest.m
//  UnitTestLearnTests
//
//  Created by 杨志远 on 2017/12/5.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UITextField+ZYValidator.h"
@interface PostCodeValidatorTest : XCTestCase

@end

@implementation PostCodeValidatorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
-(void)testPostCode {
    UITextField *car = [[UITextField alloc]initWithValidatorType:ZYInputValidatorTypePostCode];
    // false
    XCTAssertFalse([self validateWith:car]);
    car.text = @"";
    XCTAssertFalse([self validateWith:car]);
    car.text = @"020510";
    XCTAssertFalse([self validateWith:car]);
    
    // true
    car.text = @"100000";
    XCTAssertTrue([self validateWith:car]);
    car.text = @"402760";
    XCTAssertTrue([self validateWith:car]);
    car.text = @"472100";
    XCTAssertTrue([self validateWith:car]);
    car.text = @"118000";
    XCTAssertTrue([self validateWith:car]);
    car.text = @"723300";
    XCTAssertTrue([self validateWith:car]);
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

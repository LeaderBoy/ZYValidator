//
//  CarNumberValidatorTest.m
//  UnitTestLearnTests
//
//  Created by 杨志远 on 2017/12/4.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UITextField+ZYValidator.h"
@interface CarNumberValidatorTest : XCTestCase

@end

@implementation CarNumberValidatorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
-(void)testCarNumber {
    UITextField *car = [[UITextField alloc]initWithValidatorType:ZYInputValidatorTypeCarNumber];
    // false
    XCTAssertFalse([self validateWith:car]);
    car.text = @"";
    XCTAssertFalse([self validateWith:car]);
    car.text = @"我A88888";
    XCTAssertFalse([self validateWith:car]);
    car.text = @"闵8888";
    XCTAssertFalse([self validateWith:car]);
    car.text = @"鲁1961378";
    XCTAssertFalse([self validateWith:car]);
    // true
    car.text = @"粤A8888澳";
    XCTAssertTrue([self validateWith:car]);
    car.text = @"浙A1063警";
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

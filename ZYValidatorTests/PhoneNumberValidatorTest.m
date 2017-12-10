//
//  PhoneNumberValidatorTest.m
//  UnitTestLearnTests
//
//  Created by 杨志远 on 2017/10/23.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZYInputValidator.h"
#import "UITextField+ZYValidator.h"


@interface PhoneNumberValidatorTest : XCTestCase
@end

@implementation PhoneNumberValidatorTest

- (void)setUp {
    [super setUp];
}

/**
 1、移动号段有134,135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188搜索。
 2、联通号段有130，131，132，155，156，185，186，145，176。
 3、电信号段有133，153，177，180，181，189。
 */
-(void)testPhone {
    
     UITextField*number = [[UITextField alloc]initWithValidatorType:ZYInputValidatorTypePhone];
    // false
    XCTAssertFalse([self validateWith:number]);
    
    number.text = @"";
    XCTAssertFalse([self validateWith:number]);
    // 少于11位
    number.text = @"123";
    XCTAssertFalse([self validateWith:number]);
    // 多于11位
    number.text = @"123748723742";
    XCTAssertFalse([self validateWith:number]);
    // 其他
    number.text = @"12dwadwa121";
    XCTAssertFalse([self validateWith:number]);
    
    number.text = @"addwadwa121";
    XCTAssertFalse([self validateWith:number]);
    
    number.text = @"addw#d%a121";
    XCTAssertFalse([self validateWith:number]);
    
    //true - 移动
    number.text = @"13484783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"13584783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"13684783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"13784783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"13884783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"13984783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"14784783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"15084783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"15184783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"15284783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"15784783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"15884783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"15984783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"17884783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"18284783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"18384783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"18484783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"18784783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"18884783232";
    XCTAssertTrue([self validateWith:number]);
    
    // true - 联通
    number.text = @"13084783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"13184783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"13284783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"15584783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"15684783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"18584783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"18684783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"14584783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"17684783232";
    XCTAssertTrue([self validateWith:number]);
    
    // true - 电信
    number.text = @"13384783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"15384783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"17784783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"18084783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"18184783232";
    XCTAssertTrue([self validateWith:number]);
    
    number.text = @"18984783232";
    XCTAssertTrue([self validateWith:number]);
    
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

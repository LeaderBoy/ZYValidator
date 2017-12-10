//
//  DateValidator.m
//  UnitTestLearn
//
//  Created by 杨志远 on 2017/12/4.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYInputDateValidator.h"
// 提示信息
static NSString *const kDateValidatorErrorEmpty = @"日期为空";
static NSString *const kDateValidatorErrorFormat = @"日期格式不正确";
// 正则表达式
static NSString *const kDateValidatorDefault = @"(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)";

static NSString *const kDateValidatorType1 = @"(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)";

static NSString *const kDateValidatorType2 = @"(((0[1-9]|[12][0-9]|3[01])/((0[13578]|1[02]))|((0[1-9]|[12][0-9]|30)/(0[469]|11))|(0[1-9]|[1][0-9]|2[0-8])/(02))/([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3}))|(29/02/(([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00)))";


@interface ZYInputDateValidator()
@property(nonatomic,assign)ZYInputDateValidatorType validatorType;
@end

@implementation ZYInputDateValidator

-(instancetype)initWithDateType:(ZYInputDateValidatorType)type {
    self = [super init];
    if (self) {
        self.validatorType = type;
    }
    return self;
}

/**
 日期格式为 2012-12-12
 
 @param input 输入的内容
 @param error 验证的错误
 @return 验证是否通过
 */
-(BOOL)validateInput:(UITextField *)input error:(NSError **)error {
    
    if (input.text.length <= 0) {
        *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorDate userInfo:@{NSLocalizedDescriptionKey : kDateValidatorErrorEmpty}];
        return NO;
    } else {
        
        NSString *rx = nil;
        if(self.validatorType){
            rx = [self handleValidatorType:self.validatorType];
        }else{
            rx = kDateValidatorDefault;
        }
        
        //\\d{4}[年|\-|\.]\\d{\1-\12}[月|\-|\.]\\d{\1-\31}日?
        BOOL isMatch = ZYRX(kDateValidatorDefault,input.text)
        
        if (isMatch == NO) {
            *error = [NSError errorWithDomain:ZYInputValidatorErrorDomain code:ZYInputValidatorErrorDate userInfo:@{NSLocalizedDescriptionKey : kDateValidatorErrorFormat}];
            return NO;
        }
        return YES;
    }
}

-(NSString *)handleValidatorType:(ZYInputDateValidatorType)type {
    switch (type) {
        case ZYInputDateValidatorTypeDefault:
            return kDateValidatorDefault;
            break;
        case ZYInputDateValidatorType1:
            return kDateValidatorType1;
            break;
        case ZYInputDateValidatorType2:
            return kDateValidatorDefault;
            break;
    }
}
@end


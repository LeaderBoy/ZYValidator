//
//  ZYInputDateValidator.h
//  ZYValidator
//
//  Created by 杨志远 on 2017/12/10.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYInputValidator.h"


/**
 日期验证

 - ZYInputDateValidatorTypeDefault: 2012-12-12
 - ZYInputDateValidatorType1: 2012/12/12
 - ZYInputDateValidatorType2: 12/12/2012
 */
typedef NS_ENUM(NSUInteger, ZYInputDateValidatorType) {
    ZYInputDateValidatorTypeDefault,
    ZYInputDateValidatorType1,
    ZYInputDateValidatorType2
};
@interface ZYInputDateValidator : ZYInputValidator
-(instancetype)initWithDateType:(ZYInputDateValidatorType)type;

@end

//
//  ZYInputDateValidator.h
//  ZYValidator
//
//  Created by 杨志远 on 2017/12/10.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYInputValidator.h"
typedef NS_ENUM(NSUInteger, DateValidatorType) {
    DateValidatorTypeDefault,//2012-12-12
    DateValidatorType1,//2012/12/12
    DateValidatorType2 //12/12/2012
};
@interface ZYInputDateValidator : ZYInputValidator
-(instancetype)initWithDateType:(DateValidatorType)type;

@end

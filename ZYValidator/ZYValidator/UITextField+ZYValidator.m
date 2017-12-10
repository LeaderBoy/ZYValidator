//
//  UITextField+Validator.m
//  UnitTestLearn
//
//  Created by 杨志远 on 2017/12/3.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "UITextField+ZYValidator.h"
#import <objc/runtime.h>

static NSString *validatorKey = @"validatorKey";

@interface UITextField(ValidatorPrivate)
@property(nonatomic,strong)ZYInputValidator *validator;
@end

@implementation UITextField (ValidatorPrivate)
-(ZYInputValidator *)validator {
    return objc_getAssociatedObject(self, &validatorKey);
}

-(void)setValidator:(ZYInputValidator *)validator {
    objc_setAssociatedObject(self, &validatorKey, validator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end


@implementation UITextField (ZYValidator)
#pragma mark - Initial
-(instancetype)initWithValidatorType:(ZYInputValidatorType)type {
    if (self = [super init]) {
        ZYInputValidator *validator = [ZYInputValidator validateWithType:type];
        self.validator = validator;
    }
    return self;
}

-(instancetype)initWithPasswordType:(PasswordValidatorType)type {
    if (self = [super init]) {
        ZYInputPasswordValidator *validator = [[ZYInputPasswordValidator alloc]initWithPasswordType:type];
        self.validator = validator;
    }
    return self;
}

-(instancetype)initWithDateType:(DateValidatorType)type {
    if (self = [super init]) {
        ZYInputDateValidator *validator = [[ZYInputDateValidator alloc]initWithDateType:type];
        self.validator = validator;
    }
    return self;
}

#pragma mark - Validate
-(BOOL)validate:(NSError *__autoreleasing  _Nullable *)error {
    NSAssert(self.validator,@"请使用initWithValidatorType或者initWithPasswordType或者initWithPasswordOptions初始化UITextField" );
    return [self.validator validateInput:self error:error];
}

-(BOOL)validate:(ZYInputValidatorOptions)options error:(NSError *__autoreleasing  _Nullable *)error {
    NSAssert(self.validator,@"请使用initWithValidatorType或者initWithPasswordType或者initWithPasswordOptions初始化UITextField" );
    return [self.validator validateInput:self options:options error:error];
}


@end


# ZYValidator
用于验证 用户名/密码/手机号/邮箱/身份证号码/日期/URL地址/车牌号 的格式

#### 安装
在 podfile 中
```
pod ‘ZYValidator’,’~> 1.0.4’ 
```
在终端执行
```
pod install
```

#### 默认验证的类型
```
/**
 输入的类型
 
 - ZYInputValidatorTypeEmail: 邮箱
 - ZYInputValidatorTypePhone: 手机号
 - ZYInputValidatorTypeUserName: 用户名（数字/字母/汉字)(3-20位)
 - ZYInputValidatorTypePassword: 密码:密码必须由数字、字符、特殊字符三种中的两种组成,密码长度不能少于8个字符.
 - ZYInputValidatorTypeIDCard: 身份证号码
 - ZYInputValidatorTypeCarNumber: 车牌号码
 - ZYInputValidatorTypeDate: 时间
 - ZYInputValidatorTypePostCode: 邮编
 - ZYInputValidatorTypeURL: URL地址
 */
```
#### 以验证手机号为例
``` 
UITextField *number = [[UITextField alloc]initWithValidatorType:ZYInputValidatorTypePhone];
// 在需要的地方使用
NSError *error;
BOOL result = [number validate:&error];
if (error) {
    NSLog(@"%@",[error localizedDescription]);
}
```
#### 验证密码格式不同的需求
```
/**
 密码的验证类型
 
 - ZYInputPasswordValidatorTypeDefault:
 1、密码必须由数字、字符、特殊字符三种中的两种组成；
 2、密码长度不能少于8个字符；
 - ZYInputPasswordValidatorTypeIntensityLow:
 弱:由纯数字 或者 纯字母 或者 纯特殊符号组成
 - ZYInputPasswordValidatorTypeIntensityMid:
 中:由字母+数字 或者 字母+特殊字符 或者 数字+特殊字符 组成
 - ZYInputPasswordValidatorTypeIntensityHigh:
 强:由字母+数字+特殊字符组成
 - ZYInputPasswordValidatorType1:
 至少一个 大写字母 一个小写字母 一个数字 其他为任意字符 8-20位
 - ZYInputPasswordValidatorType2:
 字母开头 任意数字 字母 下划线 8-20位  (注:同时不能使用双下划线 例如__)
 - ZYInputPasswordValidatorType3:
 数字 字母组合 8-20位
 */ZYInput
```
##### 使用的方式
```
UITextField *password = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeDefault];
// 在需要的地方使用
NSError *error;
BOOL result = [password validate:&error];
if (error) {
    NSLog(@"%@",[error localizedDescription]);
}
```

#### 验证日期格式不同的需求
```
/**
 日期验证

 - ZYInputDateValidatorTypeDefault: 2012-12-12
 - ZYInputDateValidatorType1: 2012/12/12
 - ZYInputDateValidatorType2: 12/12/2012
 */
```
#### 使用方式
```
UITextField *date= [[UITextField alloc]initWithValidatorType:ZYInputValidatorTypeDate];
// 在需要的地方使用
BOOL result = [textField validate:&error];
if (error) {
    NSLog(@"%@",[error localizedDescription]);
}
```
#### 使用更详细的验证
```
/**
 详细的验证

 - ZYInputValidatorOptionsIntensityLow: 密码强度低 返回error -1
 - ZYInputValidatorOptionsIntensityMid: 密码强度中 返回error 0
 - ZYInputValidatorOptionsIntensityHigh: 密码强度高 返回error 1
 - ZYInputValidatorOptionsNotAllNumbers: 不能全是数字
 - ZYInputValidatorOptionsNotAllLetters: 不能全是字母
 - ZYInputValidatorOptionsNotAllSymbols: 不能全是特殊字符
 - ZYInputValidatorOptionsNotAllChinese: 不能全是中文
 - ZYInputValidatorOptionsAllNumbers: 必须全是数字
 - ZYInputValidatorOptionsAllLetters: 必须全是字母
 - ZYInputValidatorOptionsAllSymbols: 必须全是特殊字符
 - ZYInputValidatorOptionsAllChinese: 必须全是中文
 - ZYInputValidatorOptionsUppercaseAtLeast: 至少一个大写字母
 - ZYInputValidatorOptionsLowercaseAtLeast: 至少一个小写字母
 - ZYInputValidatorOptionsNumberAtLeast: 至少一个数字
 */
```

#### 使用方法
```
// 比如当你验证密码的时候你需要的是ZYInputPasswordValidatorType1即
// 至少一个 大写字母 一个小写字母 一个数字 其他为任意字符 8-20位

UITextField *textField = [[UITextField alloc]initWithPasswordType:ZYInputPasswordValidatorTypeDefault];

// 当用户提交的时候 需要提示用户
NSError *error;
BOOL result1 = [textField validate:ZYInputValidatorOptionsUppercaseAtLeast error:&error];
if (error) {
    NSLog(@"%@",[error localizedDescription]);// 至少一个大写字母
}

BOOL result2 = [textField validate:ZYInputValidatorOptionsLowercaseAtLeast error:&error];
if (error) {
    NSLog(@"%@",[error localizedDescription]);// 至少一个小写字母
}

```








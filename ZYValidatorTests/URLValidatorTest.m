//
//  URLValidatorTest.m
//  UnitTestLearnTests
//
//  Created by 杨志远 on 2017/12/5.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UITextField+ZYValidator.h"
@interface URLValidatorTest : XCTestCase

@end

@implementation URLValidatorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
-(void)testURL {
    UITextField *url = [[UITextField alloc]initWithValidatorType:ZYInputValidatorTypeURL];
    // false
    XCTAssertFalse([self validateWith:url]);
    url.text = @"";
    XCTAssertFalse([self validateWith:url]);
    url.text = @"020510";
    XCTAssertFalse([self validateWith:url]);
    url.text = @"http://";
    XCTAssertFalse([self validateWith:url]);
    url.text = @"http://www";
    XCTAssertFalse([self validateWith:url]);
    // true
    url.text = @"http://tv.sohu.com/20080504/n256652702.shtml ";
    XCTAssertTrue([self validateWith:url]);
    url.text = @"http://www.meipai.com/media/548729473 ";
    XCTAssertTrue([self validateWith:url]);
    url.text = @"http://sports.sina.com.cn/g/bn/2007-08-30/01364215.shtml";
    XCTAssertTrue([self validateWith:url]);
    url.text = @"http://video.sina.com.cn/ent/y/bn/2007-09-07/175220408.shtml";
    XCTAssertTrue([self validateWith:url]);
    url.text = @"http://ent.sina.com.cn/m/c/bn/2007-08-24/095619396.shtml";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://blog.sina.com.cn/s/blog_4bba2f0601000bjk.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://www.56.com/u49/v_MTI4NDY2MzA.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://news.163.com/08/1030/21/4PHL3SUL00011229.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://ent.163.com/08/1124/10/4RGR98RU00032A6T.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://open.163.com/movie/2011/9/I/7/M7CTDM4AF_M7VLT57I7.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://www.joy.cn/special-page.jsp?zt=7";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://www.letv.com/ptv/vplay/24607840.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://www.wasu.cn/Play/show/id/7148873";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://www.baofeng.com/play/179/play-764679.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://weibo.com/p/230444275371ca2a5d0b4799dfc23ab3a98d61";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://v.pps.tv/play_323QCL.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://vod.kankan.com/v/90/90606.shtml";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://news.cntv.cn/china/20091227/101928.shtml";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://www.cctv.com/video/jingjibanxiaoshi/2008/09/jingjibanxiaoshi_300_20080919_1.shtml";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://www.m1905.com/vod/305803.shtml";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://item.btime.com/news/208ghb52n99222hkgf89ciiqb59";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://life.gztv.com/2016/0725/41750.shtml";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://i.mtime.com/2012/";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://miniv.v1.cn/mylist/tatopic.action?topicid=147890";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://v.zol.com.cn/video77303.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://play.hupo.tv/tv/11130841.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://dv.ce.cn/video/2010/09/02/346845.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://msn.v1.cn/shehui/sh/2010-12-9/1291856176999v.shtml";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://bilibili.kankanews.com/video/av332432/";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://world.kankanews.com/focus/2012-06-28/1265955.shtml";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://6pingm.iqiyi.com/v/125028.html";
    XCTAssertTrue([self validateWith:url]);
    
    url.text = @"http://download.5721.net/flash/2/10/200611301136.shtml";
    XCTAssertTrue([self validateWith:url]);
    
    
    
    
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

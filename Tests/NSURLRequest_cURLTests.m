//
//  NSURLReqeust_cURLTests.m
//  NSURLReqeust-cURLTests
//
//  Created by Carl Jahn on 17.09.14.
//  Copyright (c) 2014 Carl Jahn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSURLRequest+cURL.h"

@interface NSURLRequest_cURLTests : XCTestCase

@end

@implementation NSURLRequest_cURLTests

- (NSMutableURLRequest *)defaultRequest {
    NSString *urlString = @"http://www.google.de";
    NSURL *url = [NSURL URLWithString:urlString];

    return [NSMutableURLRequest requestWithURL:url];
}

- (void)testGETRequest {

    NSURLRequest *request = [self defaultRequest];
    XCTAssertEqualObjects(@"curl -k -X GET --dump-header - \"http://www.google.de\"", [request cURLCommandString]);
}

- (void)testRequestWithCustomHeaders {

    NSMutableURLRequest *request = [self defaultRequest];
    [request setValue:@"header Value" forHTTPHeaderField:@"customHeader"];

    XCTAssertEqualObjects(@"curl -k -X GET --dump-header - -H \"customHeader: header Value\" \"http://www.google.de\"", [request cURLCommandString]);
}

- (void)testPOSTRequestWithData {

    NSMutableURLRequest *request = [self defaultRequest];
    request.HTTPMethod = @"POST";
    
    NSDictionary *postData = @{ @"key1" : @"value1", @"key2" : @"value2" };
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:postData options:0 error:nil];

    NSString *testString = @"curl -k -X POST --dump-header - -d \"{\\\"key1\\\":\\\"value1\\\",\\\"key2\\\":\\\"value2\\\"}\" \"http://www.google.de\"";
    XCTAssertEqualObjects(testString, [request cURLCommandString]);
}

@end

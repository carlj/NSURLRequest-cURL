//
//  NSURLRequest+cURL.m
//  NSURLReqeust-cURL
//
//  Created by Carl Jahn on 17.09.14.
//  Copyright (c) 2014 Carl Jahn. All rights reserved.
//

#import "NSURLRequest+cURL.h"

@implementation NSURLRequest (cURL)

- (NSString *)escapeQuotesInString:(NSString *)string {
    NSParameterAssert(string.length);
    
    return [string stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
}

- (NSString *)cURLCommandString {
    
    NSMutableString *curlString = [NSMutableString stringWithFormat:@"curl -k -X %@ --dump-header -", self.HTTPMethod];
    
    for (NSString *key in self.allHTTPHeaderFields.allKeys) {
        
        NSString *headerKey = [self escapeQuotesInString: key];
        NSString *headerValue = [self escapeQuotesInString: self.allHTTPHeaderFields[key] ];
        
        [curlString appendFormat:@" -H \"%@: %@\"", headerKey, headerValue];
    }
    
    NSString *bodyDataString = [[NSString alloc] initWithData:self.HTTPBody encoding:NSUTF8StringEncoding];
    if (bodyDataString.length) {
        
        bodyDataString = [self escapeQuotesInString: bodyDataString ];
        [curlString appendFormat:@" -d \"%@\"", bodyDataString];
    }
    
    [curlString appendFormat:@" \"%@\"", self.URL.absoluteString];
    
    return curlString;
}

@end

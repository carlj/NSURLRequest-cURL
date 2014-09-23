//
//  ViewController.m
//  NSURLReqeust-cURL
//
//  Created by Carl Jahn on 17.09.14.
//  Copyright (c) 2014 Carl Jahn. All rights reserved.
//

#import "ViewController.h"
#import "NSURLRequest+cURL.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *urlString = @"http://www.google.de";
    NSURL *url = [NSURL URLWithString:urlString];
    
    //GET request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"GET request:");
    NSLog(@"%@", [request cURLCommandString]);
    
    //POST Request with data
    NSMutableURLRequest *mutablerequest = [NSMutableURLRequest requestWithURL:url];
    mutablerequest.HTTPMethod = @"POST";
    
    NSDictionary *postData = @{ @"key1" : @"value1", @"key2" : @"value2" };
    mutablerequest.HTTPBody =[NSJSONSerialization dataWithJSONObject:postData options:0 error:nil];
   
    NSLog(@"POST Request with data:");
    NSLog(@"%@", [mutablerequest cURLCommandString]);

    //Request with Custom Header
    mutablerequest = [NSMutableURLRequest requestWithURL:url];
    [mutablerequest setValue:@"header Value" forHTTPHeaderField:@"customHeader"];

    NSLog(@"Request with Custom Header:");
    NSLog(@"%@", [mutablerequest cURLCommandString]);
}

@end

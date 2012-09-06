//
//  Scratchpad.m
//  URLSchemes
//
//  Created by Greg Pierce on 9/2/12.
//  Copyright (c) 2012 Agile Tortoise, Inc. All rights reserved.
//

#import "Scratchpad.h"
#import "NSString+URLEncoding.h"

@implementation Scratchpad

+ (void)examples
{
    NSString *urlString = @"test://action?param1=%@&params2=%@";
    NSString *p1 = @"Hello World";
    NSString *p2 = @"You’re Awesome";
    
    NSString *fullURLString = [NSString stringWithFormat:urlString, [p1 urlEncodeUsingEncoding:NSUTF8StringEncoding], [p2 urlEncodeUsingEncoding:NSUTF8StringEncoding]];
    NSURL *url = [NSURL URLWithString:fullURLString];
    
    NSLog(@"%@", [url absoluteString]);
}

@end

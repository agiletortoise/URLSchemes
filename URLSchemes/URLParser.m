//
//  URLParser.m
//

#import "URLParser.h"

@implementation URLParser

@synthesize variables;

- (id) initWithURLString:(NSString *)url{
    self = [super init];
    if (self != nil) {
        NSString *string = url;
        NSScanner *scanner = [NSScanner scannerWithString:string];
        [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"&?"]];
        NSString *tempString;
        NSMutableArray *vars = [NSMutableArray new];
        [scanner scanUpToString:@"?" intoString:nil]; //ignore the beginning of the string and skip to the vars
        while ([scanner scanUpToString:@"&" intoString:&tempString]) {
            [vars addObject:[[tempString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] copy]];
        }
        self.variables = vars;
    }
    return self;
}

- (NSString *)valueForVariable:(NSString *)varName {
    for (NSString *var in self.variables) {
        if ([var length] > [varName length]+1 && 
            [[[var substringWithRange:NSMakeRange(0, [varName length]+1)] lowercaseString] isEqualToString:[[varName lowercaseString] stringByAppendingString:@"="]]
            ) {
            NSString *varValue = [var substringFromIndex:[varName length]+1];
            return varValue;
        }
    }
    return nil;
}

@end


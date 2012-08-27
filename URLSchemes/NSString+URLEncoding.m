//
//  NSString+URLEncoding.m
//

#import "NSString+URLEncoding.h"

@implementation NSString (URLEncoding)

-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding {
	return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                               (__bridge CFStringRef)self,
                                                               NULL,
                                                               (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                               CFStringConvertNSStringEncodingToEncoding(encoding));
}

@end

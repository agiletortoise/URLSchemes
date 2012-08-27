//
//  URLParser.h
//
// SEE: http://stackoverflow.com/questions/2225814/nsurl-pull-out-a-single-value-for-a-key-in-a-parameter-string


#import <Foundation/Foundation.h>

@interface URLParser : NSObject {
    NSArray *variables;
}

@property (nonatomic, retain) NSArray *variables;

- (id)initWithURLString:(NSString *)url;
- (NSString *)valueForVariable:(NSString *)varName;

@end

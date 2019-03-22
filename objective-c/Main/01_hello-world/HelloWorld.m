#import "HelloWorld.h"

@implementation HelloWorld

- (NSString *)hello:(NSString *)string {
    if (string == nil) {
        return @"Hello, World!";
    }

    return [NSString stringWithFormat:@"Hello, %@!", string];
}

@end

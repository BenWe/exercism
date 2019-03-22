#import "TwoFer.h"

@implementation TwoFer

+ (NSString *) twoFerWithName:(NSString * _Nullable)name {
    NSString * nameToInsert = (name == nil) ? @"you" : name;

    return [NSString stringWithFormat:@"One for %@, one for me.", nameToInsert];
}

@end

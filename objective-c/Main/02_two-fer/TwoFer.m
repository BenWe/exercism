#import "TwoFer.h"

@implementation TwoFer

+ (NSString *) twoFerWithName:(NSString * _Nullable)name {
    NSString *cleanedUp = [name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *nameToInsert = (cleanedUp == nil || cleanedUp.length == 0) ? @"you" : cleanedUp;

    return [NSString stringWithFormat:@"One for %@, one for me.", nameToInsert];
}

@end

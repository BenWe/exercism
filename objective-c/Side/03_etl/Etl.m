#import "Etl.h"

@implementation Etl

+ (NSDictionary<NSString *, NSNumber *> *) transform:(NSDictionary<NSNumber *, NSArray<NSString *> *> *) old {
    NSMutableDictionary *returnDict = [NSMutableDictionary<NSString *, NSNumber *> new];
    [old enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSArray<NSString *> * _Nonnull obj, BOOL * _Nonnull stop) {
        [obj enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [returnDict setObject:key forKey:[obj lowercaseString]];
        }];
    }];

    return returnDict;
}

@end

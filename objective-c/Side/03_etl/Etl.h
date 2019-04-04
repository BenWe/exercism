#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Etl : NSObject

+ (NSDictionary<NSString *, NSNumber *> *) transform:(NSDictionary<NSNumber *, NSArray<NSString *> *> *) old;

@end

NS_ASSUME_NONNULL_END

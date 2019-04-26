#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Leap : NSObject

@property BOOL isLeapYear;

- (Leap *) initWithCalendarYear:(NSNumber *)year;

@end

NS_ASSUME_NONNULL_END

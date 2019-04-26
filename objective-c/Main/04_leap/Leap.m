#import "Leap.h"

@implementation Leap

#pragma mark - Init

- (Leap *)initWithCalendarYear:(NSNumber *)year {
    self = [super init];

    BOOL isDivisibleByFour = (year.integerValue % 4) == 0;
    BOOL isDivisibleByOneHundred = (year.integerValue % 100) == 0;
    BOOL isDivisibleByFourHundred = (year.integerValue % 400) == 0;

    self.isLeapYear = (isDivisibleByFour && !isDivisibleByOneHundred) || isDivisibleByFourHundred;

    return self;
}

@end

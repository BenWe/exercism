#import "Raindrops.h"

@interface Raindrops ()

@property (nonatomic) int number;

@end

@implementation Raindrops

#pragma mark - Init

- (id) initWithNumber:(int)number {
    self = [super init];

    self.number = number;

    return self;
}

#pragma mark - Object Logic

- (NSString *) sounds {
    NSString *pling = (self.number % 3 == 0) ? @"Pling" : @"";
    NSString *plang = (self.number % 5 == 0) ? @"Plang" : @"";
    NSString *plong = (self.number % 7 == 0) ? @"Plong" : @"";

    NSString *joined = [@[pling, plang, plong] componentsJoinedByString:@""];

    return (joined.length == 0) ? [NSString stringWithFormat:@"%d", self.number] : joined;
}

@end

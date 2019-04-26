#import "Bob.h"

@implementation Bob

#pragma mark - Constants

static NSString *beThatWay = @"Fine. Be that way!";
static NSString *chillOut = @"Whoa, chill out!";
static NSString *sure = @"Sure.";
static NSString *whatever = @"Whatever.";

#pragma mark - Logic

- (NSString *) hey:(NSString *)input {
    BOOL isOnlyWhitespace = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0;
    BOOL isUppercase = [self isUppercase:input];
    BOOL hasQuestionMark = [input hasSuffix:@"?"];

    if (isOnlyWhitespace) {
        return beThatWay;
    }

    if (isUppercase) {
        return chillOut;
    }

    if (hasQuestionMark) {
        return sure;
    }

    return whatever;
}

- (BOOL) isUppercase:(NSString *)text {
    NSString *filtered = [[text componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
    if ([filtered isEqual:@""]) {
        return NO;
    }

    return [filtered isEqualToString:[filtered uppercaseString]];
}

@end

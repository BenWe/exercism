#import "Bob.h"

@implementation Bob

#pragma mark - Constants

static NSString *beThatWay = @"Fine. Be that way!";
static NSString *chillOut = @"Whoa, chill out!";
static NSString *sure = @"Sure.";
static NSString *whatever = @"Whatever.";

#pragma mark - Logic

- (NSString *) hey:(NSString *)input {
    if ([input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0) {
        return beThatWay;
    }

    bool hasQuestionMark = [input hasSuffix:@"?"];
    bool hasExclamationMark = [input hasSuffix:@"!"];
    bool hasMostlyUppercaseChars = [self isMostlyUppercase:input];

    if (hasMostlyUppercaseChars) {
        return chillOut;
    }

    if (hasExclamationMark) {
        if (!hasMostlyUppercaseChars) {
            return whatever;
        }

        return chillOut;
    }

    if (hasQuestionMark) {
        return sure;
    }

    return whatever;
}

- (bool) isMostlyUppercase:(NSString *)string {
    NSMutableCharacterSet *uppercaseSetAndUmlauts = [NSMutableCharacterSet uppercaseLetterCharacterSet];
    [uppercaseSetAndUmlauts formUnionWithCharacterSet:[NSCharacterSet characterSetWithCharactersInString:@"ÄÜÖ"]];
    NSCharacterSet *everythingButLetters = [[NSCharacterSet letterCharacterSet] invertedSet];

    NSString *filtered = [[string componentsSeparatedByCharactersInSet:everythingButLetters] componentsJoinedByString:@""];

    NSUInteger stringLength = filtered.length;
    NSUInteger count = 0;

    bool isMostlyUppercase = false;

    for (int i = 0; i < stringLength; i++) {
        unichar character = [filtered characterAtIndex:i];
        bool isUppercase = [uppercaseSetAndUmlauts characterIsMember:character];

        if (isUppercase ) {
            count++;
        }

        if (count == stringLength) {
            isMostlyUppercase = true;
            break;
        }
    }

    return isMostlyUppercase;
}

@end

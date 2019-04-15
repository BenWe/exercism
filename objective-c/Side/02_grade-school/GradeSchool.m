#import "GradeSchool.h"

@interface GradeSchool ()

@property NSMutableDictionary<NSNumber *, NSMutableArray<NSString *> *> *roster;

@end

@implementation GradeSchool

- (id) init {
    self = [super init];

    self.roster = [NSMutableDictionary<NSNumber *,NSMutableArray<NSString *> *> new];

    return self;
}

- (void) addStudentWithName:(NSString *)name andGrade:(NSNumber *)grade {
    if (self.roster[grade] == nil) {
        self.roster[grade] = [NSMutableArray<NSString *> new];
    }

    [self.roster[grade] addObject:name];
}

- (NSDictionary<NSNumber *,NSArray<NSString *> *> *) db {
    return self.roster;
}

- (NSDictionary<NSNumber *,NSArray<NSString *> *> *) sort {
    NSMutableDictionary *returnDict = [NSMutableDictionary<NSNumber *, NSArray<NSString *> *> new];
    [self.roster enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSMutableArray<NSString *> * _Nonnull obj, BOOL * _Nonnull stop) {
        [returnDict setObject:[obj sortedArrayUsingSelector:@selector(compare:)] forKey:key];
    }];

    return returnDict;
}

- (NSArray<NSString *> *) studentsInGrade:(NSNumber *)grade {
    if (self.roster[grade] == nil) {
        self.roster[grade] = [NSMutableArray<NSString *> new];
    }
    
    return self.roster[grade];
}

@end

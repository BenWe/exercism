#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradeSchool : NSObject

- (void) addStudentWithName:(NSString *)name andGrade:(NSNumber *)grade;

- (NSDictionary<NSNumber *, NSArray<NSString *> *> *) db;
- (NSDictionary<NSNumber *, NSArray<NSString *> *> *) sort;

- (NSArray<NSString *> *) studentsInGrade:(NSNumber *)grade;

@end

NS_ASSUME_NONNULL_END

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSObject

@property (nonatomic) NSString *question;
@property (nonatomic) NSInteger answer;

@property (nonatomic) NSDate *startTime;
@property (nonatomic) NSDate *endTime;

@property (nonatomic) int leftValue;
@property (nonatomic) int rightValue;


- (instancetype)init;
- (NSInteger) answer;
- (NSTimeInterval) timeToAnswer;
- (void) generateQuestion;

@end

NS_ASSUME_NONNULL_END

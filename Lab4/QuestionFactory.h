#import <Foundation/Foundation.h>
#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuestionFactory : NSObject

- (instancetype)init;
- (Question *) generateRandomQuestion;

@end

NS_ASSUME_NONNULL_END

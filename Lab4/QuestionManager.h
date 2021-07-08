#import <Foundation/Foundation.h>
#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuestionManager : NSObject

@property (nonatomic) NSMutableArray *questions;

- (instancetype)init;
- (NSString *) timeOutput;

@end

NS_ASSUME_NONNULL_END

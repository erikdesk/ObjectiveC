#import "QuestionManager.h"

@implementation QuestionManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _questions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *) timeOutput {
    NSInteger totalTime = 0;
    NSInteger averageTime;
    
    for (id question in _questions) {
        totalTime = totalTime + (NSInteger) [question timeToAnswer];
    }
    averageTime = (NSInteger)((float) totalTime / (float) [_questions count]);

    return [NSString stringWithFormat:@"total time: %lds, average time %lds", (long)totalTime, (long)averageTime];
}

@end

#import "MultiplicationQuestion.h"

@implementation MultiplicationQuestion

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self generateQuestion];
    }
    return self;
}

- (void) generateQuestion {
    super.question = [NSString stringWithFormat:@"%d x %d ?", super.leftValue, super.rightValue];
    super.answer = super.leftValue * super.rightValue;
}

@end

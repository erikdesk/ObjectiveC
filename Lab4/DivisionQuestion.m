#import "DivisionQuestion.h"

@implementation DivisionQuestion

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self generateQuestion];
    }
    return self;
}

- (void) generateQuestion {
    super.question = [NSString stringWithFormat:@"%d ÷ %d ?", super.leftValue, super.rightValue];
    super.answer = (NSInteger) ((float) super.leftValue / (float) super.rightValue);
}

@end

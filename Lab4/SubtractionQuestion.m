#import "SubtractionQuestion.h"

@implementation SubtractionQuestion

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self generateQuestion];
    }
    return self;
}

- (void) generateQuestion {
    super.question = [NSString stringWithFormat:@"%d - %d ?", super.rightValue, super.leftValue];
    super.answer = super.leftValue - super.rightValue;
}

@end

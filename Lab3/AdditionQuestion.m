#import "AdditionQuestion.h"

@implementation AdditionQuestion

- (instancetype)init
{
    self = [super init];
    if (self) {
        const int min = 1;
        const int max = 5;
        const int firstInt = arc4random_uniform((max - min) + 1) + min;
        const int secondInt = arc4random_uniform((max - min) + 1) + min;
        _question = [NSString stringWithFormat:@"%d + %d ?", firstInt, secondInt];
        _answer = firstInt + secondInt;
    }
    return self;
}

@end

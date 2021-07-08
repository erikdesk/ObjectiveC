#import "Question.h"

@interface Question ()

@end

@implementation Question

- (instancetype)init
{
    self = [super init];
    if (self) {
        const int min = 1;
        const int max = 5;
        _leftValue = arc4random_uniform((max - min) + 1) + min;
        _rightValue = _leftValue * (arc4random_uniform((max - min) + 1) + min);
        _startTime = [NSDate date];
    }
    return self;
}

- (NSInteger) answer {
    _endTime = [NSDate date];
    return _answer;
}

- (NSTimeInterval) timeToAnswer {
    return [_endTime timeIntervalSinceDate:_startTime];
}

- (void) generateQuestion {}

@end

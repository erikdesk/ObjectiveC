#import "ScoreKeeper.h"

@interface ScoreKeeper ()

@end

@implementation ScoreKeeper

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rightAnswerCount = 0;
        _wrongAnswerCount = 0;
    }
    return self;
}

- (NSString *) scoreOutput {
    int triesCount = _rightAnswerCount + _wrongAnswerCount;
    if (triesCount == 0) {
        return @"";
    }
    
    return [NSString stringWithFormat:@"score: %d right, %d wrong ---- %.0f%%", _rightAnswerCount, _wrongAnswerCount, ((float)_rightAnswerCount / (float)triesCount) * 100.0];
}

@end

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isHeld = NO;
    }
    return self;
}

- (void) randomize {
    const int min = 1;
    const int max = 6;
    _currentValue = arc4random_uniform((max - min) + 1) + min;
}

@end

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        const int min = 1;
        const int max = 6;
        _currentValue = arc4random_uniform((max - min) + 1) + min;
    }
    return self;
}

@end

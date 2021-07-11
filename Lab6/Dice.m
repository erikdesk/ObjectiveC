#import "Dice.h"

@implementation Dice

- (void) randomize {
    const int min = 1;
    const int max = 6;
    _currentValue = arc4random_uniform((max - min) + 1) + min;
}

@end

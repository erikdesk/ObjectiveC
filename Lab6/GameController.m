#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dices = @[[Dice new], [Dice new], [Dice new], [Dice new], [Dice new]];
        _remainingRollCount = 5;
    }
    return self;
}

- (void) randomizeUnheldDices {
    for (id dice in _dices) {
        if (![dice isHeld]) {
            [dice randomize];
        }
    }
    _remainingRollCount = _remainingRollCount - 1;
}

- (void) showState {
    NSArray *diceCharacters = @[@"", @"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
    
    NSString *currentValuesString = @"";
    NSInteger score = 0;
    for (id dice in _dices) {
        if (![dice isHeld]) {
            currentValuesString = [NSString stringWithFormat:@"%@ %@  ", currentValuesString, [diceCharacters objectAtIndex: (long) [dice currentValue]]];
        } else {
            currentValuesString = [NSString stringWithFormat:@"%@[%@] ", currentValuesString, [diceCharacters objectAtIndex: (long) [dice currentValue]]];
            score = score + [dice currentValue];
        }
    }
    NSLog(@"%@ - Score: %ld - Rolls Left: %ld", currentValuesString, score, _remainingRollCount);
}

- (void) holdDice: (NSInteger)indexOfDice {
    [[_dices objectAtIndex:indexOfDice] setIsHeld:![[_dices objectAtIndex:indexOfDice] isHeld]];
}

- (void) resetDices {
    for (id dice in _dices) {
        [dice setIsHeld:NO];
    }
}

- (NSInteger) countDicesHeld {
    NSInteger heldCount = 0;
    for (id dice in _dices) {
        if ([dice isHeld]) {
            heldCount = heldCount + 1;
        }
    }
    
    return heldCount;
}

@end

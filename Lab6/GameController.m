#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dices = @[[Dice new], [Dice new], [Dice new], [Dice new], [Dice new]];
    }
    return self;
}

- (void) randomizeUnheldDices {
    for (id dice in _dices) {
        if (![dice isHeld]) {
            [dice randomize];
        }
    }
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
    NSLog(@"%@ Score: %ld", currentValuesString, score);
}

- (void) holdDice: (NSInteger)indexOfDice {
    [[_dices objectAtIndex:indexOfDice] setIsHeld:![[_dices objectAtIndex:indexOfDice] isHeld]];
}

- (void) resetDices {
    for (id dice in _dices) {
        [dice setIsHeld:NO];
    }
}

@end

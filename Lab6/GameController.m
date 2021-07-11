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

- (void) showDices {
    NSArray *diceCharacters = @[@"", @"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
    
    NSString *currentValuesString = @"";
    for (id dice in _dices) {
        if (![dice isHeld]) {
            currentValuesString = [NSString stringWithFormat:@"%@ %@  ", currentValuesString, [diceCharacters objectAtIndex: (long) [dice currentValue]]];
        } else {
            currentValuesString = [NSString stringWithFormat:@"%@[%@] ", currentValuesString, [diceCharacters objectAtIndex: (long) [dice currentValue]]];
        }
    }
    NSLog(@"%@", currentValuesString);
}

- (void) holdDice: (NSInteger)indexOfDice {
    if ([[_dices objectAtIndex:indexOfDice] isHeld]) {
        NSLog(@"Dice is already held.");
    } else {
        [[_dices objectAtIndex:indexOfDice] setIsHeld:YES];
    }
}

@end

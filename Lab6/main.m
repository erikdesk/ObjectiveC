#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Dice.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *diceCharacters = @[@"", @"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
        NSArray *dices = @[[Dice new], [Dice new], [Dice new], [Dice new], [Dice new]];
        NSString *menuString = [NSString stringWithFormat:@"\n%@%@%@",
                                @"What would you like to do next?\n",
                                @"roll - Roll the unheld dice.\n",
                                @"quit - Exit the game.\n"];
        InputCollector *inputCollector = [InputCollector new];
        
        while (YES) {
            NSString *inputString = [inputCollector inputForPrompt:menuString];
            if ([inputString isEqual: @"roll"]) {
                NSString *currentValuesString = @"";
                for (id dice in dices) {
                    [dice randomize];
                    currentValuesString = [NSString stringWithFormat:@"%@%@ ", currentValuesString, [diceCharacters objectAtIndex: (long) [dice currentValue]]];
                }
                NSLog(@"%@", currentValuesString);
                
                continue;
            }
            if ([inputString isEqual: @"quit"]) {
                break;
            }
        }
    }
    return 0;
}

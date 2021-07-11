#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "GameController.h"

NSString *getNumberizedResult(NSString *inputString) {
    NSCharacterSet *nonNumberCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange characterRange = [inputString rangeOfCharacterFromSet:nonNumberCharacterSet];
    BOOL isAllDigits = characterRange.location == NSNotFound;
    
    if (!isAllDigits) {
        return @"Input cannot be converted to an integer.";
    }
    
    int convertedNumber = [inputString intValue];
    
    return [NSString stringWithFormat:@"%i", convertedNumber];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputCollector *inputCollector = [InputCollector new];
        GameController *gameController = [GameController new];
        NSString *menuString = [NSString stringWithFormat:@"\n%@%@%@%@%@",
                                @"What would you like to do next?\n",
                                @"roll   - Roll the unheld dice.\n",
                                @"hold x - Toggle hold on die at index x.\n",
                                @"reset -  Removes all hold from all dice.\n",
                                @"quit   - Exit the game.\n"];
        
        while (YES) {
            NSString *inputString = [inputCollector inputForPrompt:menuString];
            
            if ([gameController remainingRollCount] == 0) {
                [gameController showState];
                break;
                
            } else if ([gameController countDicesHeld] == 5) {
                [gameController showState];
                break;
                    
            } else if ([inputString hasPrefix:@"hold"] && [inputString length] == 6) {
                NSString *indexOfDiceText = [inputString substringFromIndex:5];
                NSInteger indexOfDice = [getNumberizedResult(indexOfDiceText) intValue];
                [gameController holdDice:indexOfDice];
                [gameController showState];
                continue;
                
            } else if ([inputString isEqual: @"roll"]) {
                [gameController randomizeUnheldDices];
                [gameController showState];
                continue;
                
            } else if ([inputString isEqual: @"reset"]) {
                [gameController resetDices];
                [gameController showState];
                continue;
                
            } else if ([inputString isEqual: @"quit"]) {
                break;
                
            } else {
                NSLog(@"\nInvalid command!");
                continue;
            }
        }
    }
    return 0;
}

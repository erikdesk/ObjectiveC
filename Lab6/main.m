#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        
        InputCollector *inputCollector = [InputCollector new];
        GameController *gameController = [GameController new];
        NSString *menuString = [NSString stringWithFormat:@"\n%@%@%@",
                                @"What would you like to do next?\n",
                                @"roll - Roll the unheld dice.\n",
                                @"quit - Exit the game.\n"];
        
        [gameController randomizeUnheldDices];
        [gameController showState];
        [gameController holdDice:3];
        [gameController showState];
        [gameController resetDices];
        [gameController showState];
        
        while (YES) {
            NSString *inputString = [inputCollector inputForPrompt:menuString];
            if ([inputString isEqual: @"roll"]) {
                [gameController randomizeUnheldDices];
                [gameController showState];
                continue;
            }
            if ([inputString isEqual: @"quit"]) {
                break;
            }
        }
    }
    return 0;
}

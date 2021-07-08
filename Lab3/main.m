// https://developer.apple.com/documentation/foundation/nsstring/1497275-stringwithformat

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "ScoreKeeper.h"
#import "AdditionQuestion.h"

int convertToIntFromNSString(NSString *string) {
    NSCharacterSet *nonNumberCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange characterRange = [string rangeOfCharacterFromSet:nonNumberCharacterSet];
    BOOL isAllDigits = characterRange.location == NSNotFound;
    
    if (!isAllDigits) {
        NSException *exception = [NSException exceptionWithName:@"IntFromNSStringInputStringException" reason:@"*** convertToIntFromNSString(): string must only contain digits" userInfo:nil];
        @throw exception;
    }
    
    return [string intValue];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ScoreKeeper *scoreKeeper = [[ScoreKeeper alloc] init];
        
        NSLog(@"MATHS! ('q' to quit)");
        
        BOOL gameOn = YES;
        while (gameOn) {
            AdditionQuestion *additionQuestion = [[AdditionQuestion alloc] init];
            
            NSString *inputString;
            int inputInt;
            BOOL validInput = NO;
            while (!validInput) {
                inputString = [InputHandler getUserInputWithMaxLength:255 andPrompt:[additionQuestion question]];
                
                if ([inputString isEqual: @"q"]) {
                    validInput = YES;
                    gameOn = NO;
                    continue;
                }
                
                @try {
                    inputInt = convertToIntFromNSString(inputString);
                    validInput = YES;
                } @catch (NSException *exception) {
                    NSLog(@"Input only digits!");
                }
            }
            
            if ([inputString isEqual: @"q"]) {
                validInput = YES;
                gameOn = NO;
                continue;
            }
            
            if (inputInt == [additionQuestion answer]) {
                [scoreKeeper setRightAnswerCount: [scoreKeeper rightAnswerCount] + 1];
                NSLog(@"Right! %@", [scoreKeeper scoreOutput]);
            } else {
                [scoreKeeper setWrongAnswerCount: [scoreKeeper wrongAnswerCount] + 1];
                NSLog(@"Wrong! %@", [scoreKeeper scoreOutput]);
            }
        }
    }
    return 0;
}

// https://eezytutorials.com/ios/nsdate-by-example.php#.YOdVlOipFHY
// https://stackoverflow.com/questions/4933075/nstimeinterval-to-hhmmss
// https://stackoverflow.com/questions/10224762/how-to-initialize-an-empty-mutable-array-in-objective-c/35829457

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "ScoreKeeper.h"
#import "QuestionManager.h"
#import "Question.h"
#import "AdditionQuestion.h"
#import "QuestionFactory.h"

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
        QuestionManager *questionManager = [[QuestionManager alloc] init];
        QuestionFactory *questionFactory = [[QuestionFactory alloc] init];
        
        NSLog(@"MATHS! ('q' to quit)");
        
        BOOL gameOn = YES;
        while (gameOn) {
            
            Question *newQuestion;
            newQuestion = [[questionFactory generateRandomQuestion] init];
            [[questionManager questions] addObject:newQuestion];
            NSInteger questionCount = [[questionManager questions] count];
            NSString *inputString;
            int inputInt;
            BOOL validInput = NO;
            while (!validInput) {
                NSString *question = [[[questionManager questions] objectAtIndex:questionCount - 1] question];
                inputString = [InputHandler getUserInputWithMaxLength:255 andPrompt:question];
                
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
            
            NSInteger answer;
            answer = [[[questionManager questions] objectAtIndex:questionCount - 1] answer];
            if (inputInt == answer) {
                [scoreKeeper setRightAnswerCount: [scoreKeeper rightAnswerCount] + 1];
                NSLog(@"Right!");
            } else {
                [scoreKeeper setWrongAnswerCount: [scoreKeeper wrongAnswerCount] + 1];
                NSLog(@"Wrong!");
            }
            NSLog(@"%@", [scoreKeeper scoreOutput]);
            NSLog(@"%@", [questionManager timeOutput]);
        }
    }
    return 0;
}

// https://stackoverflow.com/questions/6644004/how-to-check-if-nsstring-is-contains-a-numeric-value
// https://gist.github.com/jonathan-beebe/4962594
// https://stackoverflow.com/questions/3251804/how-to-display-the-last-char-of-the-nsstring
// https://stackoverflow.com/questions/1231764/nsstring-convert-to-pure-alphabet-only-i-e-remove-accentspunctuation
// https://stackoverflow.com/questions/6171422/objective-c-nsstring-wordcount
// https://stackoverflow.com/questions/16481884/how-do-i-convert-nsuinteger-value-to-int-value-in-objectivec
// https://pinkstone.co.uk/how-to-convert-an-nsstring-into-an-integer/
// https://stackoverflow.com/questions/3414644/how-to-convert-integer-to-string
// https://stackoverflow.com/questions/42125/warning-error-function-declaration-isnt-a-prototype
// https://stackoverflow.com/questions/12156780/how-to-add-concatenate-multiple-nsstring-in-one-string-in-iphone/22807099
// https://stackoverflow.com/questions/22458423/nsrange-error-while-using-it-for-lookup
// https://stackoverflow.com/questions/6752082/is-there-a-format-specifier-that-works-with-boolean-values

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NSString *getUppercasedResult(NSString *inputString) {
    return [inputString uppercaseString];
}

NSString *getLowercasedResult(NSString *inputString) {
    return [inputString lowercaseString];
}

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

NSString *getCanadianizedResult(NSString *inputString) {
    return [inputString stringByAppendingString:@", eh?"];
}

NSString *getRespondedResult(NSString *inputString) {
    NSString *questionMarkResponse = @"I don't know.";
    NSString *exclaimationMarkResponse = @"Whoa, calm down!";
    NSString *neutralResponse = @"OK.";
    
    NSString *lastCharacter = [inputString substringFromIndex:[inputString length] - 1];
    NSString *finalResponse;
    if ([lastCharacter isEqual: @"?"]) {
        finalResponse = questionMarkResponse;
    } else if ([lastCharacter isEqual: @"!"]) {
        finalResponse = exclaimationMarkResponse;
    } else {
        finalResponse = neutralResponse;
    }
    
    return finalResponse;
}

NSString *getDeSpacedResult(NSString *inputString) {
    return [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
}

NSString *getWordCountResult(NSString *inputString) {
    int wordCount;
    wordCount = (int)[[NSSpellChecker sharedSpellChecker] countWordsInString:inputString language:nil];
    
    return [[NSString alloc]initWithFormat:@"%i words", wordCount];
}

NSString *getPunctuationRemovalResult(NSString *inputString) {
    NSCharacterSet *punctuationCharacterSet = [[NSCharacterSet letterCharacterSet] invertedSet];
    NSArray<NSString *> *splitByPunctuationStrings = [inputString componentsSeparatedByCharactersInSet:punctuationCharacterSet];
    NSString *rejoinedString = [splitByPunctuationStrings componentsJoinedByString:@""];
    
    return rejoinedString;
}

NSString *createIntroPromptText(void) {
    return @"\nEnter your String: ('q' to quit)\n";
}

NSString *createMenuPromptText(void) {
    NSString *menuInstructionsText = @"\nChoose one of the following options:\n";
    
    NSString *menuOptionText1 = @"1. Uppercase\n";
    NSString *menuOptionText2 = @"2. Lowercase\n";
    NSString *menuOptionText3 = @"3. Numberize\n";
    NSString *menuOptionText4 = @"4. Canadianize\n";
    NSString *menuOptionText5 = @"5. Respond\n";
    NSString *menuOptionText6 = @"6. De-Space-It\n";
    NSString *menuOptionText7 = @"7. Word Count\n";
    NSString *menuOptionText8 = @"8. Remove Punctuations\n";
    NSString *menuOptionText9 = @"9. Done\n";
    
    return [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@",
            menuInstructionsText,
            menuOptionText1,
            menuOptionText2,
            menuOptionText3,
            menuOptionText4,
            menuOptionText5,
            menuOptionText6,
            menuOptionText7,
            menuOptionText8,
            menuOptionText9
            ];
}

NSString *getUserInput(int maxLength, NSString *prompt) {
    if (maxLength < 1) {
        maxLength = 255;
    }
    NSLog(@"%@", prompt);
    
    char inputChars[maxLength];
    char *result = fgets(inputChars, maxLength, stdin);
    
    if (result != NULL) {
        NSString *string = [NSString stringWithUTF8String:inputChars];
        NSCharacterSet *whiteSpaceCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        return [string stringByTrimmingCharactersInSet:whiteSpaceCharacterSet];
    }
    return NULL;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *inputString;
        NSString *selectedMenuItemString;
        
        while (YES) {
            inputString = getUserInput(255, createIntroPromptText());
            if ([inputString isEqual: @"q"]) {
                break;
            }
            
            while(YES) {
                selectedMenuItemString = getUserInput(255, createMenuPromptText());
                if ([selectedMenuItemString isEqual: @"1"]) {
                    NSLog(@"\n%@\n", getUppercasedResult(inputString));
                } else if ([selectedMenuItemString isEqual: @"2"]) {
                    NSLog(@"\n%@\n", getLowercasedResult(inputString));
                } else if ([selectedMenuItemString isEqual: @"3"]) {
                    NSLog(@"\n%@\n", getNumberizedResult(inputString));
                } else if ([selectedMenuItemString isEqual: @"4"]) {
                    NSLog(@"\n%@\n", getCanadianizedResult(inputString));
                } else if ([selectedMenuItemString isEqual: @"5"]) {
                    NSLog(@"\n%@\n", getRespondedResult(inputString));
                } else if ([selectedMenuItemString isEqual: @"6"]) {
                    NSLog(@"\n%@\n", getDeSpacedResult(inputString));
                } else if ([selectedMenuItemString isEqual: @"7"]) {
                    NSLog(@"\n%@\n", getWordCountResult(inputString));
                } else if ([selectedMenuItemString isEqual: @"8"]) {
                    NSLog(@"\n%@\n", getPunctuationRemovalResult(inputString));
                } else if ([selectedMenuItemString isEqual: @"9"]) {
                    break;
                } else {
                    NSLog(@"\nInvalid selection (enter only 1 to 9)!\n");
                }
            }
        }
    }
    return 0;
}

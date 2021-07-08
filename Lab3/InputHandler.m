#import "InputHandler.h"

@implementation InputHandler

+ (NSString *) getUserInputWithMaxLength: (int) maxLength andPrompt: (NSString *) prompt {
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

@end

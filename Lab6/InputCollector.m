#import "InputCollector.h"

@implementation InputCollector

- (NSString *) inputForPrompt: (NSString *)promptString {
    int maxLength = 255;
    
    if (maxLength < 1) {
        maxLength = 255;
    }
    NSLog(@"%@", promptString);
    
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

#import "QuestionFactory.h"

@interface QuestionFactory ()

@property (nonatomic) NSArray *questionSubclassNames;

@end

@implementation QuestionFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
        _questionSubclassNames = @[@"AdditionQuestion", @"SubtractionQuestion", @"MultiplicationQuestion", @"DivisionQuestion"];
    }
    return self;
}

- (Question *) generateRandomQuestion {
    const int min = 0;
    const int max = (int) [_questionSubclassNames count] - 1;
    const int chosenSubclassIndex = arc4random_uniform((max - min) + 1) + min;
    NSString *chosenSubclassName = [_questionSubclassNames objectAtIndex:chosenSubclassIndex];
    
    return [[NSClassFromString(chosenSubclassName) alloc] init];
}

@end

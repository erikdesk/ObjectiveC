#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScoreKeeper : NSObject

@property (nonatomic) int rightAnswerCount;
@property (nonatomic) int wrongAnswerCount;

- (instancetype)init;
- (NSString *) scoreOutput;
    
@end

NS_ASSUME_NONNULL_END

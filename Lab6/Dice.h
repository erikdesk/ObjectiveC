#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property (nonatomic) NSInteger currentValue;

- (void) randomize;

@end

NS_ASSUME_NONNULL_END

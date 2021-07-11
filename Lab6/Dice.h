#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property (nonatomic) NSInteger currentValue;
@property (nonatomic) BOOL isHeld;

- (instancetype)init;
- (void) randomize;

@end

NS_ASSUME_NONNULL_END

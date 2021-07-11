#import <Foundation/Foundation.h>
#import "Dice.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic) NSArray *dices;

- (instancetype)init;
- (void) randomizeUnheldDices;
- (void) showDices;
- (void) holdDice: (NSInteger)indexOfDice;
- (void) resetDices;

@end

NS_ASSUME_NONNULL_END

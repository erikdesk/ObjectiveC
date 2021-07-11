#import <Foundation/Foundation.h>
#import "Dice.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic) NSArray *dices;
@property (nonatomic) NSInteger remainingRollCount;

- (instancetype)init;
- (void) randomizeUnheldDices;
- (void) showState;
- (void) holdDice: (NSInteger)indexOfDice;
- (void) resetDices;
- (NSInteger) countDicesHeld;

@end

NS_ASSUME_NONNULL_END

#import "Box.h"

@implementation Box

- (instancetype)initWithHeight: (float) height andWidth: (float) width andLength: (float) length {
    self = [super init];
    if (self) {
        _height = height;
        _width = width;
        _length = length;
    }
    return self;
}

- (float) volume {
    return self.height * self.width * self.length;
}

- (int) fitWithBox: (Box *) innerBox {
    return floor(self.volume / [innerBox volume]);
}

@end

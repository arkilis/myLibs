//
//  MyProtocol.h
//  testProtocol
//
//  Created by Ben Liu on 14/02/2016.
//  Copyright © 2016 Ben Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyProtocol <NSObject>

- (void)signalStop;
- (void)signalLeftTurn;
- (void)signalRightTurn;

@end
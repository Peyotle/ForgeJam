//
//  GameRules.h
//  DwarfForgeJam
//
//  Created by Oleg on 23/08/14.
//  Copyright (c) 2014 Peyotle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
@interface GameRules : NSObject

+ (GameRules*)sharedRules;

- (BOOL)shouldSelectCell:(Cell*)cell;


@end

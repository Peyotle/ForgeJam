//
//  Grid.h
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Cell.h"

@interface Grid : CCNode {
    
}

- (void)gridWithWidth:(int)width height:(int)height columns:(int)columns rows:(int)rows;
- (Cell *)cellAtColumn:(int)column row:(int)row;

- (void)placeCellsForLevel:(int)level;

@end

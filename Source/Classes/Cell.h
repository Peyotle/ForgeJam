//
//  Cell.h
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "cocos2d.h"

@interface Cell : CCNode {
    
}

@property (strong, nonatomic) CCLabelTTF *symbol;

@property(assign, nonatomic)int cellWidth;
@property(assign, nonatomic)int cellHeight;

/**
 *  1 - 8 integer
 */
@property(assign, nonatomic)int colorNumber;

@end

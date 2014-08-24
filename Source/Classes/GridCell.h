//
//  GridCell.h
//  DwarfForgeJam
//
//  Created by Oleg on 23/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CellProtocol.h"
@interface GridCell : CCNode <CellProtocol> {
    
}
@property (assign, nonatomic) NSInteger *temperature;

@property(assign, nonatomic)int column;
@property(assign, nonatomic)int row;

@end

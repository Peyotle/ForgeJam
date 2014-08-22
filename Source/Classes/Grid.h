//
//  Grid.h
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Grid : CCNode {
    
}

- (void)gridWithWidth:(int)width height:(int)height columns:(int)columns rows:(int)rows;
@end

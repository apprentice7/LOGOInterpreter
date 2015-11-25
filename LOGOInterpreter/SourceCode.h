//
//  SourceCode.h
//  LOGOIP
//
//  Created by Kangkai on 12/4/15.
//  Copyright (c) 2015 Kangkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TokenList.h"
#import "Token.h"
@interface SourceCode : NSObject
@property NSString* SourceString;
@property NSMutableArray* TokenArr;

//Split input string into array elements.
- (NSArray*)SplitArray;
- (void)SetString: (NSString*)String;
@end

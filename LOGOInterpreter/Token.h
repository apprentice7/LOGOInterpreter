//
//  Token.h
//  LOGOIP
//
//  Created by Kangkai on 7/4/15.
//  Copyright (c) 2015 Kangkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SyntaxTreeNode.h"


@interface Token : NSObject
@property (nonatomic,readwrite) NSString * ID;
@property (nonatomic,readwrite) long Value;
- (SyntaxTreeNode*) Parse: TokenList;
@end

//Token without number: add to tree and iteratively add next token
@interface CSToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end
@interface PUToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end
@interface PDToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end

//Token with number: add to tree and iteratively add next token
@interface FDToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end
@interface BKToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end
@interface LTToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end
@interface RTToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end

//Repeat Token: add to tree
//Second child is the block to be repeated
//Child is the other blocks
@interface REPEATToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end

//MAKE Token: Add to tree
@interface MAKEToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end

//Variable Token: Add to tree and initialize number and name
@interface VARToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end

//Variable related Tokens: Add to tree
@interface SETToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end
@interface ADDToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end
@interface SUBToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end

//WHILE Token: Add to tree
//Third Child is to check the while condition
//Second child is the block to be executed
//Child is the other blocks
@interface WHILEToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end

//Condition Tokens: Add to tree and set name
@interface EQToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end
@interface GTToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end
@interface STToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end

//"[" Token: Add to tree
@interface BGToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end

//"]" Token: Stop the tree node addition
@interface EDToken : Token
- (void) Parse: TokenList;
@end

//Number Tokens: Add to tree and set name and number
@interface NUMToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end

//STOP token: note stop
@interface STARToken : Token
- (SyntaxTreeNode*) Parse: TokenList;
@end
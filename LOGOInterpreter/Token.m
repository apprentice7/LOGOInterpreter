//
//  Token.m
//  LOGOIP
//
//  Created by Kangkai on 7/4/15.
//  Copyright (c) 2015 Kangkai. All rights reserved.
//

#import "Token.h"
#import "TokenList.h"

@implementation Token
- (SyntaxTreeNode*) Parse: TokenList{
    SyntaxTreeNode * NodeT = [[CSNode alloc]init];
    return NodeT;
}
@end

@implementation CSToken
- (SyntaxTreeNode*) Parse: TokenList{
    CSNode * CSN = [[CSNode alloc]init];
    CSN.Child = [[TokenList NextToken]Parse:TokenList];
    return CSN;
}
@end

@implementation PUToken
- (SyntaxTreeNode*) Parse: TokenList{
    PUNode * PUN = [[PUNode alloc]init];
    PUN.Child = [[TokenList NextToken]Parse:TokenList];
    return PUN;
}
@end

@implementation PDToken
- (SyntaxTreeNode*) Parse: TokenList{
    PDNode * PDN = [[PDNode alloc]init];
    PDN.Child = [[TokenList NextToken]Parse:TokenList];
    return PDN;
}
@end

@implementation FDToken
- (SyntaxTreeNode*) Parse: TokenList{
    FDNode* FDN = [[FDNode alloc]init];
    FDN.Child = [[TokenList NextToken]Parse:TokenList];
    return FDN;
}
@end

@implementation BKToken
- (SyntaxTreeNode*) Parse: TokenList{
    BKNode* BKN = [[BKNode alloc]init];
    BKN.Child = [[TokenList NextToken]Parse:TokenList];
    return BKN;
}
@end

@implementation LTToken
- (SyntaxTreeNode*) Parse: TokenList{
    LTNode* LTN = [[LTNode alloc]init];
    LTN.Child = [[TokenList NextToken]Parse:TokenList];
    return LTN;
}
@end

@implementation RTToken
- (SyntaxTreeNode*) Parse: TokenList{
    RTNode* RTN = [[RTNode alloc]init];
    RTN.Child = [[TokenList NextToken]Parse:TokenList];
    return RTN;
}
@end

@implementation REPEATToken
- (SyntaxTreeNode*) Parse: TokenList{
    REPEATNode* REPEATN = [[REPEATNode alloc]init];
    REPEATN.SecChild = [[TokenList NextToken]Parse:TokenList];
    REPEATN.Child =[[TokenList NextToken]Parse:TokenList];
    return REPEATN;
}
@end

@implementation MAKEToken
- (SyntaxTreeNode*) Parse: TokenList{
    MAKENode* MAKETN = [[MAKENode alloc]init];
    MAKETN.Child = [[TokenList NextToken]Parse:TokenList];
    return MAKETN;
}
@end

@implementation VARToken
- (SyntaxTreeNode*) Parse: TokenList{
    VARNode* VARTN = [[VARNode alloc]init];
    [VARTN SetName:self.ID];
    VARTN.Child = [[TokenList NextToken]Parse:TokenList];
    return VARTN;
}
@end

@implementation SETToken
- (SyntaxTreeNode*) Parse: TokenList{
    SETNode* SETTN = [[SETNode alloc]init];
    SETTN.Child = [[TokenList NextToken]Parse:TokenList];
    return SETTN;
}
@end

@implementation ADDToken
- (SyntaxTreeNode*) Parse: TokenList{
    ADDNode* ADDTN = [[ADDNode alloc]init];
    ADDTN.Child = [[TokenList NextToken]Parse:TokenList];
    return ADDTN;
}
@end

@implementation SUBToken
- (SyntaxTreeNode*) Parse: TokenList{
    SUBNode* SUBTN = [[SUBNode alloc]init];
    SUBTN.Child = [[TokenList NextToken]Parse:TokenList];
    return SUBTN;
}
@end

@implementation WHILEToken
- (SyntaxTreeNode*) Parse: TokenList{
    WHILENode * WHILETN = [[WHILENode alloc]init];
    WHILETN.ThirdChild = [[TokenList NextToken]Parse:TokenList];
    WHILETN.SecChild = [[TokenList NextToken]Parse:TokenList];
    WHILETN.Child = [[TokenList NextToken]Parse:TokenList];
    return WHILETN;
}
@end

@implementation EQToken
- (SyntaxTreeNode*) Parse: TokenList{
    EQNode* EQTN = [[EQNode alloc]init];
    [EQTN SetName:self.ID];
    EQTN.Child = [[TokenList NextToken]Parse:TokenList];
    return EQTN;
}
@end

@implementation GTToken
- (SyntaxTreeNode*) Parse: TokenList{
    GTNode* GTTN = [[GTNode alloc]init];
    [GTTN SetName:self.ID];
    GTTN.Child = [[TokenList NextToken]Parse:TokenList];
    return GTTN;
}
@end

@implementation STToken
- (SyntaxTreeNode*) Parse: TokenList{
    STNode* STTN = [[STNode alloc]init];
    [STTN SetName:self.ID];
    STTN.Child = [[TokenList NextToken]Parse:TokenList];
    return STTN;
}
@end

@implementation BGToken
- (SyntaxTreeNode*) Parse: TokenList{
    return [[TokenList NextToken]Parse:TokenList];
}
@end

@implementation EDToken
- (void) Parse: TokenList{
    ;
}
@end

@implementation NUMToken
- (SyntaxTreeNode*) Parse: TokenList{
    NUMNode* NUMTN = [[NUMNode alloc]init];
    [NUMTN SetNumber:self.Value];
    [NUMTN SetName:@"number"];
    NUMTN.Child = [[TokenList NextToken]Parse:TokenList];
    return NUMTN;
}
@end

@implementation STARToken
- (SyntaxTreeNode*) Parse: TokenList{
    STARNode* STARTN = [[STARNode alloc]init];
    return STARTN;
}
@end




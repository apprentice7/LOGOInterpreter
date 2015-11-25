//
//  TokenList.m
//  LOGOIP
//
//  Created by Kangkai on 7/4/15.
//  Copyright (c) 2015 Kangkai. All rights reserved.
//

#import "TokenList.h"

@implementation TokenList

- (void) Add: (NSArray*)Arr {
    NSUInteger ArrayLength = [Arr count];
    for (int i = 0; i < ArrayLength; i++) {
        if ([Arr[i] isEqualToString:@"CS"]) {
            CSToken * CSTk = [[CSToken alloc]init];
            CSTk.ID =@"CS";
            [_array addObject:CSTk];
        }
        else if ([Arr[i] isEqualToString:@"PU"]) {
            PUToken * PUTk = [[PUToken alloc]init];
            PUTk.ID = @"PU";
            [_array addObject:PUTk];
        }
        else if ([Arr[i] isEqualToString:@"PD"]) {
            PDToken * PDTk = [[PDToken alloc]init];
            PDTk.ID =@"PD";
            [_array addObject:PDTk];
        }
        else if ([Arr[i] isEqualToString:@"BK"]) {
            BKToken * BKTk = [[BKToken alloc]init];
            BKTk.ID = @"BK";
            [_array addObject:BKTk];
        }
        else if ([Arr[i] isEqualToString:@"LT"]) {
            LTToken * LTTk = [[LTToken alloc]init];
            LTTk.ID =@"LT";
            [_array addObject:LTTk];
        }
        else if ([Arr[i] isEqualToString:@"FD"]) {
            FDToken * FDTk = [[FDToken alloc]init];
            FDTk.ID = @"FD";
            [_array addObject:FDTk];
        }
        else if ([Arr[i] isEqualToString:@"RT"]) {
            RTToken * RTTk = [[RTToken alloc]init];
            RTTk.ID = @"RT";
            [_array addObject:RTTk];
        }
        else if ([Arr[i] isEqualToString:@"REPEAT"]) {
            REPEATToken * REPEATTk = [[REPEATToken alloc]init];
            REPEATTk.ID =@"REPEAT";
            [_array addObject:REPEATTk];
        }
        else if ([Arr[i] isEqualToString:@"["]) {
            STToken * STTk = [[STToken alloc]init];
            STTk.ID =@"ST";
            [_array addObject:STTk];
        }
        else if ([Arr[i] isEqualToString:@"]"]) {
            EDToken * EDTk = [[EDToken alloc]init];
            EDTk.ID = @"ED";
            [_array addObject:EDTk];
        }
        else if ([Arr[i] isEqualToString:@"MAKE"]){
            MAKEToken * MAKETk = [[MAKEToken alloc]init];
            MAKETk.ID = @"MAKE";
            [_array addObject:MAKETk];
        }
        else if ([Arr[i] isEqualToString:@"SET"]){
            SETToken * SETTk = [[SETToken alloc]init];
            SETTk.ID = @"SET";
            [_array addObject:SETTk];
        }
        else if ([Arr[i] isEqualToString:@"ADD"]){
            ADDToken * ADDTk = [[ADDToken alloc]init];
            ADDTk.ID = @"ADD";
            [_array addObject:ADDTk];
        }
        else if ([Arr[i] isEqualToString:@"SUB"]){
            SUBToken * SUBTk = [[SUBToken alloc]init];
            SUBTk.ID = @"SUB";
            [_array addObject:SUBTk];
        }
        else if ([Arr[i] isEqualToString:@"WHILE"]){
            WHILEToken * WHILETk = [[WHILEToken alloc]init];
            WHILETk.ID = @"WHILE";
            [_array addObject:WHILETk];
        }
        else if ([Arr[i] isEqualToString:@"EQ"]){
            EQToken * EQTk = [[EQToken alloc]init];
            EQTk.ID = @"EQ";
            [_array addObject:EQTk];
        }
        else if ([Arr[i] isEqualToString:@"GT"]){
            GTToken * GTTk = [[GTToken alloc]init];
            GTTk.ID = @"GT";
            [_array addObject:GTTk];
        }
        else if ([Arr[i] isEqualToString:@"ST"]){
            STToken * STTk = [[STToken alloc]init];
            STTk.ID = @"ST";
            [_array addObject:STTk];
        }
        else if ([Arr[i] isEqualToString:@"0"]){
            NUMToken * NUMTk = [[NUMToken alloc]init];
            NUMTk.Value = 0;
            [_array addObject:NUMTk];
        }
        else if ([Arr[i] integerValue] != 0){
            NUMToken * NUMTk = [[NUMToken alloc]init];
            NUMTk.Value = [Arr[i] integerValue];
            [_array addObject:NUMTk];
        }
        else if ([Arr[i] integerValue] == 0){
            VARToken * VARTk = [[VARToken alloc]init];
            VARTk.ID = Arr[i];
            [_array addObject:VARTk];
        }
        else{
            printf("Error Token\n");
        }
    }
}

- (BOOL)HasMoreTokens{
    if (_counting == _LLEN) {
        return false;
    }
    else {
        return true;
    }
}

- (Token*)NextToken{
    Token* Element = [[Token alloc]init];
    if ([self HasMoreTokens]) {
        Element =_array[_counting];
        _counting++;
        return Element;
    }
    else{
        EDToken* EDN = [[EDToken alloc]init];
        return EDN;
    }
}

- (SyntaxTreeNode*) Parse{
    SyntaxTreeNode * Node = [[SyntaxTreeNode alloc]init];
    Token* Element = [[Token alloc]init];
    Element = _array[0];
    Node = [Element Parse:self];
    return Node;
}

@end

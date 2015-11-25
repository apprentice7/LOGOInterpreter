//
//  Path.h
//  LOGOInterpreter
//
//  Created by Kangkai on 12/4/15.
//  Copyright (c) 2015 Chengpeng Qin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface Path : NSObject
@property (nonatomic, strong) NSArray * command;

//Set command value
- (void) setCommand:(NSArray *)command;

//Define the path action in GUI
- (NSBezierPath *) path;

@end

//
//  Path.m
//  LOGOInterpreter
//
//  Created by Kangkai on 12/4/15.
//  Copyright (c) 2015 Chengpeng Qin. All rights reserved.
//

#import "Path.h"

@implementation Path

- (void) setCommand:(NSArray *)command
{
    _command = command;
}

- (NSBezierPath *) path{
    NSBezierPath * paths = [[NSBezierPath alloc] init];
    
    double X = 0;
    double Y = 0;
    long currnetAngle = 90;
    int penFlag = 1;
    double PI = 3.14159265359;
    
    NSUInteger number = [_command count];
    
    //  center : (300, 200)
    [paths moveToPoint: NSMakePoint(300, 200)];
    
    for (int i = 0; i < number; i ++){
        if ([_command[i] isEqualToString:@"CS"]){
            NSPoint temp = [paths currentPoint];
            paths = [[NSBezierPath alloc] init];
            [paths moveToPoint: temp];
        }
        else if ([_command[i] isEqualToString:@"PU"]){
            penFlag = 0;
        }
        else if ([_command[i] isEqualToString:@"PD"]){
            penFlag = 1;
        }
        else if ([_command[i] isEqualToString:@"FD"]){
            NSString * num = _command[i + 1];
            NSInteger var = [num integerValue];
            i++;
            X = [paths currentPoint].x + (double)var * cos((double)currnetAngle / 180.0 * PI);
            Y = [paths currentPoint].y + (double)var * sin((double)currnetAngle / 180.0 * PI);
            if (penFlag == 0){
                [paths moveToPoint:NSMakePoint(X, Y)];
            }
            else{
                [paths lineToPoint:NSMakePoint(X, Y)];
            }
        }
        else if ([_command[i] isEqualToString:@"BK"]){
            NSString * num = _command[i + 1];
            NSInteger var = [num integerValue];
            i++;
            X = [paths currentPoint].x - (double)var * cos((double)currnetAngle / 180.0 * PI);
            Y = [paths currentPoint].y - (double)var * sin((double)currnetAngle / 180.0 * PI);
            if (penFlag == 0){
                [paths moveToPoint:NSMakePoint(X, Y)];
            }
            else{
                [paths lineToPoint:NSMakePoint(X, Y)];
            }
        }
        else if ([_command[i] isEqualToString:@"LT"]){
            NSString * num = _command[i + 1];
            NSInteger var = [num integerValue];
            i ++;
            currnetAngle = currnetAngle + var;
            currnetAngle %= 360;
            
        }
        else if ([_command[i] isEqualToString:@"RT"]){
            NSString * num = _command[i + 1];
            NSInteger var = [num integerValue];
            i++;
            currnetAngle = currnetAngle - var;
            currnetAngle %= 360;
        }
        else{
            exit(0);
        }
    }
    return paths;
}

@end



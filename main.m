//
//  main.m
//  FractionCalculator
//
//  Created by jfang19 on 9/21/18.
//  Copyright © 2018 joshuafang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FractionCalculator.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    FractionCalculator* myCalculator = [[FractionCalculator alloc] init];
    while (TRUE) {
      [myCalculator run];
    }
  }
  return 0;
}

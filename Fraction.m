//
//  Fraction.m
//  FractionCalculator
//
//  Created by jfang19 on 9/21/18.
//  Copyright © 2018 joshuafang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@implementation Fraction

-(id) initWithNumerator: (int) numerator andDenominator: (int) denominator {
  self.numerator = numerator;
  self.denominator = denominator;
  return self;
}

-(Fraction *) opposite {
  self.numerator = -self.numerator;
  [self simplify];
  return self;
}

-(Fraction *) reciprocal {
  int temp = self.numerator;
  self.numerator = self.denominator;
  self.denominator = temp;
  return self;
}

-(void) print {
  NSLog(@"%d/%d", self.numerator, self.denominator);
}

-(void) simplify {
  if (!self.numerator || !self.denominator) return;
  if (self.denominator < 0) {
    self.numerator *= -1;
    self.denominator *= -1;
  }
  // Simple GCD algorithm
  int workingNum1 = self.numerator;
  int workingNum2 = self.denominator;
  int temp;
  while (workingNum2 != 0) {
    temp = workingNum1 % workingNum2;
    workingNum1 = workingNum2;
    workingNum2 = temp;
  }
  self.numerator /= workingNum1;
  self.denominator /= workingNum1;
}

-(double) value {
  return (double) self.numerator / (double) self.denominator;
}

-(NSString *) display {
  if (!self.numerator && !self.denominator) {
    return @"";
  } else if (self.numerator && !self.denominator) {
    return [NSString stringWithFormat:@"%d", self.numerator];
  } else {
    return [NSString stringWithFormat:@"%d/%d", self.numerator, self.denominator];
  }
  return @"";
}

-(BOOL) isValid {
  return ((self.numerator == 0 || self.numerator) && self.denominator);
}

@end


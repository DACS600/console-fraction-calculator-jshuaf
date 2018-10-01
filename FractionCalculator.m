//
//  FractionCalculator.m
//  FractionCalculator
//
//  Created by jfang19 on 9/21/18.
//  Copyright © 2018 joshuafang. All rights reserved.
//

#include <stdlib.h>
#import <Foundation/Foundation.h>
#import "FractionCalculator.h"
#import "Fraction.h"

@implementation FractionCalculator

-(id) init {
  self.fraction1 = [[Fraction alloc] init];
  self.fraction2 = [[Fraction alloc] init];
  self.resultFraction = [[Fraction alloc] init];
  return self;
}

-(Fraction *) addFractions: (Fraction *) fraction1 : (Fraction *) fraction2 {
  Fraction *newFraction = [[Fraction alloc] init];
  newFraction.numerator = fraction1.numerator * fraction2.denominator + fraction1.denominator * fraction2.numerator;
  newFraction.denominator = fraction1.denominator * fraction2.denominator;
  [newFraction simplify];
  return newFraction;
}

-(Fraction *) subtractFractions: (Fraction *) fraction1 : (Fraction *) fraction2 {
  return [self addFractions:fraction1 :[fraction2 opposite]];
}

-(Fraction *) multiplyFractions: (Fraction *) fraction1 : (Fraction *) fraction2 {
  Fraction *newFraction = [[Fraction alloc] init];
  newFraction.numerator = fraction1.numerator * fraction2.numerator;
  newFraction.denominator = fraction1.denominator * fraction2.denominator;
  [newFraction simplify];
  return newFraction;
}

-(Fraction *) divideFractions: (Fraction *) fraction1 : (Fraction *) fraction2 {
  return [self multiplyFractions:fraction1 :[fraction2 reciprocal]];
}

-(NSString *) display {
  return @"";
}

-(void) run {
  [self setupCalculatorWindow];
  if (!self.fraction1.isValid) {
    [self getFirstFraction];
  }
  [self getOperation];
  [self getSecondFraction];
  [self performOperation];
  [self reset];
}

-(void) reset {
  self.fraction2 = [[Fraction alloc] init];
  self.operation = 0;
}

-(void) setupCalculatorWindow {
  system( "clear" );
  // Top bar
  NSMutableString *windowString = [[@"┌" stringByPaddingToLength:79 withString:@"─" startingAtIndex:0] mutableCopy];
  [windowString appendString:@"┐\n"];

  // Middle bar
  NSString *textString;
  textString = [NSString stringWithFormat:@"│%@ %c %@", [self.fraction1 display], (int) [self operation], [self.fraction2 display]];
  [windowString appendString:[textString stringByPaddingToLength:79 withString:@" " startingAtIndex:0]];
  [windowString appendString:@"│\n"];

  // Bottom bar
  [windowString appendString:[@"└" stringByPaddingToLength:79 withString:@"─" startingAtIndex:0]];
  [windowString appendString:@"┘\n"];

  printf("%s\n", [windowString UTF8String]);
}

-(void) getFirstFraction {
  int inputNumerator, inputDenominator;
  printf("Enter the first fraction's numerator: ");
  scanf("%i", &inputNumerator);
  self.fraction1.numerator = inputNumerator;
  [self setupCalculatorWindow];
  printf("Enter the first fraction's denominator: ");
  scanf("%i", &inputDenominator);
  self.fraction1.denominator = inputDenominator;
  [self setupCalculatorWindow];
}

-(void) getOperation {
  char operation;
  printf("Enter the operation (+, -, *, /): ");
  scanf(" %c", &operation);
  if (operation == '+') {
    self.operation = Add;
  } else if (operation == '-') {
    self.operation = Subtract;
  } else if (operation == '*') {
    self.operation = Multiply;
  } else if (operation == '/') {
    self.operation = Divide;
  } else {
    [self getOperation];
  }
  [self setupCalculatorWindow];
}

-(void) getSecondFraction {
  int inputNumerator, inputDenominator;
  printf("Enter the second fraction's numerator: ");
  scanf("%i", &inputNumerator);
  self.fraction2.numerator = inputNumerator;
  [self setupCalculatorWindow];
  printf("Enter the second fraction's denominator: ");
  scanf("%i", &inputDenominator);
  self.fraction2.denominator = inputDenominator;
  [self setupCalculatorWindow];
}

-(void) performOperation {
  switch (self.operation) {
    case Add:
      self.fraction1 = [self addFractions:self.fraction1 :self.fraction2];
      break;
    case Subtract:
      self.fraction1 = [self subtractFractions:self.fraction1 :self.fraction2];
      break;
    case Multiply:
      self.fraction1 = [self multiplyFractions:self.fraction1 :self.fraction2];
      break;
    case Divide:
      self.fraction1 = [self divideFractions:self.fraction1 :self.fraction2];
      break;
  }
}


@end

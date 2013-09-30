// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This is commercial software. Use or redistribution of this code in full
// or in part without the express written consent of Solvr is prohibited.

part of solvr_kernel_math_checker;

class SetChecker extends Checker {
  SetChecker(this.typeChecker, this.registry);

  check(Expr expr) {
    if(isEntry(expr)) {
      // only allow for dictionaries or as named arguments to methods/functions
      if(!(_inDictionary(expr) || _inFunction(expr) || _inMethod(expr))) {
        error("illegal use of entry expression $expr");
      }
    } else {
      // the rest can only be applied to set on both their left and right side
      expr.operands.forEach((Expr operand) {
        if(!isSet(operand)) {
          error("set operator ${expr.type} cannot be applied to ${operand}");
        }
      });
    }
  }

  bool _inDictionary(Expr expr) => expr.parentsAre([isDictionary]);

  bool _inFunction(Expr expr) => expr.parentsAre([isTuple, isInvoke]);

  bool _inMethod(Expr expr) => expr.parentsAre([isTuple, isMethod]);
  
  final TypeChecker typeChecker;
  final Registry registry;
}
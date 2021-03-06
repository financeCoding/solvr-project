// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_ast;

/** Sum fx. 3+2 */
class SumExpr extends NaryOperatorExpr {
  SumExpr(List<Expr> operands): super(operands, NaryOperators.SUM) {
    assert(operands.length > 1);
  }

  @override
  Expr get clone => new SumExpr(_cloneExprList(operands));
  
  @override
  visit(ExprVisitor visitor) => visitor.visitSumExpr(this);
}

SumExpr asSum(List<Expr> operands) => new SumExpr(operands);


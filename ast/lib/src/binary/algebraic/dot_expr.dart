// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_ast;

/** Expressions involving dot operator such as the 
 * - dot product [1;2;3] . [2;4;6] 
 * - method invocations [1,2,3].length() 
 **/
class DotExpr extends BinaryExpr {
  DotExpr(Expr left, Expr right): super(left, right, BinaryOperators.DOT);

  @override
  Expr get clone => asDot(left.clone, right.clone);
  
  @override
  visit(ExprVisitor visitor) => visitor.visitDotExpr(this);
}

DotExpr asDot(Expr e1, Expr e2) => new DotExpr(e1, e2);

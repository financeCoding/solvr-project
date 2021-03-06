// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_ast;

/** A return statement */
@LanguageType("Return", AreaTypes.BUILT_IN)
class ReturnExpr extends SpecialExpr {
  ReturnExpr(this.value);

  @override
  Expr map(ExprConverter converter) {
    converter(value);
    value.parent = this;
    return this;
  }

  @override
  List<Expr> get operands => [ value ];

  @override
  Expr get clone => asReturn(value.clone);
  
  @override
  visit(ExprVisitor visitor) => visitor.visitReturnExpr(this);
  
  Expr value;
}

ReturnExpr asReturn(Expr value) => new ReturnExpr(value);

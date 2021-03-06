// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_ast;

/** Represents a sequence expression such as {x in 1..10 | (x) => x^2} */
@LanguageType("Sequence", AreaTypes.BUILT_IN)
class SeqExpr extends SpecialExpr {
  SeqExpr(this.args, this.body) {
    args.map((Expr arg) => arg.parent = this);
    body.parent = this;
  }

  @override
  Expr map(ExprConverter converter) {
    _mapElements(converter, operands, this);
    return this;
  }

  @override
  List<Expr> get operands => [ args, body ];

  @override
  Expr get clone => asSeq(_cloneExprList(args), body.clone);
  
  @override
  visit(ExprVisitor visitor) => visitor.visitSeqExpr(this);
  
  List<Expr> args;
  Expr body;
}

SeqExpr asSeq(List<Expr> args, Expr body) => new SeqExpr(args, body);

// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_ast;

/** Represents a interval fx. 1..10 or 1..0.1..10 */
class IntervalExpr extends Expr {
  IntervalExpr(this.start, this.step, this.end);

  @override
  asString(StringBuffer buf) {
    start.asString(buf);
    buf.write("..");
    if(!_isNothing(step)) {
      step.asString(buf);
      buf.write("..");
    }
    end.asString(buf);
  }

  @override
  Expr map(ExprConverter converter) {
    _mapElements(converter, operands, this);
    return this;
  }
  
  @override
  List<Expr> get operands => _isNothing(step) ? [start, end] : [start, step, end];

  @override
  Expr get clone => intervalOf(start.clone, step.clone, end.clone);
  
  @override
  visit(ExprVisitor visitor) => visitor.visitIntervalExpr(this);

  @override
  final IType type = LanguageTypes.INTERVAL;
  
  bool _isNothing(Expr expr) => expr is NothingExpr;
  Expr start, step, end;
}

IntervalExpr intervalOf(Expr start, Expr step, Expr end) => new IntervalExpr(start, step, end);
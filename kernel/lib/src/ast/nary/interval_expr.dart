// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This is commercial software. Use or redistribution of this code in full
// or in part without the express written consent of Solvr is prohibited.

part of solvr_kernel_ast;

/** Represents a interval fx. 1..10 or 1..0.1..10 */
class IntervalExpr extends Expr {
  IntervalExpr(this.start, this.step, this.end);

  asString(StringBuffer buf) {
    start.asString(buf);
    buf.write("..");
    if(!_isNothing(step)) {
      step.asString(buf);
      buf.write("..");
    }
    end.asString(buf);
  }

  Expr map(ExprConverter converter) {
    _mapElements(converter, operands, this);
    return this;
  }
  
  List<Expr> get operands => _isNothing(step) ? [start, end] : [start, step, end];

  Expr get clone => intervalOf(start.clone, step.clone, end.clone);

  bool _isNothing(Expr expr) => expr is NothingExpr;
  
  final IType type = LanguageTypes.INTERVAL;
  Expr start, step, end;
}

IntervalExpr intervalOf(Expr start, Expr step, Expr end) => new IntervalExpr(start, step, end);
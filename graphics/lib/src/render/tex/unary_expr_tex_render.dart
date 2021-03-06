// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_graphics_tex_render;

class UnaryExprTexRender implements UnaryExprVisitor {
  renderFactorial(FactorialExpr expr) {
    renderExpr(expr.operand);
    add(expr.token);
  }
  
  renderNegation(NegationExpr expr) {
    add(expr.token);
    renderExpr(expr.operand);
  }
  
  renderNegative(NegativeExpr expr) {
    add(expr.token);
    renderExpr(expr.operand);
  }
}

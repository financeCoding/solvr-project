// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_ast;

/**
 * A block expression like
 *
 * {
 *   :
 * }
 */
@LanguageType("Block", AreaTypes.BUILT_IN)
class BlockExpr extends SpecialExpr {
  BlockExpr(this.operands);

  @override
  Expr map(ExprConverter converter) {
    _mapElements(converter, operands, this);
    return this;
  }

  @override
  Expr get clone => asBlock(_cloneExprList(operands));
  
  @override
  visit(ExprVisitor visitor) => visitor.visitBlockExpr(this);
  
  @override
  List<Expr> operands;
}

BlockExpr asBlock(List<Expr> content) => new BlockExpr(content);


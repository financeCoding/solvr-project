// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_ast;

/** Represents a object declaration like class MyName {} */
abstract class ObjectExpr extends Expr {
  ObjectExpr(this.type);

  @override
  final IType type;
}

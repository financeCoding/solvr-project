// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_ast;

/** N-ary expressions backed by a list */
abstract class _ListBasedCollection<T> extends CollectionExpr {
  _ListBasedCollection(this.operands, IType type): super(type) {
    operands.forEach((Expr elm) => elm.parent = this);
  }

  @override
  Expr map(ExprConverter converter) {
    _mapElements(converter, operands, this);
    return this;
  }

  List asList(dynamic converter(Expr element)) => operands.map(converter);
  
  @override
  List<T> operands;
}

/** N-ary expressions backed by a map */
abstract class _MapBasedCollection extends CollectionExpr {
  _MapBasedCollection(List<Expr> operands, this.keyMapper, IType type): super(type) {
    entries = _buildMap(operands);
  }

  @override
  Expr map(ExprConverter converter) {
    var values = operands;
    _mapElements(converter, values, this);
    entries = _buildMap(values);
    return this;
  }

  Map<String,Expr> _buildMap(List<Expr> elms) {
    var dict = new LinkedHashMap<String, Expr>();
    elms.forEach((Expr expr) {
      var key = keyMapper(expr);
      dict[key] = expr;
      expr.parent = this;
    });
    return dict;
  }

  @override
  List<Expr> get operands => new List.from(entries.values);
  
  final _KeyMapper keyMapper;
  Map<String, Expr> entries;
}

/** N-ary expressions that represents a collection */
abstract class CollectionExpr extends ObjectExpr {
  CollectionExpr(IType type): super(type);

  operator [](int index) => operands[index];

  bool contains(Expr expr) => operands.any((Expr elm) => elm == expr);

  bool every(bool f(Expr element)) => operands.every(f);

  forEach(void f(Expr element)) => operands.forEach(f);

  List mapThis(dynamic f(Expr element)) => operands.map(f);

  Expr mapThisI(dynamic f(Expr element, int index)) {
    var clone = this.clone;
    var i = 0;
    var result = clone.map((Expr operand) {
      var morphed = f(operand, i);
      i++;
      return morphed;
    });
    return result;
  }

  /** The number of ellements in this [CollectionExpr] */
  int get length => operands.length;

  bool hasSameDimension(var other) => other.length == length;
}

typedef String _KeyMapper(Expr expr);

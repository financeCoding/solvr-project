// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_types;

class BuiltinFunctions {
  static const CONSTRUCT = const FunctionType("construct", const [], LanguageTypes.NOTHING, AREA);
  static const FACTORS = const FunctionType("factors", const [InterfaceTypes.EXPRESSION, InterfaceTypes.EXPRESSION], HelperTypes.LIST_OF_EXPRESSIONS, AREA);
  static const FREE_OF = const FunctionType("freeOf", const [InterfaceTypes.EXPRESSION, InterfaceTypes.EXPRESSION], ObjectTypes.BOOL, AREA);
  static const HOLD = const FunctionType("hold", const [InterfaceTypes.EXPRESSION], InterfaceTypes.EXPRESSION, AREA);
  static const LENGTH = const FunctionType("length", const [InterfaceTypes.EXPRESSION], ObjectTypes.NUMBER, AREA);
  static const OPERAND = const FunctionType("operand", const [InterfaceTypes.EXPRESSION, ObjectTypes.NUMBER], InterfaceTypes.EXPRESSION, AREA);
  static const OPERANDS = const FunctionType("operands", const [InterfaceTypes.EXPRESSION], HelperTypes.LIST_OF_EXPRESSIONS, AREA);
  static const REPLACE = const FunctionType("replace", const [InterfaceTypes.EXPRESSION, BinaryOperators.SUBSTITUTION], InterfaceTypes.EXPRESSION, AREA);
  static const REPLACE_ALL = const FunctionType("replace", const [InterfaceTypes.EXPRESSION, HelperTypes.LIST_OF_SUBSTITUTION], InterfaceTypes.EXPRESSION, AREA);
  static const SIMPLIFY = const FunctionType("simplify", const [InterfaceTypes.EXPRESSION], InterfaceTypes.EXPRESSION, AREA);
  static const SUBSTITUTE = const FunctionType("substitute", const [InterfaceTypes.EXPRESSION, HelperTypes.SET_OF_SUBSTITUTION], InterfaceTypes.EXPRESSION, AREA);
  static const TYPE_OF = const FunctionType("typeOf", const [InterfaceTypes.EXPRESSION], ObjectTypes.SYMBOL, AREA);
  static const AreaType AREA = LanguageTypes.AREA;
}

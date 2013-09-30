// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_types;

/** Type for functions */
class FunctionType extends InvokableType {
  const FunctionType(String simpleName, List<IType> argumentTypes, IType returnType, this.area)
    : super(simpleName, argumentTypes, returnType);

  // TODO use argument types and area in name also
  String get qualifiedName => simpleName;

  final AreaType area;
}


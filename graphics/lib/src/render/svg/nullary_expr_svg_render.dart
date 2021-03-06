// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_graphics_svg_render;

class NullaryExprSvgRender implements NullaryExprVisitor {
  @override
  visitBoolExpr(BoolExpr expr) {
    
  }
  
  @override
  visitNumberExpr(NumberExpr expr) {
    
  }
  
  @override
  visitStringExpr(StringExpr expr) {
    
  }
  
  @override
  visitSymbolExpr(SymbolExpr expr) {
    
  }
 
  static final Map<String, String> _greekLowerLetters = const {
    "alpha": r"&#x3b1;",
    "beta": r"&#x3b2;",
    "gamma": r"&#x3b3;",
    "delta": r"&#x3b4;",
    "epsilon": r"&#x3b5;",
    "zeta": r"&#x3b6;",
    "eta": r"&#x3b7;",
    "theta": r"&#x3b8;",
    "iota": r"&#x3b9;",
    "kappa": r"&#x3ba;",
    "lambda": r"&#x3bb;",
    "mu": r"&#x3bc;",
    "nu": r"&#x3bd;",
    "xi": r"&#x3be;",
    "omikron": r"&#x3bf;",
    "pi": r"&#x3c0;",
    "rho": r"&#x3c1;",
    "sigma": r"&#x3c2;",
    "tau": r"&#x3c4;",
    "upsilon": r"&#x3c5;",
    "phi": r"&#x3c6;",
    "chi": r"&#x3c7;",
    "psi": r"&#x3c8;",
    "omega": r"&#x3c9;"
  };
  
  static final Map<String, String> _greekUpperLetters = const {
    "Alpha": r"&#x391;",
    "Beta": r"&#x392;",
    "Gamma": r"&#x393;",
    "Delta": r"&#x394;",
    "Epsilon": r"&#x395;",
    "Zeta": r"&#x396;",
    "Eta": r"&#x397;",
    "Theta": r"&#x398;",
    "Iota": r"&#x399;",
    "Kappa": r"&#x39a;",
    "Lambda": r"&#x39b;",
    "Mu": r"&#x39c;",
    "Nu": r"&#x39d;",
    "Xi": r"&#x39e;",
    "Omikron": r"&#x39f;",
    "Pi": r"&#x3a0;",
    "Rho": r"&#x3a1;",
    "Sigma": r"&#x3a2;",
    "Tau": r"&#x3a3;",
    "Upsilon": r"&#x3a4;",
    "Phi":  r"&#x3a5;",
    "Chi": r"&#x3a6;",
    "Psi":  r"&#x3a7;",
    "Omega":  r"&#x3a8;"
  };
}


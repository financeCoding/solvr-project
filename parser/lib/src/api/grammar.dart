// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_parser_api;

abstract class Grammar<E, P extends Parser<E,P>> {
   PrefixParselet<E,P> getPrefixParselet(TokenType type);

   InfixParselet<E,P> getInfixParselet(TokenType type);

   /** Get precedence of token. */
   int getPrecedence(Token token);
}

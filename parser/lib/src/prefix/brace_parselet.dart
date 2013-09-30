// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_parser;

/** parses braces such as those used on sets {1,2,3} and dictionaries {x:1,y:2,z:3} */
class BraceParselet implements PrefixParselet {
  Expr parse(InputParser parser, Token token) {
    _logger.debug("parsing: ${token.value}");

    var span = parser.span();
    var elements = new List();
    var asDictionary = false;

    if (!parser.lookAheadFor(TokenType.RIGHT_BRACE)) {
      do {
        Expr expr = parser.parseExpression();
        if(isEntry(expr) && !asDictionary) {
          asDictionary = true;
        }
        elements.add(expr);
      } while (parser.consumeMatch(TokenType.COMMA));
    }
    parser.consumeExpected(TokenType.RIGHT_BRACE);
    var position = span.end();

    if(asDictionary) {
      return Expr.dictionaryExpr(position, elements);
    }
    if(elements.length > 0) {
      var last = elements.last;
      if(isGuard(last)) {
        // we have a sequence like { [0..10] | x }
        elements = headSet(elements);
        elements.add(last.left);
        return Expr.seqExpr(position, elements, last.right);
      }
    }
    return Expr.setExpr(position, elements);
  }
  
  static final _logger = LoggerFactory.getLoggerFor(BraceParselet);
}

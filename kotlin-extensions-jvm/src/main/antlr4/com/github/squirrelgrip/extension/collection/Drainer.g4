grammar Drainer;

predicate: expression EOF;
expression: variable # VariableExpression
  | wildVariable # WildVariableExpression
  | literal # LiteralExpression
  | NOT expression # NotExpression
  | LPAREN expression RPAREN # ParenExpression
  | expression AND expression # AndExpression
  | expression OR expression # OrExpression;
literal: BOOLEAN;
variable: string | quotedString;
string : (ESCAPE_SEQ | QUOTED_ESCAPE_SEQ |VALID_CHAR)+;
quotedString : DOUBLE_QUOTE (QUOTED_ESCAPE_SEQ | LPAREN | RPAREN | AND | OR | NOT | VALID_CHAR | ' ')* DOUBLE_QUOTE;
wildVariable: wildString | wildQuotedString;
wildString : (ESCAPE_SEQ | QUOTED_ESCAPE_SEQ | VALID_CHAR | ASTERISK | QUESTION_MARK)+;
wildQuotedString : DOUBLE_QUOTE (QUOTED_ESCAPE_SEQ | VALID_CHAR | ASTERISK | QUESTION_MARK | ' ')+ DOUBLE_QUOTE;

BOOLEAN: 'true' | 'TRUE' | 'false' | 'FALSE';
DOUBLE_QUOTE: '"';
LPAREN: '(';
RPAREN: ')';
AND: '&';
OR: '|';
NOT: '!';
ESCAPE_SEQ : '\\' ([btnrfa()&|!?*]);
QUOTED_ESCAPE_SEQ : '\\' ([\\"]);
QUESTION_MARK: '?';
ASTERISK: '*';
VALID_CHAR: ~([\\*?"]);
WS: [ \r\n\t] + -> skip;

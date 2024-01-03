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
string : (ESCAPE_SEQ | VALID_CHAR)+;
quotedString : DOUBLE_QUOTE (ESCAPE_SEQ | VALID_CHAR | ' ')* DOUBLE_QUOTE;
wildVariable: wildString | wildQuotedString;
wildString : (ESCAPE_SEQ | VALID_CHAR | ASTERISK | QUESTION_MARK)+;
wildQuotedString : DOUBLE_QUOTE (ESCAPE_SEQ | VALID_CHAR | ASTERISK | QUESTION_MARK | ' ')+ DOUBLE_QUOTE;

BOOLEAN: 'true' | 'TRUE' | 'false' | 'FALSE';
DOUBLE_QUOTE: '"';
ESCAPE_SEQ : '\\' ([btnrfa\\"()&|!?*]);
VALID_CHAR: ~([\\()&|!?*"]);
LPAREN: '(';
RPAREN: ')';
AND: '&';
OR: '|';
NOT: '!';
QUESTION_MARK: '?';
ASTERISK: '*';
WS: [ \r\n\t] + -> skip;

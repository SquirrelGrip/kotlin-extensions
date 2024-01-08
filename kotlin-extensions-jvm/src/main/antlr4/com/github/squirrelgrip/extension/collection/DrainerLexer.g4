lexer grammar DrainerLexer;

BOOLEAN: 'true' | 'TRUE' | 'false' | 'FALSE';
QUESTION_MARK: '?';
ASTERISK: '*';
DOUBLE_QUOTE: '"' {setText("");} -> pushMode(IN_STRING);
ESCAPED_TEXT : '\\' ([\\"?*()&|!]) {setText(getText().substring(1));};
LPAREN: '(';
RPAREN: ')';
AND: '&';
OR: '|';
NOT: '!';
TEXT: ~[ \\"?*()&|!]+;
WS: [ \t\r\n]+ -> skip;

mode IN_STRING;

IN_STRING_DOUBLE_QUOTE: '"' {setText("");} -> popMode;
IN_STRING_ESCAPED_TEXT : '\\' ([\\"*?]) {setText(getText().substring(1));};
IN_STRING_WILD_TEXT: [*?];
IN_STRING_TEXT: ~[\\"*?]+;

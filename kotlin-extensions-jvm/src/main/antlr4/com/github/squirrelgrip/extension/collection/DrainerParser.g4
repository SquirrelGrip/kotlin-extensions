parser grammar DrainerParser;

options {
    tokenVocab = DrainerLexer;
}

predicate: expression EOF;

expression:
  literal # LiteralExpression
  | variable # VariableExpression
  | wildVariable # WildVariableExpression
  | NOT expression # NotExpression
  | LPAREN expression RPAREN # ParenExpression
  | expression AND expression # AndExpression
  | expression OR expression # OrExpression;

literal: BOOLEAN;

variable: (value | quotedValue);
value: (ESCAPED_TEXT | TEXT)+;
quotedValue: DOUBLE_QUOTE (IN_STRING_ESCAPED_TEXT | IN_STRING_TEXT)* IN_STRING_DOUBLE_QUOTE;

wildVariable: wildValue | wildQuotedValue;
wildValue: (ESCAPED_TEXT | TEXT | ASTERISK | QUESTION_MARK)+;
wildQuotedValue: DOUBLE_QUOTE (IN_STRING_ESCAPED_TEXT | IN_STRING_TEXT | IN_STRING_WILD_TEXT)+ IN_STRING_DOUBLE_QUOTE;
parser grammar DrainerParser;

options {
    tokenVocab = DrainerLexer;
}

predicate: expression EOF;

expression:
  literal # LiteralExpression
  | variable # VariableExpression
  | globVariable # GlobVariableExpression
  | NOT expression # NotExpression
  | LPAREN expression RPAREN # ParenExpression
  | expression AND expression # AndExpression
  | expression OR expression # OrExpression
  | expression XOR expression # XorExpression;

literal: BOOLEAN;
text: IN_STRING_ESCAPED_TEXT | IN_STRING_TEXT;
value: ESCAPED_OPERAND | VALUE;
quotedValue: DOUBLE_QUOTE text* IN_STRING_DOUBLE_QUOTE;

globChar: ASTERISK | QUESTION_MARK;
globQuotedValue: DOUBLE_QUOTE globText+ IN_STRING_DOUBLE_QUOTE;
globText: text* IN_STRING_WILD_TEXT text*;
globValue: value* globChar value*;
globVariable: globValue+ | globQuotedValue;

variable: value+ | quotedValue;

const TokenType = enum { LEFT_PAREN, RIGHT_PAREN, COMMA, DOT, MINUS, PLUS, SLASH, STAR, NOT, NOT_EQUAL, IS, EQUAL, GREATER, GREATER_EQUAL, LESS, LESS_EQUAL, IDENTIFIER, STRING, NUMBER, IF, ELSE, FUNCTION, PRINT };

const Token = struct {
    token_type: TokenType,
    lexeme: []u8,
    literal: *T,
    line: usize
};

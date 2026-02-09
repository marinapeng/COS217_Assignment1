#include <stdio.h>
#include <stdlib.h>

/*defines constants representing each state in the DFA*/
enum Statetype {NORMAL, SLASH, IN_COMMENT, COMMENT_STAR, 
    IN_STRING, STRING_ESC, IN_CHAR, CHAR_ESC};

/*Implements the NORMAL state of the DFA. c is the current
input character. Writes c to stdout if appropriate. Returns
the next DFA state. */
enum Statetype
handleNormalState (int c) {
    enum Statetype state;
    if (c == '/') {
        state = SLASH;
    }
    else if (c == '"') {
        putchar (c);
        state = IN_STRING;
    }
    else if (c == '\'') {
        putchar (c);
        state = IN_CHAR;
    }
    putchar(c);
    state = NORMAL;
    return state;
}

/*Implements the SLASH state of the DFA. c is the current
input character. A '/' has already been read and is being held. 
Determines whether a comment begins or '/' should be printed.
Writes appropriate output to stdout. Returns the next DFA state.*/
enum Statetype
handleSlashState (int c) {
    enum Statetype state;
    if (c == '*') {
        putchar (' '); /*Beginning of a comment: replace with a single space*/
        state = IN_COMMENT;
    }
    else if (c == '/') {
        putchar (c); /*Prints previous '/', holds this '/'.*/
        state = SLASH;
    }
    else if (c == '"') {
        putchar ('/');
        putchar (c);
        state = IN_STRING;
    }
    else if (c == '\'') {
        putchar ('/');
        putchar (c);
        state = IN_CHAR;
    }
    putchar ('/');
    putchar (c);
    state = NORMAL;
    return state;
}

/*Implements the IN_COMMENT state of the DFA. c is the current
input character inside a block comment. Newlines are written to
stdout to preserve line numbering. All other characters are discarded.
Returns the next DFA state.*/
enum Statetype
handleInCommentState (int c) {
    enum Statetype state;
    if (c == '*') {
        state = COMMENT_STAR;
    }
    else if (c == '\n') {
        putchar (c);
        state = IN_COMMENT;
    }
    state = IN_COMMENT;
    return state;
}

/*/*Implements the COMMENT_STAR state of the DFA. c is the current
input character after a '*' has been seen inside a block comment.
Determines whether the comment ends. Preserves new lines. Returns
the next DFA state.*/
enum Statetype
handleCommentStarState (int c) {
    enum Statetype state;
    if (c == '/') {
        state = NORMAL;
    }
    else if (c == '*') {
        state = COMMENT_STAR;
    }
    else if (c == '\n') {
        putchar (c);
        state = IN_COMMENT;
    }
    state = IN_COMMENT;
    return state;
}

/*Implements the IN_STRING state of the DFA. c is the
current character inside a string literal. Handeles
excaped characters and closing quotes. Writes output
to stdout. Returns the next DFA state.*/
enum Statetype
handleInStringState (int c) {
    enum Statetype state;
    if (c == '"') {
        putchar (c);
        state = NORMAL;
    }
    else if (c == '\\') {
        putchar (c);
        state = STRING_ESC;
    }
    putchar (c);
    state = IN_STRING;
    return state;
}

/*Implements the STRING_ESC state of the DFA. 
c are the escaped characters inside a string
literal. Writes c to stdout and returns to IN_STRING.*/
enum Statetype
handleStringEscState (int c) {
    enum Statetype state;
    putchar (c);
    state = IN_STRING;
    return state;
}

/*Implements the IN_CHAR state of the DFA. c is the
current character inside a char literal. Handeles
excaped characters and closing quotes. Writes output
to stdout. Returns the next DFA state.*/
enum Statetype
handleInCharState (int c) {
    enum Statetype state;
    if (c == '"') {
        putchar (c);
        state = NORMAL;
    }
    else if (c == '\\') {
        putchar (c);
        state = CHAR_ESC;
    }
    else if (c == '\n') {
        putchar (c);
        state = IN_CHAR;
    }
    putchar (c);
    state = IN_CHAR;
    return state;
}

/*Implements the CHAR_ESC state of the DFA. 
c are the escaped characters inside a char literal
literal. Writes c to stdout and returns to IN_CHAR.*/
enum Statetype
handleCharEscState (int c) {
    enum Statetype state;
    putchar (c);
    state = IN_CHAR;
    return state;
}

/*Determines whether the DFA state is accepting or
rejecting. Returns 1 if accepting, 0 if rejecting. 
Rejecting states correspond to being inside an
unterminated comment. */
static int isAccepting (enum Statetype s) {
    return (s != IN_COMMENT && s != COMMENT_STAR);
}

/*Reads text from stdin, removes C90 block comments,
and writes the result to stdout. Detects unterminated
comments and reports an error. Returns EXIT_SUCCESS on 
success and EXIT_FAILURE on error.*/
int main (void) {
    /*variable that keeps track of the current character*/
    int c;

    /*variable that keeps track of the current DFA state*/
    enum Statetype state = NORMAL;

    /*variables to track current line number and comment
    start line*/
    int currentLine = 1;
    int commentStartLine = 0;

    /* determines which DFA state the text sequence ends in*/
    while ((c = getchar()) != EOF) {
        if (c == '\n') {
            currentLine++;
        }
        switch (state) {
            case NORMAL:
                state = handleNormalState(c);
                break;
            case SLASH: 
                if (c == '*') {
                    commentStartLine = currentLine;
                }
                state = handleSlashState(c);
                break;
            case IN_COMMENT: 
                state = handleInCommentState(c);
                break; 
            case COMMENT_STAR:
                state = handleCommentStarState(c);
                break;
            case IN_STRING: 
                state = handleInStringState(c);
                break;     
           case STRING_ESC: 
                state = handleStringEscState(c);
                break;
            case IN_CHAR: 
                state = handleInCharState(c);
                break;
            case CHAR_ESC: 
                state = handleCharEscState(c);
                break;
        }
    }

    /* If the file ends right after a '/', print the '/'
    before exiting the program. */
    if (state == SLASH) {
        putchar('/');
    }

    /* Report unterminated comment if DFA ends in rejecting state */
    if (!isAccepting(state)) {
        fprintf(stderr, "Error: line %d: unterminated comment\n", commentStartLine);
        return EXIT_FAILURE;
    }

    /* returns EXIT_SUCCESS if the file successfully decomments*/
    return EXIT_SUCCESS;
}

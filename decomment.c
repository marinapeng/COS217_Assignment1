#include <stdio.h>
#include <stdlib.h>

/**/
enum Statetype {NORMAL, SLASH, IN_COMMENT, COMMENT_STAR, 
    IN_STRING, STRING_ESC, IN_CHAR, CHAR_ESC};

/**/
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

/**/
enum Statetype
handleSlashState (int c) {
    enum Statetype state;
    if (c == '*') {
        putchar (' ');
        state = IN_COMMENT;
    }
    else if (c == '/') {
        putchar (c);
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

/**/
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

/**/
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

/**/
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

/**/
enum Statetype
handleStringEscState (int c) {
    enum Statetype state;
    putchar (c);
    state = IN_STRING;
    return state;
}

/**/
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

/**/
enum Statetype
handleCharEscState (int c) {
    enum Statetype state;
    putchar (c);
    state = IN_CHAR;
    return state;
}

/**/
static int isAccepting (enum Statetype s) {
    return (s != IN_COMMENT && s != COMMENT_STAR);
}

/* Read text from stdin. Return 0. */
int main (void) {
    /*comment here */
    int c;

    /*comment here*/
    enum Statetype state = NORMAL;

    /**/
    int currentLine = 1;
    int commentStartLine = 0;

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
    if (state == SLASH) {
        putchar('/');
    }
    if (!isAccepting(state)) {
        printf(stderr, "Error: line %1d: unterminated comment\n", 
            commentStartLine);
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}

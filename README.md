# Logoi (λόγοι)
This is the current [2024/08-14] official source code repository for the Logoi natural programming language & hyperextensible text editor.

[What is Logoi?](https://logoi.website/)

Logoi is a minimalist superdialect of Prolog, Lisp, and JavaScript.

Logoi follows two syntax rules:
- Math: Vertical Prefix/Polish Notation (VP/PN), and
- Logic: Quinean Sentential Schemata (QSS)

# Vertical Prefix/Polish Notation (VP/PN)
```
name/value
    name
    value

name/value
    hello
    function/1
        whom
        alert
            string-append
                "Hello, "
                whom
                "!"

hello
    "World"

name/value
    celsius->fahrenheit
    function/1
        C
        +
            32
            *
                C
                /
                    9
                    5

names/value
    name1
        value1
    nameN
        valueN
    value

names/value
    Celsius
        0
    Fahrenheit
        celsius->fahrenheit
            Celsius
    alert
        string-append
            Celsius
            " degrees celsius is "
            Fahrenheit
            " degrees fahrenheit."
```

# Quinean Sentential Schemata (QSS)
```
% Socrates is a man.
; -> '{1} is a {2}.'('Socrates', 'man').

% All men are mortal.
; -> 'All {1} are {2}.'('men', 'mortal').

% The plural of man is men.
; -> 'The {1} of {2} is {3}.'('plural', 'man', 'men').

% Is Socrates mortal?
; -> 'All {1} are {2}.'(X, 'mortal'),
;    '{1} is a {2}.'('Socrates', Y),
;    'The {1} of {2} is {3}.'('plural', Y, X).
```
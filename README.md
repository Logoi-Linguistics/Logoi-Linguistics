# Logoi (λόγοι)
This is the official repository of the Logoi natural programming language & hyperextensible text editor:

[What is Logoi?](https://logoi.website/tweedle)

Logoi is a minimalist superdialect of Prolog & Lisp.

Logoi uses:
- Vertical Prefix/Polish Notation (VP/PN) notation for functional programming, and
- Quinean Sentential Schemata (QSS) for logic programming.

# Vertical Prefix/Polish Notation
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
    "World!"

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

# Quinean Sentential Schemata
```
% Socrates is a man.
; becomes:
; '{1} is a {2}.'('Socrates', 'man').

% All men are mortal.
; becomes:
; -> 'All {1} are {2}.'('men', 'mortal').

% The plural of man is men.
; becomes:
; 'The {1} of {2} is {3}.'('plural', 'man', 'men').

% Is Socrates mortal?
```
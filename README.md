# Logoi (λόγοι)
This is the current [2024/08] official source code repository for the Logoi natural programming language & hyperextensible text editor.

[What is Logoi?](https://logoi.website/)

Logoi is a minimalist superdialect of Prolog, Lisp, and JavaScript.

Logoi follows two syntax rules:
- Math: Vertical Prefix/Polish Notation (VP/PN), and
- Logic: Quinean Sentential Schemata (QSS)

# Vertical Prefix/Polish Notation (VP/PN)
```
Name/Value
    <identifier::Atom>
    <definition::Value>

Name/Value
    hello/String
    Function/1
        whom
        alert/String
            join/Strings
                "Hello, "
                whom
                "!"

hello/String
    "World"

Name/Value
    celsius->fahrenheit/Rational
    Function/1
        C
        +
            32
            *
                C
                /
                    9
                    5

Names/Value
    <name1::Atom>
        <value1::Value>
    <nameN::Atom>
        <valueN::Value>
    <value::Value>

Names/Value
    C
        0
    F
        celsius->fahrenheit/Rational
            C
    alert/String
        join/Alphanumerics
            C
            " degrees celsius is "
            F
            " degrees fahrenheit."

if/yes/no
    <conditional::Boolean>
    <response::Value>
    <alternative::Value

Name/Value
    Socrates-is-a-man.
    true

if/yes/no
    Socrates-is-a-man.
    alert/String
        "Socrates is a featherless biped."
    alert/String
        "Socrates is not mortal."

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

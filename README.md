# Logoi (λόγοι)
This is the current [2024/08] official source code repository for the Logoi natural programming language & hyperextensible text editor.

[What is Logoi?](https://logoi.website/)

λόγοι is the Greek word for "words".

Logoi is: 1) a minimalist superdialect of Prolog, Lisp & JavaScript, and 2) a mouseless web editor of itself.

Logoi follows two syntax rules:
- Math = Vertical Prefix/Polish Notation (VP/PN)
- Logic = Quinean Sentential Schemata (QSS)

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
    <alternative::Value>

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

; English is only one of many other possible languages:

% Sokrato estas viro.
; -> '{1} estas {2}.'('Sokrato', 'viro').

% Ĉiuj viroj estas mortemaj.
; -> 'Ĉiuj {1} estas {2}.'('viroj', 'mortemaj').

% Ĉu Sokrato estas mortema?
; -> 'Ĉiuj {1} estas {2}.'(X, 'mortemaj'),
;    '{1} estas {2}.'('Socrates', Y),
;    '{1} = {2} + {3}.'(X, Y, 'j').
```

[https://en.wikipedia.org/wiki/Denying_the_antecedent](https://en.wikipedia.org/wiki/Denying_the_antecedent)

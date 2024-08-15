# Logoi (λόγοι)
This is the current [2024/08] official source code repository for the Logoi natural programming language & hyperextensible text editor.

[What is Logoi?](https://logoi.website/)

λόγοι is the Greek word for "words".

Logoi is: 1) a minimalist superdialect of Prolog, Lisp & JavaScript, and 2) a mouseless web editor of itself.

Logoi follows two syntax rules:
- Math = Vertical Polish/Prefix Notation/Lisp (VP/PN/L)
- Logic = Quinean Sentential Schemata (QSS)

# Vertical Polish/Prefix Notation/Lisp (VP/PN/L)
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
    <truth-case::Expression>
    <false-case::Expression>

Name/Value
    Socrates-is-a-man.
    equal?/Natural/Natural
        0
        0

if/yes/no
    Socrates-is-a-man.
    alert/String
        "Socrates is a featherless biped."
    alert/String
        "Socrates is not mortal."

```
[[Denying the Antecedent](https://en.wikipedia.org/wiki/Denying_the_antecedent)]

# Quinean Sentential Schemata (QSS)
```

% λόγοι is the Greek word for "words".
; -> '{1} is the {2} word for \"{3}\".'('λόγοι', 'Greek', 'words').

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
English is only one of many other spoken languages on the roadmap:
```

% Sokrato estas viro.
; -> '{1} estas {2}.'('Sokrato', 'viro').

% Ĉiuj viroj estas mortemaj.
; -> 'Ĉiuj {1} estas {2}.'('viroj', 'mortemaj').

% Ĉu Sokrato estas mortema?
; -> 'Ĉiuj {1} estas {2}.'(X, 'mortemaj'),
;    '{1} estas {2}.'('Socrates', Y),
;    '{1} = {2} + {3}.'(X, Y, 'j').

```
[[List of Languages by Total Number of Speakers](https://en.wikipedia.org/wiki/List_of_languages_by_total_number_of_speakers)]

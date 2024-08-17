# Logoi (λόγοι)

This is the current* official source code repository for the Logoi natural programming language & hyperextensible text editor. *[2024/08]

[What is Logoi?](https://logoi.website/tweedle/)

λόγοι is the Greek word for "words".

Logoi is: 1) a minimalist superdialect of Prolog, Lisp & JavaScript, and 2) a mouseless web editor of itself.

Logoi follows two syntax rules:

- Math = Vertical Polish/Prefix Notation/Lisp (VP/PN/L)
- Logic = Quinean Sentential Schemata (QSS)

# Vertical Polish/Prefix Notation/Lisp (VP/PN/L)
```

;
; Abstraction Operators, Abstracted
;

Name/Value
    <name::Atom>
    <value::Expression>

Names/Value
    <name1::Atom>
        <value1::Expression>
    <nameN::Atom>
        <valueN::Expression>
    <value::Expression>

Function/1
    <parameter1::Atom>
    <body::Expression>

Function/2
    <parameter1::Atom>
    <parameter2::Atom>
    <body::Expression>

;
; hello/String is the name of a Function/1
;

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

;
; celsius->fahrenheit/Rational is the name of a Function/1
;

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

alert/String
    join/Alphanumerics
        "0 degrees Celsius is "
        celsius->fahrenheit/Rational
            0
        " degrees Fahrenheit."

;
; Conditional Branching
;

if/yes/no
    <conditional::Boolean>
    <truth-case::Expression>
    <false-case::Expression>

Name/Value
    equal?/Natural/Natural
    Function/2
        X
        Y
        =
            0
            -
                X
                Y

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
```

;
; "Let-Scope" Bindings
;

Names/Value
    C
        0
    F
        celsius->fahrenheit/Rational
            C
    alert/String
        join/Strings
            string/Rational
                C
            " degrees celsius is "
            string/Rational
                F
            " degrees fahrenheit."

;
; HTML Element Constructors
;

Name/Value
    <element/tag>
    Function/1
        tag
        document.createElement
            tag

Name/Value
    <div>
    <element/tag>
        "div"

Name/Value
    <div/content>
    Function/1
        content
        .innerHTML
            <div>
            content

Name/Value
    <div/id/content>
    Function/2
        id
        content
        .setAttribute
            <div/content>
                content
            "id"
            id

document.append/Element
    <div/id/content>
        "selected"
        <div/content>
            42

```
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
English is but one of many other spoken languages on the roadmap:
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
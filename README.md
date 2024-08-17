# Logoi (λόγοι)

[Logoi Logo]

```

;
; "Hello, World!", Abstracted:
;

Name/Value
    hello/String
    Function
        parameter
        Function
            Function
                parameter
                parameter
                parameter

```

This is the current* official source code repository for the Logoi natural programming language & hyperextensible text editor. *[2024/08]

[What is Logoi?](https://logoi.website/tweedle)

λόγοι is the Greek word for "words".

Logoi is: 1) a minimalist superdialect of Prolog, Lisp & JavaScript, and 2) a mouseless web editor of itself.

Logoi follows two syntax rules:

- Math = Vertical Polish/Prefix Notation/Lisp (VP/PN/L)
- Logic = Quinean Sentential Schemata (QSS)

# Vertical Polish/Prefix Notation/Lisp (VP/PN/L)

```

; Logoi; or, "A Universal (Human) Grammar for Commentary Mathematical, Logical & Editorial"

;
; "In a given line of Logoi, the semicolon (;) marks a possible discontinuity between its logical and extralogical semantics."
; Translation: Editorial commentary begins with a semicolon (;).
;

%
% "In a given line of Logoi, the percentile (%) marks a possible discontinuity between the lambda and the predicate calculi."
% Translation: Logical commentary begins with a percentile (%).
%

;
; Logoi Semiotic Precedence
;

; This is ignored.

This is an experimental short-form macro syntax; approach with caution.

This-is-translated-to-lisp.

This-is-translated-to-lisp. ; This is ignored.

this-is-evaluated. ; This is ignored. % This is ignored.
this-is-evaluated. % This is translated. ; This is ignored.

;
; "Hello, World!", Implemented:
;
; hello/String is a Function that takes a String.
;

hello/String
    "World"

; Abridged

Name/Value
    hello/String
    Function/1
        whom
        alert/String
            join/Strings
                "Hello, "
                whom
                "!"

; Unabridged

Name/Value ; `"Name/Value" is a MetaMetaFunction that takes a Name and a Value.`
    hello/String ; `"hello" is a Function that takes a String.`
    Function/1 ; `"Function/1" is a MetaFunction that takes one Parameter.`
        whom ; `"whom" is a Parameter::X, where X = #TypeSignatureIndex#.`
        alert/String ; `"alert" is a Function that takes a String.`
            join/Strings ; `"join" is a Function that takes a List of Strings.`
                "Hello, " ; `"Hello, " is a Constant::String.`
                whom ; `"whom" is a Parameter::X, where X = #TypeSignatureIndex#.`
                "!" ; `"!" is a Constant::String.`

hello/String    ; `"hello" is a Function that takes a String.`
    "World"     ; `"!"` is a constant of type String.`

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
    
if/yes/no
    <conditional::BooleanExpression>
    <truth-case::Expression>
    <false-case::Expression>
    
try/catch/else/finally
    <attempt::Expression>
    <error1::ErrorType>
        <handler1::Expression>
    <errorN::ErrorType>
        <handlerN::Expression>
    <if-no-error::Expression>
    <all-cases::Expression>

;
; Typographical Note
;
; When using English words:
;  - Types are Capitalized
;  - instances of types are not capitalized
;

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
; Note: For concision, <html/functions> assume <parameter::String|s> unless typed/Explicitly/Otherwise.
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

Name/Value
    document.append/<Element>
    Function/1
        <Element>
        document.append
            <Element>

;
; Error Handling
;

try/catch/else/finally
    document.append/<Element>
        <div/id/content>
            "selected"
            <div/content>
                42
    TypeError
        console.log
            "Null <Element> encountered?"
    Error
        console.log
            "Something, somewhere, is broken."
    console.log
        "<Element> successfully added to document."
    alert
        "document.append/<Element> has completed another iteration."


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
# Logoi (λόγοι)

<a target="_blank" href="https://logoi.website/tutorial/"><img src="./static/images/logoi-logo-rectangle.jpg" width="250" /></a>

<em>"The principal difficult[y to overcome in designing a universal language is t]o render the study of the language so easy as to make its acquisition mere play to the learner."</em>

- <a target="_blank" href="https://shawnomancy.com/wp-content/uploads/2019/03/Unua-Libro.pdf">Dr. Esperanto's International Language, Introduction & Complete Grammar por Angloj</a>

<hr>

This is the current* "source code repository" for the Logoi:
- natural programming language, and
- hyperextensible text editor.

*(2024/08)

<hr>

[What is Logoi?](https://logoi.website/tweedle)

<b>λόγοι</b> is the Greek word for "words".

<b>Logoi</b> is both a:
- *minimalist superdialect* (of JavaScript/Prolog/Lisp), and a
- *mouseless editor* (of itself, in itself, and, eventually, by itself)
at once.

```

;
; "Hello, World!", Abstracted
;

MetaFunction/2
    hello/String
    MetaFunction/1
        Variable
        Function/1
            Function/N
                Constant
                Variable
                Constant

hello/String
    String
; -> BrowserEvent

%
% '{1} is a {2} for {3}.'('Prolog', 'template', 'sentences').
%

% λόγοι is the Greek word for "words".

% Socrates is a man.
% All men are mortal.
% The plural of man is men.

% Is Socrates mortal?
; -> "Yes."

```

# Linguistic Preliminaries

Logoi was inspired by a dream of turning spoken languages into functional/logic programming languages.

Logoi is the curious offspring of many months spent blissfully contemplating the written works by <a target="_blank" href="https://en.wikipedia.org/wiki/Alonzo_Church">Church</a> & <a target="_blank" href="https://en.wikipedia.org/wiki/Willard_Van_Orman_Quine">Quine</a>:
1. Removing the parentheses from Lisp has proven to improve upon the readability of Lisp.
2. Removing the Prolog from Prolog has proven to improve upon the readability of Prolog.

A JavaScript/browser implementation improves upon the installation processes of both.

Logoi file formatting follows two distinct aesthetic dicta:

- Math = "Vertical/Parenless" [Polish/Prefix Notation](https://en.wikipedia.org/wiki/Polish_notation)/Lisp (V/PP/PN/L)
- Logic = Quinean Sentential Schemata (QSS)

% Humor, being extralogical, is precluded *a priori*.

# "Vertical/Parenless" Polish/Prefix Notation/Lisp (V/PP/PN/L)

```

;
; Logoi; or,
; "A Universal (Human) Grammar for Commentary Mathematical, Logical & Editorial"
;

;
; In a given line of Logoi,
;   the semicolon (;) marks
;   a potential discontinuity between
;   logical and extralogical semantics.
;
; Translation: Editorial commentary begins with a semicolon (;).
;

%
% In a given line of Logoi,
%   the percentile (%) marks
%   a potential discontinuity between
%   the lambda and predicate calculi.
%
% Translation: Logical commentary begins with a percentile (%).
%

;
; Operational (;/%) Precedences (For Human Eyes Only!)
;

; This sentence is ignored. ; (Editorial)

% This sentence is translated to Prolog. ; (Logical)

This-is-translated-to-Lisp. ; (Mathematical)

;
; Operational (;/%) Precedences (For Human Eyes Only!)
;

; This sentence is ignored. % This sentence is ignored. This-sentence-is-ignored.
; This sentence is ignored. This-sentence-is-ignored. % This sentence is ignored.

% Prolog:

% This sentence is translated to Prolog.
%   This sentence is translated to Prolog.
%   This sentence is translated to Prolog.
%       This sentence is translated to Prolog.
%   This sentence is translated to Prolog. This sentence is translated to Prolog.

% This sentence is translated to Prolog. ; This sentence is ignored.
% This sentence is translated to Prolog. ; This sentence is ignored. This-is-ignored.
% This sentence is translated to Prolog. ; This sentence is ignored. % This sentence is ignored.
% This sentence is translated to Prolog. This sentence is translated to Prolog. ; This sentence is ignored.
% This sentence is translated to Prolog. This-is-translated-to-Lisp. ; This sentence is ignored.

This-sentence-is-translated-to-Lisp. ; This sentence is ignored.
This-sentence-is-translated-to-Lisp. ; This sentence is ignored. % This sentence is ignored.
This-sentence-is-translated-to-Lisp. ; This sentence is ignored. This-sentence-is-ignored.
This-sentence-is-translated-to-Lisp. % This sentence is translated to Prolog. ; This sentence is ignored.
This-sentence-is-translated-to-Lisp. This-sentence-causes-a-formatting-error. ; (Only one Atom per line)

;
; "Hello, World!", Defined
;

; Abridged:

Name/Value
    hello!/String
    Function/1
        whom
        alert!/String
            join/Strings
                "Hello, "
                whom
                "!"

hello!/String
    "World"

; Unabridged:

Name/Value                  ; Name/Value is a MetaFunction of arity: 2.
    hello!/String           ; hello! is an ImpureFunction of domain: String.
    Function/1              ; Function/1 is a MetaFunction of arity: 1.
        whom                ; whom is a Parameter::X, where: X = #TypeSignatureIndex#.
        alert!/String       ; alert! is an ImpureFunction of domain: String.
            join/Strings    ; join is a VariadicFunction of domain: Strings.
                "Hello, "   ; "Hello, " is a Constant::String.
                whom        ; whom is a Parameter::??, where: ?? = #TypeSignatureIndex#.
                "!"         ; "!" is a Constant::Character. (Character is a subset of String)

hello!/String   ; hello! is an ImpureFunction of domain: String.
    "World"     ; "World" is a Constant::Word. (Word is a subset of String)
; -> "Hello, World!" (BrowserAlert)

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
; 'celsius->fahrenheit/Rational'
; is a Function that converts a temperature from Celsius to Fahrenheit.
;

; Abridged:

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

celsius->fahrenheit/Rational
    100

; Unabridged:

Name/Value                          ; Name/Value is a MetaFunction of arity: 2.
    celsius->fahrenheit/Rational    ; celsius->fahrenheit is a Function of domain: Rational.
    Function/1                      ; Function/1 is a MetaFunction of arity: 1.
        C                           ; C is a Parameter::??, where: ?? = #TypeSignatureIndex#.
        +                           ; + is a VariadicFunction of domain: Numbers.
            32                      ; 32 is a Constant::Even
            *                       ; * is a VariadicFunction of domain: Numbers.
                C                   ; C is a Parameter::??, where: ?? = #TypeSignatureIndex#.
                /                   ; / is a VariadicFunction of domain: Numbers? (with exceptions)
                    9               ; 9 is a Constant::Odd
                    5               ; 5 is a Constant::Prime

celsius->fahrenheit/Rational    ; celsius->fahrenheit is a Function of domain: Rational.
    100                         ; 100 is a Constant::Even
; -> 212

;
; 'alert!/String'
; is an ImpureFunction that displays a String in the browser's popup/dialogue box.
;

alert!/String
    join/Alphanumerics
        "0 degrees Celsius is "
        celsius->fahrenheit/Rational
            0
        " degrees Fahrenheit."
; -> "0 degrees Celsius is 32 degrees Fahrenehit." (BrowserAlert)

;
; 'equal?/Whole/Whole'
; is a Function that determines the equality of two Whole numbers.
;

Name/Value
    equal?/Whole/Whole
    Function/2
        X
        Y
        =
            0
            -
                X
                Y

equal?/Whole/Whole
    1
    2
; -> false

;
; 'Socrates-is-a-man.'
; is a Boolean derived from the equality of 0 and 0.
;

Name/Value
    Socrates-is-a-man.
    equal?/Whole/Whole
        0
        0

if/yes/no
    Socrates-is-a-man.
    console.log!/String
        "Socrates is a featherless biped."
    console.log!/String
        "Socrates is not mortal."
; -> "Socrates is a featherless biped." (BrowserAlert)

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
    alert!/String
        join/Strings
            string/Rational
                C
            " degrees Celsius is "
            string/Rational
                F
            " degrees Fahrenheit."
; -> "0 degrees Celsius is 32 degrees Fahrenheit." (BrowserAlert)

;
; HTML Element Constructors
;

Name/Value
    <element/tag::String>
    Function/1
        tag
        document.createElement
            tag

Name/Value
    <div>
    <element/tag::String>
        "div"

Name/Value
    <div/content::Element>
    Function/1
        content
        .innerHTML
            <div>
            content

Name/Value
    <div/id::String/content::Element>
    Function/2
        id
        content
        .setAttribute
            <div/content::Element>
                content
            "id"
            id

Name/Value
    document.append/Element
    Function/1
        <element>
        document.append
            <element>

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
        console.log!/String
            "Null <Element> encountered?"
    Error
        console.log!/String
            "Something, somewhere, is broken."
    console.log!/String
        "<Element> successfully added to document."
    alert!
        "document.append/<Element> completed another iteration, for better or worse."
; -> DOM-Event

```

# Quinean Sentential Schemata (QSS)

```

% Prolog is a template for sentences.
; -> '{1} is a {2} for {3}.'('Prolog', 'template', 'sentences').

% λόγοι is the Greek word for "words".
; -> '{1} is the {2} word for "{3}".'('λόγοι', 'Greek', 'words').

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
[[Existentialization](https://en.wikipedia.org/wiki/Existential_quantification)]

English is but one of [many other languages on the roadmap](https://en.wikipedia.org/wiki/List_of_languages_by_total_number_of_speakers):
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
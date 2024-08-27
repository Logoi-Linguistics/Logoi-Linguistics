# Logoi (λόγοι)

Logoi = Prolog ∧ Lisp

<a target="_blank" href="https://logoi.website/tutorial/"><img src="./static/images/logoi-logo-rectangle.jpg" width="250" /></a>

<em>"The principal difficulty to overcome in designing a universal language is to render the study of the language so easy as to make its acquisition mere play to the learner."</em>

- <a target="_blank" href="https://shawnomancy.com/wp-content/uploads/2019/03/Unua-Libro.pdf">Dr. Esperanto's International Language, Introduction & Complete Grammar por Angloj</a>

<hr>

This is the current* "source code repository" for the Logoi:
- natural programming language, and
- hyperextensible text editor.

*(2024/08)

Roadmap of Human Dialects:
- JavaScript (Browser)
- Prolog (Done)
- Lisp (Done)
- HTML (Done)
- CSS (Done)
- English (Done)
- Esperanto (Done)
- Español ()
- Deutsch ()
- ελληνικά ()
- Latinum ()
- Dansk ()
- 汉语 ()
- 日本語 ()

<hr>

[What is Logoi?](https://logoi.website/tweedle)

<b>λόγοι</b> is the Greek word for "words".

<b>Logoi</b> is a:
- *minimalist superdialect* (of JavaScript/Prolog/Lisp) and
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

% Daedalus was the father of Icarus.

% Socrates was ugly.

% Socrates is a man.
% All men are mortal.
% The plural of man is men.

% Is Socrates mortal?
; -> yes

```

# Linguistic Preliminaries

Logoi was inspired by a daydream about using spoken languages as logic/functional programming languages.

Logoi is the curious offspring of many months spent blissfully contemplating the written works by <a target="_blank" href="https://plato.stanford.edu/entries/church/">Church</a> & <a target="_blank" href="https://plato.stanford.edu/entries/quine/">Quine</a>:
1. Removing the parentheses from Lisp has proven to improve upon the readability of Lisp.
2. Removing the Prolog from Prolog has proven to improve upon the readability of Prolog.
3. A JavaScript/WebAssembly editor implementation provides (near) instant access to a REPL, CLI, and IDE.

Logoi file formatting follows two distinct aesthetic dicta:

- Math: "Vertical/Parenless" [Polish/Prefix Notation](https://en.wikipedia.org/wiki/Polish_notation)/Lisp (V/PP/PN/L)
- Logic: Quinean Sentential Schemata (QSS)
- Humor: being extralogical, is precluded *a priori*.

# Math: "Vertical/Parenless" Polish/Prefix Notation/Lisp (V/PP/PN/L) [Newtonian]

```

;
; Logoi; or,
; "A Universal (Human) Grammar for Commentary Logical, Mathematical & Editorial"
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
; Operators, Exemplified
;

; This is ignored. ; (Editorial)

% This is translated to Prolog. ; (Logical)

This-is-translated-to-Lisp. ; (Mathematical)

;
; Operator Precedences, Exemplified
;

; Editorial:

; This sentence is ignored. % This sentence is ignored. This-sentence-is-ignored.

; This sentence is ignored. This-sentence-is-ignored. % This sentence is ignored.

; Logical:

% This sentence is translated to Prolog. ; This sentence is ignored.
%   This sentence is translated to Prolog.
%   This sentence is translated to Prolog. ; This sentence is ignored.
%       This sentence is translated to Prolog.
%   This sentence is translated to Prolog. This sentence is translated to Prolog.

% This sentence is translated to Prolog. ; This sentence is ignored.
% This sentence is translated to Prolog. ; This sentence is ignored. This-is-ignored.
% This sentence is translated to Prolog. ; This sentence is ignored. % This sentence is ignored.
% This sentence is translated to Prolog. This sentence is translated to Prolog. ; This sentence is ignored.
% This sentence is translated to Prolog. This-is-translated-to-Prolog. ; This sentence is ignored.

; Mathematical:

This-is-translated-to-Lisp. ; This sentence is ignored.
    This-is-translated-to-Lisp.
    This-is-translated-to-Lisp. % This sentence is translated to Prolog.
        This-is-translated-to-Lisp.
            This-is-translated-to-Lisp. ; This sentence is ignored.

This-is-translated-to-Lisp. ; This sentence is ignored. This-is-ignored.
This-is-translated-to-Lisp. ; This sentence is ignored. % This sentence is ignored.
This-is-translated-to-Lisp. % This sentence is translated to Prolog. ; This sentence is ignored.
This-is-translated-to-Lisp. This-causes-a-formatting-error. ; (1 Atom per Line)

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
; -> "Hello, World!" (BrowserAlert)

; Unabridged:

Name/Value                  ; Name/Value is a MetaFunction of arity: 2.
    hello!/String           ; hello! is an ImpureFunction of domain: String.
    Function/1              ; Function/1 is a MetaFunction of arity: 1.
        whom                ; whom is a Parameter::??, where: ?? = #TypeSignatureIndex#.
        alert!/String       ; alert! is an ImpureFunction of domain: String.
            join/Strings    ; join is a VariadicFunction of domain: Strings.
                "Hello, "   ; "Hello, " is a Constant::String.
                whom        ; whom is a Parameter::??, where: ?? = #TypeSignatureIndex#.
                "!"         ; "!" is a Constant::Character::String.

hello!/String   ; hello! is an ImpureFunction of domain: String.
    "World"     ; "World" is a Constant::Word::String.
; -> "Hello, World!" (BrowserAlert)

;
; Abstraction Operators, Abstracted
;

Name/Value
    {name::Atom}
    {value::Expression}

Names/Value
    {name1::Atom}
        {value1::Expression}
    {nameN::Atom}
        {valueN::Expression}
    {value::Expression}

Function/1
    {parameter1::Atom}
    {body::Expression}

Function/2
    {parameter1::Atom}
    {parameter2::Atom}
    {body::Expression}

if/true/false
    {conditional::BooleanExpression}
    {truth-case::Expression}
    {false-case::Expression}
    
if/yes/no
    {conditional::BooleanExpression}
    {truth-case::Expression}
    {false-case::Expression}
    
try/catch/else/finally
    {attempt::Expression}
    {error1::ErrorType}
        {handler1::Expression}
    {errorN::ErrorType}
        {handlerN::Expression}
    {no-error::Expression}
    {all-cases::Expression}

;
; celsius->fahrenheit/Rational
; is a Function that converts a Rational temperature from Celsius to Fahrenheit.
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
; -> 212

; Unabridged:

Name/Value                          ; Name/Value is a MetaFunction of arity: 2.
    celsius->fahrenheit/Rational    ; celsius->fahrenheit is a Function of domain: Rational.
    Function/1                      ; Function/1 is a MetaFunction of arity: 1.
        C                           ; C is a Parameter::??, where: ?? = #TypeSignatureIndex#.
        +                           ; + is a VariadicFunction of domain: Numbers.
            32                      ; 32 is a Constant::Even::Whole
            *                       ; * is a VariadicFunction of domain: Numbers.
                C                   ; C is a Parameter::??, where: ?? = #TypeSignatureIndex#.
                /                   ; / is a VariadicFunction of domain: Numbers? (with exceptions)
                    9               ; 9 is a Constant::Odd::Whole
                    5               ; 5 is a Constant::Prime::Whole

celsius->fahrenheit/Rational    ; celsius->fahrenheit is a Function of domain: Rational.
    100                         ; 100 is a Constant::Even
; -> 212

;
; alert!/String
; is an ImpureFunction/1 that displays a String in the browser's popup/alert/dialogue box.
;

alert!/String
    join/Alphanumerics
        "0 degrees Celsius is "
        celsius->fahrenheit/Rational
            0
        " degrees Fahrenheit."
; -> "0 degrees Celsius is 32 degrees Fahrenehit." (BrowserAlert)

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
; equal?/Whole/Whole
; is a Function/2 that determines the equality of two Whole numbers.
;

Name/Value
    equal?/Whole/Whole
    Function/2
        X
        Y
        Names/Value
            difference
                -
                    X ; Minuend
                    Y ; Subtrahend
            not/Boolean
                or/Booleans
                    positive?/Integer
                        difference
                    negative?/Integer
                        difference

equal?/Whole/Whole
    1
    2
; -> false

;
; Socrates-is-a-man.
; is a Boolean value derived from the equality of 0 and 0.
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
; HTML Element Constructors
;

Name/Value
    <element/tag::String>
    Function/1
        tag
        document.createElement/String
            tag

Name/Value
    <div>
    <element/tag::String>
        "div"

Name/Value
    <div/Content>
    Function/1
        content
        .innerHTML/Element/Content
            <div>
            content

Name/Value
    <div/id::String/Content>
    Function/2
        id
        content
        .setAttribute/Element/String/String
            <div/Content>
                content
            "id"
            id

Name/Value
    document.append/Element
    Function/1
        <element>
        document.append/Element
            <element>

;
; Error Handling
;

try/catch/else/finally
    document.append/Element
        <div/id::String/Content>
            "selected"
            <div/Content>
                42
    TypeError
        console.log!/String
            "Null <Element> encountered?"
    Error
        console.log!/String
            "Something, somewhere, is broken."
    console.log!/String
        "<Element> successfully added to document."
    alert!/String
        "document.append/<Element> completed another iteration, for better or worse."
; -> DOM-Event

```

# Logic: Quinean Sentential Schemata (QSS) [Quantum]

The logic programming paradigm has long been shrouded by dint of a daunting syntax.

In response to this puzzle pedagogical, Logoi translates logical sentences into Prolog code for you:

```

% Prolog is a template for sentences.
; -> '{1} is a {2} for {3}.'('Prolog', 'template', 'sentences').

% λόγοι is the Greek word for "words".
; -> '{1} is the {2} word for "{3}".'('λόγοι', 'Greek', 'words').

% Daedalus was the father of Icarus.
; -> '{1} was the {2} of {3}.'('Daedalus', 'father', 'Icarus').

% Socrates is a man.
; -> '{1} is a {2}.'('Socrates', 'man').

% All men are mortal.
; -> 'All {1} are {2}.'('men', 'mortal').

% The plural of man is men.
; -> 'The {1} of {2} is {3}.'('plural', 'man', 'men').

% Is Socrates mortal?
; -> 'All {1} are {2}.'(Y, 'mortal'),
;    '{1} is a {2}.'('Socrates', X),
;    'The {1} of {2} is {3}.'('plural', X, Y).
; -> yes

```
[[Existentialization](https://en.wikipedia.org/wiki/Existential_quantification)]

English is but one of [many other languages on the roadmap](https://en.wikipedia.org/wiki/List_of_languages_by_total_number_of_speakers):
```

;
; Esperanto
;

% Prologo estas ŝablono por frazoj.
; -> '{1} estas {2} por {3}.'('Prologo', 'ŝablono', 'frazoj').

% "λόγοι" estas la greka vorto por "vortoj".
; -> '"{1}" estas la {2} vorto por "{3}".'('λόγοι', 'greka', 'vortoj').

% Dedalo estis la patro de Ikaro.
; -> '{1} estis la {2} de {3}.'('Dedalo', 'patro', 'Ikaro').

% Sokrato estas viro.
; -> '{1} estas {2}.'('Sokrato', 'viro').

% Ĉiuj viroj estas mortemaj.
; -> 'Ĉiuj {1} estas {2}.'('viroj', 'mortemaj').

% Ĉu Sokrato estas mortema?
; -> 'Ĉiuj {1} estas {2}.'(Y, 'mortemaj'),
;    '{1} estas {2}.'('Socrates', X),
;    '{1} = {2} + {3}.'(Y, X, 'j').
; -> jes

;
; Español
;

% Prolog es una plantilla para oraciones.
; -> '{1} es una {2} para {3}.'('Prolog', 'plantilla', 'oraciones').

% "λόγοι" es la palabra griega que significa "palabras".
; -> '"{1}" es la palabra {2} que significa "{3}".'('λόγοι', 'griega', 'palabras').

% Dédalo fue el padre de Ícaro.
; -> '{1} fue el {2} de {3}.'('Dédalo', 'padre', 'Ícaro').

% Sócrates es un hombre.
; -> '{1} es un {2}.'('Sócrates', 'hombre').

% Todos los hombres son mortales.
; -> 'Todos los {1} son {2}.'('hombres', 'mortales').

% El plural de hombre es hombres.
; -> 'El {1} de {2} es {3}.'('plural', 'hombre', 'hombres').

% ¿Es Sócrates mortal?
; -> 'Todos los {1} son {2}.'(Y, 'mortales'),
;    '{1} es un {2}.'('Sócrates', X),
;    'El {1} de {2} es {3}.'('plural', X, Y).
; -> sí

;
; Deutsch
;

% Prolog ist eine Vorlage für Sätze.
; -> '{1} ist eine {2} für {3}.'('Prolog', 'Vorlage', 'Sätze').

% „λόγοι“ ist das griechische Wort für „Worte“.
; -> '„{1}“ ist das {2} Wort für „{3}“.'('λόγοι', 'griechische', 'Worte').

% Daedalus war der Vater von Ikarus.
; -> '{1} war der {2} von {3}.'('Daedalus', 'Vater', 'Ikarus').

% Sokrates ist ein Mann.
; -> '{1} ist ein {2}.'('Sokrates', 'Mann').

% Alle Menschen sind sterblich.
; -> 'Alle {1} sind {2}.'('Menschen', 'sterblich').

% Der Plural von Mann ist Menschen.
; -> 'Der {1} von {2} ist {3}.'('Plural', 'Mann', 'Menschen').

% Ist Sokrates sterblich?
; -> 'Alle {1} sind {2}.'(Y, 'sterblich'),
;    '{1} ist ein {2}.'('Sokrates', X),
;    'Der {1} von {2} ist {3}.'('Plural', X, Y).
; -> ja

;
; ελληνικά
;

% Το Prolog είναι ένα πρότυπο για προτάσεις.
; -> 'Το {1} είναι ένα {2} για {3}.'('Prolog', 'πρότυπο', 'προτάσεις').

% «Λόγοι» είναι η ελληνική λέξη για «λέξεις».
; -> '«{1}» είναι η {2} λέξη για «{3}».'('Λόγοι', 'ελληνική', 'λέξεις').

% Ο Δαίδαλος ήταν ο πατέρας του Ίκαρου.
; -> 'Ο {1} ήταν ο {2} του {3}.'('Δαίδαλος', 'πατέρας', 'Ίκαρου').

% Ο Σωκράτης είναι ένας άνθρωπος.
; -> 'Ο {1} είναι ένας {2}.'('Σωκράτης', 'άνθρωπος').

% Όλοι άνδρες είναι θνητοί.
; -> 'Όλοι {1} είναι {2}.'('άνδρες', 'θνητοί').

% Ο πληθυντικός του άνθρωπος είναι άνδρες.
; -> 'Ο {1} του {2} είναι {3}.'('πληθυντικός', 'άνθρωπος', 'άνδρες').

% Είναι θνητός ο Σωκράτης;
; -> 'Όλοι {1} είναι {2}.'(Y, 'θνητοί'),
;    'Ο {1} είναι ένας {2}.'('Σωκράτης', X),
;    'Ο {1} του {2} είναι {3}.'('πληθυντικός', X, Y).
; -> ναι

;
; Latin
;

% Prolog est exemplum sententias.
; -> '{1} est {2} {3}.'('Prolog', 'exemplum', 'sententias').

% λόγοι graecum est apud verba.
; -> '{1} {2} est apud {3}.'('λόγοι', 'graecum', 'verba').

% Daedalus pater Icari.
; -> '{1} {2} {3}.'('Daedalus', 'pater', 'Icari').

% Socrates est homo.
; -> '{1} est {2}.'('Socrates', 'homo').

% Omnes homines mortales.
; -> 'Omnes {1} {2}.'('homines', 'mortales').

% Pluralis homo est homines.
; -> '{1} {2} est {3}.'('Pluralis', 'homo', 'homines').

% Estne Socrates mortalis?
; -> 'Omnes {1} {2}.'(Y, 'mortales'),
;    '{1} est {2}.'('Socrates', X),
;    '{1} {2} est {3}.'('Pluralis', X, Y).
; -> sic

;
; Danish
;

% Prolog er en skabelon til sætninger.
; -> '{1} er en {2} til {3}.'('Prolog', 'skabelon', 'sætninger').

% λόγοι er det græske ord for "ord".
; -> '{1} er det {2} ord for "{3}".'('λόγοι', 'græske', 'ord').

% Daedalus var far til Ikaros.
; -> '{1} var {2} til {3}.'('Daedalus', 'far', 'Ikaros').

% Sokrates er en mand.
; -> '{1} er en {2}.'('Sokrates', 'mand').

% Alle mennesker er dødelige.
; -> 'Alle {1} er {2}.'('mennesker', 'dødelige').

% Flertal af mand er mennesker.
; -> '{1} af {2} er {3}.'('Flertal', 'mand', 'mennesker').

% Er Sokrates dødelig?
; -> 'Alle {1} er {2}.'(Y, 'dødelige'),
;    '{1} er en {2}.'('Sokrates', X),
;    '{1} af {2} er {3}.'('Flertal', X, Y).
; -> ja

```
# Conjunction Junction

!!!This area is closed to the general public!!!

Abandon all hope, and grab a hard hat, ye who enter here.
```

;
; Lisp->Prolog
;

; Sentence::String
; Sentences::Strings

english/Sentences
    "Socrates is a man."
    "All men are mortal."
    "The plural of man is men."
; -> '{1} is a {2}.'('Socrates', 'man').
;    'All {1} are {2}.'('men', 'mortal').
;    'The {1} of {2} is {3}.'('plural', 'man', 'men').

; Question::Sentence::String

yes?/Question
    "Is Socrates mortal?"
; -> '{1} is a {2}.'('Socrates', 'man').
;    'All {1} are {2}.'('men', 'mortal').
;    'The {1} of {2} is {3}.'('plural', 'man', 'men').
; -> yes

; Term::String

prolog/Term
    "'{1} is a {2}.'('Socrates', 'man')."
; -> '{1} is a {2}.'('Socrates', 'man').

; Demando::Frazo::Ŝnuro

Nomo/Valoro
    jes
    yes

Nomo/Valoro
    jes?/Demando    
    Funkcio/1
        demando
        esperanto?/Ŝnuro
            demando

jes?/Demando
    "Sokrato estas mortema?"
; -> 'Ĉiuj {1} estas {2}.'(Y, 'mortemaj'),
;    '{1} estas {2}.'('Socrates', X),
;    '{1} = {2} + {3}.'(Y, X, 'j').
; -> jes

; Frazo::Ŝnuro

prolog/Frazo
    "'{1} estas {2}.'('Sokrato', 'viro')."
; -> '{1} estas {2}.'('Sokrato', 'viro').

;
; Prolog->Lisp
;

% The sum of {1} and {2} is {3}.
; -> Name/Value
;       {3}
;       sum/Number/Number
;           {1}
;           {2}

% The first character of {1} is {2}.
; -> Name/Value
;       {2}
;       first/String
;           {1}

```
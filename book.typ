/*

Info:
- document is created using www.typst.app
- document structure is a copy of the toc defined in `summary.md`. Header-level slightly adjusted
- some pngs/pictures are offline / not accessible anymore
- syntax highlighting of Scheme and Lilypond could be better

*/

// cmarker package to convert markdown into typst
#import "@preview/cmarker:0.1.0"
//helper function to preprocess raw text before rendering
#let readmd(..args) = {
  let args-named = args.named()
  let args-pos = args.pos()
  let rawtext = read(args-named.path)
  let rawtext = rawtext
                      .replace("{% lilypond %}","```lilypond")
                      .replace("{% endlilypond %}","```")
  
  cmarker.render(rawtext,
                  // show-source: true,
                  h1-level: args-named.h1-level
                )
}
//page formatting definitions for eReader / Kindle
// #set page(width: 150mm, height: 200mm, flipped: true, margin: (rest: 0.5mm))
// #set text(1.6em)

#set heading(numbering: "1.")

#set raw(lang: "scm")
#set raw(syntaxes: "lilypond.sublime-syntax")
#show link: underline


//set meta data for PDF
#set document(
  title: [Understanding Scheme In LilyPond],
  author: "Urs Liska",
)

//create title page
#align(center)[
  #text(5em)[*Understanding Scheme In LilyPond*]
  #v(2em)
  #text(3em)[\- Urs Liska]
]

see: 
- https://github.com/uliska/scheme-book
- https://github.com/yomannnn/scheme-book


#pagebreak()

// = TOC
#outline()
// #outline(depth: 4)

= Intro
#readmd(path: "README.md", h1-level: 2)
// #readmd(path: "SUMMARY.md", h1-level: 2)

= Intro - LilyPond's Scheme
  //* [LilyPond's Scheme]
  #readmd(path: "intro/README.md", h1-level: 2)
  //    * [Learning the Language]
  #readmd(path: "intro/language.md", h1-level: 2)
  //    * [Integrating in LilyPond]
  #readmd(path: "intro/integrating.md", h1-level: 2)
  //    * [Advanced Interaction]
  #readmd(path: "intro/advanced.md", h1-level: 2)

= Scheme
//* [Scheme]
  #readmd(path: "scheme/README.md", h1-level: 2)
  //    * [Everything's an Expression]
  #readmd(path: "scheme/expressions.md", h1-level: 2)
  //    * [Including Scheme in LilyPond]
  #readmd(path: "scheme/including.md", h1-level: 2)
  //    * [Music Function Primer]
  #readmd(path: "scheme/music-function-primer.md", h1-level: 2)

//    * [Scheme Concepts]
#readmd(path: "scheme/concepts.md", h1-level: 2)
//        * [Data Types]
#readmd(path: "scheme/data-types/README.md", h1-level: 3)
//            * [Numbers]
#readmd(path: "scheme/data-types/numbers.md", h1-level: 4)
//            * [Booleans]
#readmd(path: "scheme/data-types/booleans.md", h1-level: 4)
//            * [Strings]
#readmd(path: "scheme/data-types/strings.md", h1-level: 4)
//            * [Symbols]
#readmd(path: "scheme/data-types/symbols.md", h1-level: 4)

//        * [Compound Data Types]
#readmd(path: "scheme/data-types/compound.md", h1-level: 3)
//            * [Lists and Pairs]
#readmd(path: "scheme/data-types/lists-and-pairs/README.md", h1-level: 4)
//                * [Creating Pairs]
#readmd(path: "scheme/data-types/lists-and-pairs/creating-pairs.md", h1-level: 4)
//                * [Accessing Pairs]
#readmd(path: "scheme/data-types/lists-and-pairs/accessing-pairs.md", h1-level: 4)
//                * [Creating Lists]
#readmd(path: "scheme/data-types/lists-and-pairs/creating-lists.md", h1-level: 4)
//                * [List Structure]
#readmd(path: "scheme/data-types/lists-and-pairs/structure.md", h1-level: 4)
//                * [Accessing Lists]
#readmd(path: "scheme/data-types/lists-and-pairs/accessing-lists.md", h1-level: 4)
//                * [Pairs vs. Lists]
#readmd(path: "scheme/data-types/lists-and-pairs/list-pair-comparison.md", h1-level: 4)
//            * [Vectors]
==== Vectors
// #readmd(path: ""  file does not exist yet

//            * [Custom Types]
#readmd(path: "scheme/data-types/custom.md", h1-level: 4)
//        * [Equality and Equivalence]
#readmd(path: "scheme/equality.md", h1-level: 3)
//        * [List Operations]
#readmd(path: "scheme/lists/README.md", h1-level: 3)
//            * [Accessing List Elements]
#readmd(path: "scheme/lists/accessing.md", h1-level: 4)
//            * [Extending and Reversing Lists]
#readmd(path: "scheme/lists/extend-reverse.md", h1-level: 4)
//            * [Filtering Lists]
#readmd(path: "scheme/lists/filtering.md", h1-level: 4)
//            * [Modifying Lists]
#readmd(path: "scheme/lists/modifying.md", h1-level: 4)
//            * [Iteration Over Lists]
#readmd(path: "scheme/lists/iteration.md", h1-level: 4)
//        * [Quoting]
#readmd(path: "scheme/quoting/README.md", h1-level: 3)
//            * [Preventing Evaluation]
#readmd(path: "scheme/quoting/preventing-evaluation.md", h1-level: 4)
//            * [Creating Lists and Pairs]
#readmd(path: "scheme/quoting/lists-and-pairs.md", h1-level: 4)
//            * [Unquoting]
#readmd(path: "scheme/quoting/unquoting.md", h1-level: 4)
//        * [Association Lists]
#readmd(path: "scheme/alists/README.md", h1-level: 3)
//            * [Lookup in Alists]
#readmd(path: "scheme/alists/retrieving.md", h1-level: 4)
//            * [Modifying Alists]
#readmd(path: "scheme/alists/modifying.md", h1-level: 4)
//        * [Binding Variables]
#readmd(path: "scheme/binding/README.md", h1-level: 3)
//            * [Top-level Bindings]
#readmd(path: "scheme/binding/top-level.md", h1-level: 4)
//            * [Local Bindings]
#readmd(path: "scheme/binding/local.md", h1-level: 4)
//            * [Let]
#readmd(path: "scheme/binding/let.md", h1-level: 4)
//            * [Parenthesizing Errors]
#readmd(path: "scheme/binding/paren-errors.md", h1-level: 4)
//            * [let* and letrec]
#readmd(path: "scheme/binding/letstar.md", h1-level: 4)

//        * [Conditionals]
#readmd(path: "scheme/conditionals/README.md", h1-level: 3)
//            * [if]
#readmd(path: "scheme/conditionals/if.md", h1-level: 4)
//            * [cond]
#readmd(path: "scheme/conditionals/cond.md", h1-level: 4)
//            * [case]
// #readmd(path: "scheme/conditionals/case.md", h1-level: 4)
//            * [not/and/or]
#readmd(path: "scheme/conditionals/logical.md", h1-level: 4)
//        * [Defining Procedures]
#readmd(path: "scheme/procedures/README.md", h1-level: 3)
//            * [lambda Expressions]
#readmd(path: "scheme/procedures/lambda.md", h1-level: 4)
//            * [lambda Arguments]
#readmd(path: "scheme/procedures/lambda-signatures.md", h1-level: 4)
//            * [Binding Procedures]
#readmd(path: "scheme/procedures/binding.md", h1-level: 4)
//            * [Predicates]
#readmd(path: "scheme/procedures/predicates.md", h1-level: 4)
//            * [Parameter Types]
#readmd(path: "scheme/procedures/parameter-types.md", h1-level: 4)
//        * [Iteration and Loops]
#readmd(path: "scheme/loops/README.md", h1-level: 3)
//          * [map]
#readmd(path: "scheme/loops/map.md", h1-level: 2)
//          * [for-each]
#readmd(path: "scheme/loops/for-each.md", h1-level: 2)
//          * [List Recursion]
// #readmd(path: "scheme/loops/recursion.md", h1-level: 2)
//          * [Programming Loops]
// #readmd(path: "scheme/loops/do-while.md", h1-level: 2)


= Scheme in LilyPond
- Music, Scheme and Void Functions
  - Interface of the functions
  - Switching Between Scheme and LilyPond
- Markup Functions

//* [Scheme in LilyPond]
// #readmd(path: "lilypond/README.md", h1-level: 2)
//    * [Music, Scheme and Void Functions]
// #readmd(path: "lilypond/functions/music-scheme-void.md", h1-level: 2)
//        * [Interface of the functions]
// #readmd(path: "lilypond/functions/interface.md", h1-level: 2)
//        * [Switching Between Scheme and LilyPond]
// #readmd(path: "lilypond/functions/switch-languages.md", h1-level: 2)
//    * [Markup Functions]


= Advanced Interaction With Scheme

- Built-in Scheme Functions
- Overriding Stencils
- Scheme Engravers
- Scheme Representation of Music

//* [Advanced Interaction With Scheme]
// #readmd(path: "advanced/README.md", h1-level: 2)
//    * [Built-in Scheme Functions]
#readmd(path: "advanced/built-in/README.md", h1-level: 2)
//    * [Overriding Stencils]
// #readmd(path: ""
//    * [Scheme Engravers]
// #readmd(path: "advanced/engravers/README.me", h1-level: 2)
//    * [Scheme Representation of Music]
// #readmd(path: "advanced/scheme-music/README.md", h1-level: 2)



= Old Stuff
//* [Old Stuff]
//    * [Writing Music Functions]
// #readmd(path: "old-stuff/functions/README.md", h1-level: 2)
//    * [Getting to Grips with Scheme in LilyPond]
#readmd(path: "old-stuff/functions/01.md", h1-level: 2)
//        * [Start Doing Something Useful]
#readmd(path: "old-stuff/functions/02.md", h1-level: 2)
//        * [Reusing Code]
#readmd(path: "old-stuff/functions/03.md", h1-level: 2)
//        * [Recursion]
#readmd(path: "old-stuff/functions/04.md", h1-level: 2)


//* [License]
#readmd(path: "license.md", h1-level: 1)

// */
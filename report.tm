<TeXmacs|1.0.7.10>

<style|book>

<\body>
  <\abstract>
    asdf
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Abstract>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Background
    and related work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Type
    inference as constraint solving> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    3.1<space|2spc>Constructors and Variance
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>

    <with|par-left|1.5fn|3.1.1<space|2spc><with|mode|math|\<top\>> and
    <with|mode|math|\<bot\>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    3.2<space|2spc>Ground types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>

    <with|par-left|1.5fn|3.2.1<space|2spc>Equirecursive and isorecursive data
    types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1.5fn|3.2.2<space|2spc>Subtyping between ground types
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    3.3<space|2spc>rc types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>

    <with|par-left|1.5fn|3.3.1<space|2spc>Denotation of an rc type
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1.5fn|3.3.2<space|2spc>Subsumption
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    3.4<space|2spc>Constraints and well-typedness
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>

    3.5<space|2spc>Structural decomposition
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>

    <with|par-left|1.5fn|3.5.1<space|2spc>Formal definition of constructor
    lattice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    3.6<space|2spc>Closure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    type inference engine> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>

    4.1<space|2spc>The small terms invariant
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>

    4.2<space|2spc>Merging constraints <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>

    4.3<space|2spc>The mono-polarity invariant
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>

    4.4<space|2spc>Garbage collection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21>

    4.5<space|2spc>Representing the constraint set
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>

    4.6<space|2spc>The incremental closure algorithm
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>

    4.7<space|2spc>Type simplification and optimisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>

    <with|par-left|1.5fn|4.7.1<space|2spc>Canonisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    <with|par-left|1.5fn|4.7.2<space|2spc>Minimisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>>

    4.8<space|2spc>rc type subsumption <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>

    <with|par-left|1.5fn|4.8.1<space|2spc>Entailment
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>>

    <with|par-left|1.5fn|4.8.2<space|2spc>Subsumption
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29>>

    4.9<space|2spc>Display <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>...
    (objects, nom/struct, constraintgen)>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31><vspace|0.5fn>

    5.1<space|2spc>Generalised and ungeneralised bindings
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-32>

    <with|par-left|1.5fn|5.1.1<space|2spc>The value restriction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-33>>

    5.2<space|2spc>Optional type annotations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-34>

    <with|par-left|1.5fn|5.2.1<space|2spc>Checking type annotations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-35>>

    <with|par-left|1.5fn|5.2.2<space|2spc>A potential problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36>>

    <with|par-left|1.5fn|5.2.3<space|2spc>Classes (partial description)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37>>

    <with|par-left|1.5fn|5.2.4<space|2spc>The object constructor lattice
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38>>

    <with|par-left|3fn|5.2.4.1<space|2spc>Mutability
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39>>

    <with|par-left|3fn|5.2.4.2<space|2spc>``Polymorphism''
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Implementation
    tools> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-41><vspace|0.5fn>

    6.1<space|2spc>Haskell <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-42>

    <with|par-left|1.5fn|6.1.1<space|2spc>Laziness
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-43>>

    <with|par-left|1.5fn|6.1.2<space|2spc>Monads
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-44>>

    6.2<space|2spc>Happy and Alex <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-45>

    6.3<space|2spc>LLVM <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-46>

    <with|par-left|1.5fn|6.3.1<space|2spc>LLVM IR
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-47>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Extending
    an interpreter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-48><vspace|0.5fn>

    7.1<space|2spc>Meta-circular interpreters
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-49>

    7.2<space|2spc>Monadic interpreters <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-50>

    7.3<space|2spc>Generalising <with|font-family|tt|math-font-family|ttt|eval>
    further <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-51>

    7.4<space|2spc>Generalising <with|font-family|tt|math-font-family|ttt|eval>
    even further <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-52>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>A
    compiler from an interpreter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-53><vspace|0.5fn>

    8.1<space|2spc>A code generation monad
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-54>

    8.2<space|2spc>Representing flow control
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-55>

    <with|par-left|1.5fn|8.2.1<space|2spc>Coalescing
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-56>>

    <with|par-left|1.5fn|8.2.2<space|2spc>Iteration
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-57>>

    8.3<space|2spc>Implementation of structures
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-58>

    8.4<space|2spc>Implementation of closures
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-59>

    8.5<space|2spc>A typechecker from an interpreter
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-60>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Future
    work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-61><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10<space|2spc>Conclusions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-62><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Appendix
    A<space|2spc>BNF grammar for the syntax of <error|compound brick>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-63><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Appendix
    B<space|2spc>Detailed typing rules for <error|compound brick>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-64><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-65><vspace|0.5fn>
  </table-of-contents>

  <chapter|Introduction>

  ...

  \;

  <chapter|Background and related work>

  <\itemize>
    <item>lots of subtyping ranting

    <item>types / AI / dataflow connections

    <item>type systems provide partial info (term types) and make subj.
    judgements

    <item>theorycs vs compilers (preservation of programs)

    <item>ground types as abstraction

    <item>vars

    <item>rc types vague desc

    <item><math|n<rsup|3>>, PSPACE

    <item>nom / struct

    <item>syntax intro

    <item>compiler

    <item>...
  </itemize>

  \;

  <chapter|Type inference as constraint solving>

  <section|Constructors and Variance>

  Types in <brick> are formed via <with|font-shape|italic|type constructors>.
  A type constructor builds complex types out of simpler ones. For instance,
  the function type constructor (<math|\<rightarrow\>>) builds function types
  out of an argument and a return type. So, if <math|a> and <math|b> are
  types, <math|a\<rightarrow\>b> is the type of functions taking an <math|a>
  and returning a <math|b>.

  There are many type constructors other than <math|\<rightarrow\>>. Others
  include:

  <\itemize>
    <item>Structure types such as <math|<around*|{|<tt|foo>:a,<tt|bar>:b|}>>,
    which is the type of structures having a field <tt|foo> of type <math|a>
    and a field <tt|bar> of type <math|b>.

    <item>The unit type (written <math|<around*|(||)>> in descriptions of the
    type system and <tt|void> in <brick> source)

    <item>User-defined (possibly generic) classes

    <item>###

    <item>The special types <math|\<top\>> and <math|\<bot\>> (<tt|any> and
    <tt|none> in source code)
  </itemize>

  The type inference engine doesn't depend on the exact set of constructors.
  We leave the exact description of which type constructors are available and
  what their semantics are for ###, and describe the type inference engine
  generically.

  Each type constructor has zero or more parameters. The parameters each have
  a <with|font-shape|italic|variance>, indicating how the constructed type
  changes as the parameter type changes. Covariant parameters (or ones of
  ``positive variance'') cause the constructed type to become a subtype if
  the parameter is replaced by a subtype, while contravariant parameters (of
  ``negative variance'') cause the constructed type to become a
  <with|font-shape|italic|super>type if the parameter is replaced by a
  subtype.

  For instance, consider the function type <math|a\<rightarrow\>b>. Imagine
  also that <math|a<rsup|\<downarrow\>>> and <math|b<rsup|\<downarrow\>>> are
  some subtypes of <math|a> and <math|b> respectively, and
  <math|a<rsup|\<uparrow\>>> and <math|b<rsup|\<uparrow\>>> are supertypes of
  <math|a> and <math|b>. Then:

  <\eqnarray*>
    <tformat|<table|<row|<cell|a\<rightarrow\>b<rsup|\<uparrow\>>>|<cell|\<geqslant\>>|<cell|a\<rightarrow\>b>>|<row|<cell|a\<rightarrow\>b<rsup|\<downarrow\>>>|<cell|\<leqslant\>>|<cell|a\<rightarrow\>b>>|<row|<cell|a<rsup|\<uparrow\>>\<rightarrow\>b>|<cell|\<leqslant\>>|<cell|a\<rightarrow\>b>>|<row|<cell|a<rsup|\<downarrow\>>\<rightarrow\>b>|<cell|\<geqslant\>>|<cell|a\<rightarrow\>b>>>>
  </eqnarray*>

  If we consider types to be predicates about the values they describe, then
  this is equivalent to stating that we can strengthen a statement about a
  function by strengthening what we say about its result, or
  <with|font-shape|italic|weakening> what we say about its parameter. ###
  single eq?

  ### fwd ref about invariant params / mutable cells

  The space of type constructors is equipped with a subtype ordering, which
  forms a lattice. That is, for any two type constructors <math|a> and
  <math|b> we can form their greatest lower bound (that type constructor
  which is a supertype of any type constructor which is a subtype of both
  <math|a> and <math|b>), and their least upper bound (that type constructor
  which is a subtype of any type constructor which is a supertype of both
  <math|a> and <math|b>).

  With just the type constructors <with|mode|math|\<top\>\<nocomma\>\<nocomma\>\<nocomma\>>,
  <math|\<nocomma\>\<rightarrow\> and \<bot\>>, the ordering is simply
  <math|\<bot\>\<leqslant\>\<rightarrow\>\<leqslant\>\<top\>>. The ordering
  for the full set of type constructors is somewhat more complex (see ###).

  As well as forming a lattice, there is one extra condition attached to the
  space of type constructors called <with|font-shape|italic|convexity of
  arity>. It is explained fully in ###

  <subsection|<math|\<top\>> and <math|\<bot\>>>

  The special type constructors <math|\<top\>> and <math|\<bot\>> represent
  the widest and narrowest types. <math|\<top\>> (written in <brick> source
  as <tt|any>) is the common supertype of all types, the type so wide that it
  contains everything. Similarly <math|\<bot\>> (written in source as
  <tt|none>) is the common subtype of all types, the type so narrow that it
  contains nothing.

  <math|\<top\>> will generally arise as an underconstrained (unused) input
  (for instance, if a function parameter is never used then any object can be
  passed, hence the function requires type <math|\<top\>>), or as an
  overconstrained output (for instance, if a function returns an integer on
  one line and a string on another, then nothing at all can be said about its
  return type, so it returns type <math|\<top\>>).

  Conversely, <math|\<bot\>> will generally arise as an
  <with|font-shape|italic|over>constrained input, or an
  <with|font-shape|italic|under>constrained output. If a function takes an
  input parameter and tries to add 5 to it, and also tries to call it, then
  it overconstrains the input. The input would be required to be a subtype of
  two incompatible types, and hence the input type is <math|\<bot\>>. If a
  function <math|f<around*|(|x|)>> is defined as <math|<tt|return>
  f<around*|(|x|)>> it will loop infinitely and not produce any output.
  Hence, it underconstrains its output and produces type <math|\<bot\>>.
  (This is correct, since the result of <math|f<around*|(|x|)>> can safely be
  passed to any function at all with any requirements and it will not cause a
  type error, since it will never reach that stage).

  In a type-correct and terminating program, <math|\<top\>> and
  <math|\<bot\>> can only appear in <with|font-shape|italic|dead> locations.
  <math|\<top\>> will be the type of dead <em|values>: variables that are
  written to but never read or parameters that are passed but never used.
  <math|\<bot\>> will be the type of dead <em|code>: functions that are never
  run or branches that are never taken.

  <section|Ground types>

  Every value in the language can be given a ``ground type''. These types are
  those defined in the system of Amadio and Cardelli <cite|subrec>, extended
  to support the full set of type constructors.

  Each ground type is a regular tree with ordered branches, where the leaf
  nodes of the tree are nullary type constructors (such as
  <math|\<bot\>>,<math|\<top\>> or <tt|int>), and the branch nodes of the are
  non-nullary type constructors (such as <math|\<rightarrow\>>,
  <math|<around*|{|<tt|field1>,<tt|field2>|}>>) where the children of a
  branch node correspond to the parameters to the type constructor.

  A regular tree is essentially an infinite tree with regular structure,
  which allows us to encode the recursive data types necessary for
  object-oriented programming. For instance, an object-oriented
  singly-linked-list data type may have methods <tt|insert>, <tt|delete>,
  <tt|find> (all having some function type) and a field <tt|next>, having the
  same type as the list itself. Thus, we cannot represent the type of the
  list as a finite tree, since one subtree of the tree may refer recursively
  to the whole tree.

  Regular trees have many equivalent definitions and representations, some of
  which are:

  <\description>
    <item*|An infinite sequence of finite trees>The infinite regular tree can
    be approximated by a sequence of finite trees of increasing depth. Also,
    the regular tree can be considered to be an infinite tree with only
    finitely many distinct subtrees.

    <item*|Directed graphs>A directed acyclic graph structure is used by many
    typecheckers to efficiently describe finite trees which may possibly
    share subtrees. If we allow cycles in the graph, the set of trees
    described is extended to include the regular trees

    <item*|A term automaton>A finite state machine where the transitions move
    from a type to a part of that type (a constructor parameter) can be used
    to represent types in much the same way as a directed graph does. As a
    consequence, the set of paths in a regular tree is a regular language.

    <item*|A solution to a series of unification equations>The solution to a
    system of equations to be solved by term unification is a regular tree in
    the general case. Many systems relying on unification (Prolog, ML
    typecheckers) restrict this to finite trees by the addtion of the
    ``occurs check'', which disallows non-finite regular trees.
  </description>

  The various forms of regular trees have a few applications. The infinite
  and series-of-approximation views are useful in proving certain properties
  of regular trees, the directed graph approach is a handy implementation
  technique, the term automaton view is used to define subtyping between
  ground types and the unification representation allows us to show certain
  constraint graphs are satisfiable in the space of regular trees by reducing
  them to equality constraints.

  The proofs of the various salient properties of regular trees are omitted.
  Detailed descriptions, including the equivalence of the above
  representations, can be found in <cite|subrec|subrecfast|regulartypes|pottierphd>.

  <subsection|Equirecursive and isorecursive data types>

  The recursive data types encoded in regular trees are equirecursive types,
  rather than the more usual isorecursive types. Equirecursive types allow
  the direct specification of a recursive ground type: a ground type is
  considered exactly equivalent to its one-level unrolling. Isorecursive
  types on the other hand require explicit ``roll'' and ``unroll'' operations
  to break the recursive loop and see the recursion.

  For example, consider a simple binary tree data type. It is represented by
  a structure with two fields<\footnote>
    For simplicity, I am ignoring leaf nodes here.
  </footnote>. The types of both are binary trees. In a language like Haskell
  with only equirecursive types, this binary tree datatype could be
  implemented as:

  <center|<\verbatim>
    <tabular|<tformat|<table|<row|<cell|data BinTree = MkBinTree (BinTree,
    BinTree)>>>>>
  </verbatim>>

  This defines a datatype <tt|BinTree>, which is represented by a pair of
  <tt|BinTree>s. The new type <tt|BinTree> is considered distinct in the type
  system from its one-level unrolling <tt|(BinTree,BinTree)>, with a
  roll/unroll isomorphism provided (the roll function is <tt|MkBinTree> while
  the unroll function is pattern-matching, e.g. <tt|\\(MkBinTree
  x)-\<gtr\>x>).

  This means that data operating on <tt|BinTree> must include a form of type
  annotation whenever it wants to construct items of the recursive type (a
  call to <tt|MkBinTree>), and operations on recursive data-types can only be
  perfomed once a data declaration is made for that type.

  In a language with equirecursive types, types like <tt|BinTree> can be
  declared as type aliases, stating that <tt|BinTree> is an alias for the
  type <math|\<mu\>x.<around*|(|x,x|)>> (where <math|\<mu\>> is the standard
  type fixpoint operator). This implies that the type
  <math|\<mu\>x.<around*|(|x,x|)>> and its one-level unrolling
  <math|<around*|(|\<mu\>x.<around*|(|x,x|)>,\<mu\>x.<around*|(|x,x|)>|)>>
  are exactly equivalent, and no roll/unroll operations are necessary to
  convert between them.

  During object-oriented programming, heavy use is often made of recursive
  and mutually recursive data types. For instance, it would be very common
  for an object with specific responsibilities to refer to a parent object,
  while the parent object has a list of all child objects managed by it.
  Equirecursive data types mean that complex recursive object relationships
  can be written with no type annotations whatsoever.

  The disadvantage of equirecursive datatypes is that they can ascribe a
  meaning to many terms which it may be preferable to consider ill-typed. For
  instance, self-application of a function (such as the lambda calculus term
  <math|\<lambda\>x.x x>) is almost never a useful operation. The only
  application of such things seems to be in the definition of the Y
  combinator and other fixpoint operators, and it is very doubtful whether
  even that could be considered useful! As future work, it may be interesting
  to investigate extensions of the type system which allow equirecursive
  structure types (thus allowing lists, trees and so on to be used with
  little effort) while banning equirecursive function types (as these are
  more often than not entirely incomprehensible).

  The reason for allowing equirecursive datatypes was in the end a practical
  one. As will be seen when the concept of closure of a constraint set is
  defined, it is relatively easy to determine whether a constraint set is
  satisfiable in the space of regular trees. However, there does not seem to
  be any easy way to check whether a constraint set is satisfiable using only
  finite trees: there is no simple analogue of the ``occurs check'' when
  dealing with inequality rather than equality constraints<cite|pottierphd>.

  <subsection|Subtyping between ground types>

  The subtyping relation between type constructors generalises naturally to a
  subtyping relation between finite ground types. If we have two ground types
  <math|g> and <math|g<rprime|'>>, where

  <\eqnarray>
    <tformat|<table|<row|<cell|g>|<cell|=>|<cell|c<around*|(|l<rsub|1>:t<rsub|1>\<nocomma\>,l<rsub|2>:t<rsub|2>,\<ldots\>|)>>>|<row|<cell|g<rprime|'>>|<cell|=>|<cell|c<rprime|'><around*|(|l<rprime|'><rsub|1>:t<rprime|'><rsub|1>\<nocomma\>,l<rprime|'><rsub|2>:t<rprime|'><rsub|2>,\<ldots\>|)>>>>>
  </eqnarray>

  where <math|c> and <math|c<rprime|'>> are type constructors,
  <math|l<rsub|i>> and <math|l<rprime|'><rsub|i>> are labels and
  <math|t<rsub|i>> and <math|t<rprime|'><rsub|i>> are the smaller ground
  types of which <math|g> and <math|g<rprime|'>> consist, then we can
  determine whether <math|g\<leqslant\>g<rprime|'>> by checking whether
  <math|c\<leqslant\>c<rprime|'>> and whether <math|t\<leqslant\>t<rprime|'>>
  (or <math|t<rprime|'>\<leqslant\>t>, depending on the variance of the
  label) for all types associated to a label that <math|c> and
  <math|c<rprime|'>> have in common.

  This notion depends on the constituent parts of <math|g> being smaller than
  <math|g> itself (likewise for <math|g<rprime|'>>) in order to set up an
  induction proof. It is not clear how this extends to the non-finite regular
  trees. It seems like it should, however, given that a regular tree only has
  finitely many distinct subtrees and hence only finitely many pairs of
  <math|<around*|(|t,t<rprime|'>|)>> which need to be examined.

  Amadio and Cardelli showed in <cite|subrec> that this subtyping relation is
  in fact well-defined for all ground types (using an argument based on
  successive finite approximations to the infinite tree), and give an
  exponential time algorithm for deciding the subtyping relation. Kozen,
  Palsberg and Schwartzbach <cite|subrecfast> defined the term automaton
  representation of a ground type to give an efficient
  <math|O<around*|(|n<rsup|2>|)>> algorithm for deciding subtyping.

  The subtyping relation on ground types in fact describes a
  lattice<cite|pottierphd>. That is, there are narrowest common supertype and
  widest common subtype operations which can be defined on ground types and
  computed using a similar algorithm to the subtyping relation.

  <section|rc types>

  Ground types are insufficient for denoting the ``type'' of an object in
  <brick>, since we do not necessarily know the exact ground type in use at
  each point in the program. To draw an analogy with functional programming
  languages such as ML and Haskell, ground types correspond roughly to
  monomorphic types.

  The actual ``type'' of a term in <brick> may well contain free variables,
  which can be instantiated with any type. For instance, the identity
  function <math|\<lambda\>x.x> conforms to the ground types
  <math|a\<rightarrow\>a> for all possible ground types <math|a\<nosymbol\>>.
  There is no single ground type which covers exactly the set of types to
  which <math|\<lambda\>x.x> conforms, so we need a more expressive notion of
  type. To this end, we allow types to contain free variables.

  Some terms, as well as being usable with a range of possible types, have
  additional constraints. For instance, consider a ``logging'' version of the
  identity function which as well as returning its argument also prints its
  argument's <tt|name> field to the screen. Hence, the function no longer
  works with any argument type. This version only works with argument types
  which contain a field called <tt|name> of type <tt|string>. That is, the
  argument's type must be a subtype of <math|<around*|{|<tt|name>:<tt|string>|}>>.

  A first attempt at typing such a function might assign it the type
  <math|<around*|{|<tt|name>:<tt|string>|}>\<rightarrow\><around*|{|<tt|name>:<tt|string>|}>>.
  Unfortunately, this type does not sufficiently capture the semantics of the
  function. In particular, if we have an object containing fields <tt|name>
  and <tt|place> and we pass it to a function of this type we would not be
  able to conclude that the result contained a <tt|place> field.

  What we need is to be able to specify that the argument type and the result
  type are the same (as in the typing for <math|\<lambda\>x.x>), but that
  this type must be a subtype of <with|mode|math|<around*|{|<tt|name>:<tt|string>|}>>.
  We do this by allowing arbitrary constraints to appear in the type, giving
  us a notion of types known as <dfn|rc types> (``recursively constrained'',
  the name is from <cite|ooprectypes>). The type of our ``logging identity''
  function then becomes

  <\equation*>
    a\<rightarrow\>a\\a\<leqslant\><around*|{|<tt|name>:<tt|string>|}>
  </equation*>

  The <math|\\>, read as ``where'', separates the type from a series of
  constraints on the variables defined in the type.

  <subsection|Denotation of an rc type>

  The free variables in an rc type means that it denotes not one but a set of
  ground types.

  There need not be (and in the prescence of variables, often isn't) a single
  ground type which is a supertype of all of the set of ground types denoted
  by an rc type. For instance, consider the rc type
  <math|a\<rightarrow\>b\\a\<leqslant\>b>. This denotes the type of functions
  whose output type is a supertype of their input type, and is a possible
  typing for the identity function <math|\<lambda\>x.x>. Its denotation
  includes the ground types <math|int\<rightarrow\>int>,
  <math|string\<rightarrow\>string>, <math|<around*|{|<tt|f1>:a|}>\<rightarrow\><around*|{|<tt|f1>:a,<tt|f2>:b|}>>,
  and all of their supertypes such as <math|int\<rightarrow\>\<top\>>,
  <math|\<bot\>\<rightarrow\>string>, and so on. Note that there is no single
  ground type which captures all of these and no others: the greatest lower
  bound of all of these types would be <math|\<top\>\<rightarrow\>\<bot\>>,
  which includes terms that don't satisfy the constraints.

  Essentially, the set of ground types denoted by an rc type <math|\<sigma\>>
  is the set of ground types that can be formed by applying an arbitrary
  substitution mapping the free variables of <math|\<sigma\>> to ground
  types, as long as the constraints in <math|\<sigma\>> still hold. This set
  is considered to be upwards-closed: the denotation of an rc type also
  includes all supertypes, as a term of a subtype can transparently be
  considered to conform to the supertype as well.

  <subsection|Subsumption>

  We would like to define a subtyping operation
  <math|\<leqslant\><rsup|\<forall\>>> which captures a notion of subtyping
  on rc types which has the same substitutability property as the subtyping
  notion on ground types. That is, whenever a term of type <math|\<sigma\>>
  is expected, and <math|\<sigma\><rprime|'>\<leqslant\><rsup|\<forall\>>\<sigma\><rsub|>>,
  a term with rc type <math|\<sigma\><rprime|'>> may be substituted.

  This leads to a definition of <math|\<leqslant\><rsup|\<forall\>>>:
  <math|\<sigma\><rprime|'>\<leqslant\><rsup|\<forall\>>\<sigma\>> iff, for
  any ground type which is in ### upwards vs downwards closure....

  \;

  Subsumption, unfortuneatly, does not turn out to be efficiently decidable.
  ### find a reference for PSPACE-hard###

  <section|Constraints and well-typedness>

  The process of type inference is essentially reduced to the process of
  building an rc type from the program source. For each operation in the
  program, a constraint is generated to assert that the operands support the
  requested operation. So, the rc type of a term includes all of the
  constraints necessary to ensure that the term has a valid meaning (is
  type-correct).

  We can consider the rc type to be universally quantified: the program
  fragment can be considered to have <with|font-shape|italic|any> ground type
  which satisfies the constraint set.

  Hence, our criterion for whether a program fragment is well-typed is to
  consider whether its constraint set is <with|font-shape|italic|satisifiable>
  (or equivalently, whether its denotation as defined above is non-empty).
  Each solution of the constraint set corresponds to a valid run of the
  program, and typechecking simply seeks to ensure that at least one exists.
  We don't solve the constraint set and pick out solutions, we merely need to
  prove that at least one solution exists, and then compile the program in
  such a way that it will work for any solution to the constraints.

  <section|Structural decomposition>

  ###notation (subc), failure of subc (unsatisfiable constraints)

  A constraint between two constructed types can be decomposed into a set of
  constraints between their constituent parts. For instance, suppose we have
  the constraint <math|a\<rightarrow\>b\<leqslant\>x\<rightarrow\>y>. Since
  <math|\<rightarrow\>> is contravariant in its first parameter and covariant
  in its second, this constraint can be decomposed into the pair of
  constraints <math|x\<leqslant\>a> and <math|b\<leqslant\>y>.

  The conjunction of this set of constraints is equivalent to the original
  constraint; we have not lost any information by decomposing.

  Decomposition is defined generally for all type constructors. Suppose we
  have two type constructors <math|c> and <math|c\<nosymbol\><rprime|'>>
  where <math|c\<leqslant\>c<rprime|'>> according to the subtype ordering on
  constructors. <math|c> takes parameters with labels draw from <math|L>, and
  <math|c<rprime|'>> takes parameters with labels from <math|L<rprime|'>>. I
  will use <math|l<rsub|1>>, <math|l<rsub|2>>,<math|\<ldots\>> to denote
  arbitrary elements of <math|L> and similarly for
  <math|l<rprime|'><rsub|1>>,<math|l<rprime|'><rsub|2>,\<ldots\>>

  We have the constraint

  <\eqnarray>
    <tformat|<table|<row|<cell|c<rsub|><around*|(|l<rsub|1>:\<tau\><rsub|1>,l<rsub|2>:\<tau\><rsub|2>,\<ldots\>|)>>|<cell|\<leqslant\>>|<cell|c<rprime|'><around*|(|l<rprime|'><rsub|1>:\<tau\><rprime|'><rsub|1>,l<rprime|'><rsub|2>:\<tau\><rprime|'><rsub|2>,\<ldots\>|)>>>>>
  </eqnarray>

  For each <math|l\<in\>L\<cap\>L<rprime|'>>, let <math|\<tau\>> be the type
  assigned to it on the left-hand side of the constraint and
  <math|\<tau\><rprime|'>> be the type on the right-hand side. We gain the
  following constraint:

  <\eqnarray>
    <tformat|<table|<row|<cell|\<tau\>>|<cell|\<leqslant\>>|<cell|\<tau\><rprime|'>
    <text|(if <math|l> is covariant)>>>|<row|<cell|\<tau\><rprime|'>>|<cell|\<leqslant\>>|<cell|\<tau\>
    <text|(if <math|l> is contravariant)>>>>>
  </eqnarray>

  For instance, the constraint <math|<around*|{|<tt|field1>:a,<tt|field2>:b|}>\<leqslant\><around*|{|<tt|field1:>c|}>>
  decomposes into the constraint <math|a\<leqslant\>c> since the constructor
  for structures with fields <tt|field1> and <tt|field2> is a subtype of the
  constructor for structures with only a <tt|field1>. The only common label
  is <tt|field1> which is covariant<\footnote>
    refrefref for variacne
  </footnote>, and so decomposition results in the single constraint
  <math|a\<leqslant\>c>.

  <tt|field2> is essentially ignored in the decomposition and does not appear
  in the decomposed set. This is the correct behaviour, as the given
  constraint does not in fact place any constraints upon the type <math|b>.

  This ignoring of parameters that only appear on one side of the constraint
  has the potential to cause problems. To remedy these, a further requirement
  known as <dfn|convexity of arity> is placed on the structure of the
  constructor lattice. For all constructors <math|c<rsub|1>>,
  <math|c<rsub|2>> and <math|c<rsub|3>> with label sets
  <math|L<around*|(|c<rsub|1>|)>>, <math|L<around*|(|c<rsub|2>|)>> and
  <math|L<around*|(|c<rsub|3>|)>> such that
  <math|c<rsub|1>\<leqslant\>c<rsub|2>\<leqslant\>c<rsub|3>>, it must be the
  case that <math|L<around*|(|c<rsub|1>|)>\<cap\>L<around*|(|c<rsub|3>|)>\<subseteq\>L<around*|(|c<rsub|2>|)>>.
  This means that it is impossible to ignore parameters which will later be
  constrained: as the bound of a constraint moves up the constructor lattice,
  labels will never disappear and then reappear.

  <subsection|Formal definition of constructor lattice>

  Having defined convexity of arity, we are now able to make a formal
  statement of the conditions that must hold on the space of constructors.
  This is important, as it provides a separation between the type inference
  engine and the gory details of the type system and object model. The
  inference engine will work over any set of constructors which satisfy these
  properties, and the concrete types allowed can later be specified as such a
  set.

  Firstly, a <dfn|variance> is either <with|font-shape|italic|positive> (or
  <with|font-shape|italic|covariant>) or <with|font-shape|italic|negative>
  (or <with|font-shape|italic|contravariant>), which are represented as
  <math|+> and <math|-> respectively. The set <math|<around*|{|+,-|}>> will
  be denoted <math|\<bbb-V\>>.

  A <dfn|constructor lattice> consists of:

  <\itemize>
    <item>A set of constructors, <math|\<bbb-C\>> (whose elements are
    <math|c<rsub|1>>, <math|c<rsub|2>>, etc.)

    <item>A set of labels, <math|\<bbb-L\>> (whose elements are
    <math|l<rsub|1>>, <math|l<rsub|2>\<nocomma\>>, etc.)

    <item>A mapping <math|\<bbb-C\>\<rightarrow\>\<cal-P\><around*|(|\<bbb-L\>|)>>,
    called the arity of a constructor

    <item>A mapping <math|\<bbb-L\>\<rightarrow\>\<bbb-V\>>, called the
    variance of a label

    <item>An ordering <math|\<leqslant\>> defined on <math|\<bbb-C\>>, known
    as constructor subtyping
  </itemize>

  It must satisfy the following conditions:

  <\itemize>
    <item><math|\<leqslant\>> forms a lattice

    <item>For all <math|c<rsub|1>,c<rsub|2>,c<rsub|3>\<in\>\<bbb-C\>> such
    that <math|c<rsub|1>\<leqslant\>c<rsub|2>\<leqslant\>c<rsub|3>>,
    <math|arity<around*|(|c<rsub|1>|)>\<cap\>arity<around*|(|c<rsub|3>|)>\<subseteq\>arity<around*|(|c<rsub|2>|)>>
  </itemize>

  Also note that since variance is a property of labels rather than of
  constructors, a label must have the same variance for each constructor in
  which it appears.\ 

  One more note on variances: the set <math|\<bbb-V\>> forms a monoid: the
  monoid of two elements, with <rigid|identity <rigid|<math|+>.>> Thus, we
  have an operation for combining variances:

  <\eqnarray>
    <tformat|<table|<row|<cell|+\<cdot\>+>|<cell|=>|<cell|+>>|<row|<cell|+\<cdot\>->|<cell|=>|<cell|->>|<row|<cell|-\<cdot\>+>|<cell|=>|<cell|->>|<row|<cell|-\<cdot\>->|<cell|=>|<cell|+>>>>
  </eqnarray>

  This expresses the notion that appearing contravariantly in a contravariant
  position causes a term to appear covariantly in the whole type, and will be
  useful for some definitions of the operations on constraint sets in the
  next sections, including the polarity of a variable.

  Generally, a positive variance indicates an output, while a negative
  variance indicates an input. Terms that can be used as both outputs and
  inputs (e.g. mutable variables) require special treatment (see ###).

  <section|Closure>

  A constraint set is <dfn|closed> if it contains all of the consequences of
  its constraints under transitive closure and structural decomposition. That
  is, a constraint set <math|C> is closed if:

  <\itemize>
    <item>For all types <math|a,b,c> such that
    <math|<around*|(|a\<leqslant\>b|)>\<in\>C> and
    <math|<around*|(|b\<leqslant\>c|)>\<in\>C> then
    <math|<around*|(|a\<leqslant\>c|)>\<in\>C>

    <item>For all constructed types <math|\<tau\>,\<tau\><rprime|'>> such
    that <math|<around*|(|\<tau\>\<leqslant\>\<tau\><rprime|'>|)>\<in\>C>
    then <math|subc<around*|(|\<tau\>\<leqslant\>\<tau\><rprime|'>|)>\<subseteq\>C>
  </itemize>

  ###ref###

  Any closed graph is satisfiable, and any satisfiable constraint set can be
  closed. That is, satisfiability can be checked by computing the closure of
  the constraint set and checking that none of the calls to subc require
  decomposition of an unsatisfiable constraint.

  Closure computations form the core activity of the type inference engine.
  We maintain the constraint set in a compact form known as a constraint
  graph, and ensure that at all times the constraint graph is closed. Typing
  errors then manifest themselves by a failure to decompose a constraint, or
  equivalently by adding a constraint between constructed types where the
  left-hand side's constructor is not in fact a subtype of the right-hand
  side's constructor.<chapter|The type inference engine>

  <section|The small terms invariant>

  When representing types inside the inference engine, we use Pottier's
  <cite|pottierphd>,<cite|pottierframework> ``small-terms invariant''. That
  is, we avoid representing complex nested types with multiple layers of
  constructors and instead maintain the invariant that each type is either a
  variable or has only a single layer of constructors. Complex types can be
  reduced to this form by introducing fresh variables to link the parts of a
  type.

  For instance, if we have the type <math|<around*|(|a\<rightarrow\>b|)>\<rightarrow\><around*|(|c\<rightarrow\>d|)>>
  we would not represent it as a nested series of constructed types. Instead,
  we would introduce two new type variables <math|x> and <math|y>, and
  represent the type as <math|x\<rightarrow\>y> with the constraints that
  <math|x=a\<rightarrow\>b> and <math|y=c\<rightarrow\>d>.

  Somewhat more formally, we<\footnote>
    Provisionally, see the next section
  </footnote> define a <dfn|small constructed type> as one that is of the
  form <math|c<around*|(|p,q,r,\<ldots\>|)>> where <math|c> is a type
  constructor and its parameters <math|p,q,r,\<ldots\>> are type variables.
  Any constraint set is equivalent to a constraint set where both sides of
  each constraint are either variables or small constructed types. The latter
  constraint set can be built from the former by breaking down each non-small
  constructed type into a small constructed type and a set of constraints.

  Since our constraint sets don't support equality constraints, we might
  choose to represent constraints like <math|x=a\<rightarrow\>b> as a pair of
  constraints <math|<around*|{|x\<leqslant\>a\<rightarrow\>b\<nocomma\>,a\<rightarrow\>b\<leqslant\>x|}>>.
  ### monopolarity, one constraint will do

  This invariant is roughly equivalent to the standard compiler trick of
  representing all code in three-address form: by introducing lots of fresh
  temporaries, complex expression trees can be reduced to a series of
  statements whose expression part is of height at most one. It serves much
  the same purpose here as it does in an imperative language's compiler:
  implementation is simpler and optimisations based on finding common
  subexpressions are more effective (see ###).

  <section|Merging constraints>

  In our constraint set, we may have many, often redundant constraints on the
  same variable. For instance, consider a function which takes an argument
  (whose type is represented by the variable <math|a>) and accesses the
  fields <tt|field1> and <tt|field2> of that argument before passing it to a
  function which also accesses those fields. This will cause three
  constraints to be generated for <math|a>:

  <\eqnarray>
    <tformat|<table|<row|<cell|a>|<cell|\<leqslant\>>|<cell|<around*|{|<tt|field1>:b|}>>>|<row|<cell|a>|<cell|\<leqslant\>>|<cell|<around*|{|<tt|field2>:c|}>>>|<row|<cell|a>|<cell|\<leqslant\>>|<cell|<around*|{|<tt|field1>:d,<tt|field2>:e|}>>>>>
  </eqnarray>

  This leads to having a large number of essentially redundant constraints.
  Much of the information captured in the first two constraints is also given
  in the third, although we must be careful to keep the variables <math|b>
  and <math|d> (likewise <math|c> and <math|e>) separate since one may have
  weaker requirements than the other.

  What we require is a means of combining bounds which would allow us to
  combine these three constraints into one.

  These operations for combining bounds are the lattice-theoretic greastest
  lower bound (written <math|\<sqcap\>>) and least upper bound (written
  <math|\<sqcup\>>). The greatest lower bound operation combines two
  constraints with a common LHS: if <math|a\<leqslant\>b> and
  <math|a\<leqslant\>c>, then <math|a\<leqslant\>b\<sqcap\>c>, leading to a
  notion of ``closest common subtype''. Similarly, the least upper bound
  operation combines constraints with a common RHS and gives us ``closest
  common supertype''.

  <math|\<sqcap\>> is used to combine constraints on inputs: the input must
  be of type <math|a> and also of type <math|b>, therefore it must be of type
  <math|a\<sqcap\>b>. Similarly, <math|\<sqcup\>> combines constraints on
  outputs: the output may be of type <math|a> or of type <math|b>, hence it
  is of type <math|a\<sqcup\>b>.

  Since we're enforcing the small terms invariant defined above,
  <math|\<sqcap\>> and <math|\<sqcup\>> are quite simply defined<\footnote>
    For a more thorough presentation of the <math|\<sqcup\>> and
    <math|\<sqcap\>> operators (including their generalisation to non-small
    terms), see <cite|pottierphd>.
  </footnote>. We need only to extend the definition of a small constructed
  term to allow <math|\<sqcap\>> and <math|\<sqcup\>> to appear inside
  constructor parameters.

  Before we give a formal description of small constructed terms, however, we
  must introduce polarities of terms and variables and the mono-polarity
  invariant.

  <section|The mono-polarity invariant>

  Before we can describe the optimised representation of constraint sets, we
  must draw a distinction between <dfn|positive> and <dfn|negative> type
  variables and constructed types. A type variable or constructed type
  ``appears positively'' (resp. negatively) if it is on the right-hand side
  (resp. left-hand side) of a <math|\<leqslant\>>-constraint. Variables or
  types appear positively in upper bounds, and negatively in lower bounds.

  This notion is extended naturally to variables appearing in the parameters
  of a small constructed type: if a variable appears in a covariant parameter
  of a type appearing positively (or in a contravariant parameter of a type
  appearing negatively), then it is said to appear positively. Conversely, in
  the other two cases a variable would be said to appear negatively. That is,
  in the constraint

  <\equation*>
    a\<rightarrow\>b\<leqslant\>c\<rightarrow\>d
  </equation*>

  the small constructed type <math|a\<rightarrow\>b> appears negatively,
  while <math|c\<rightarrow\>d> appears positively. The variables <math|a>
  and <math|d> appear positively, while the variables <math|b> and <math|c>
  appear negatively. More formally, consider a variable appearing in a
  parameter of variance <math|v<rsub|1>> to a constructed type appearing in a
  constraint with polarity <math|v<rsub|2>>, where the variance
  <math|v<rsub|1>> and the polarity <math|v<rsub|2>> are both considered to
  be drawn from the same set <math|\<bbb-V\>>. The variable will then be said
  to appear with polarity <math|v<rsub|1>v<rsub|2>>, which is
  <math|v<rsub|1>> and <math|v<rsub|2>> combined via the monoid operation
  defined in ###.

  \;

  \;

  \;

  \;

  Again, postive types or variables correspond to outputs:\ 

  \;

  ##ref### It turns out to be very useful to separate those variables which
  are used as upper bounds (those which appear on the right-hand side of a
  <math|\<leqslant\>>-constraint from those variables which are used as lower
  bounds (which appear on the left-hand side of a
  <math|\<leqslant\>>-constraint).

  We shall call the variables used as upper bounds
  <with|font-shape|italic|positive>, and represent them as
  <math|a<rsup|+>,b<rsup|+>,\<ldots\>>. Similarly, variables used as lower
  bounds will be called <with|font-shape|italic|negative> and represented as
  <math|a<rsup|->,b<rsup|->, \<ldots\>>. Restricting the constraint system so
  that each variable is only\ 

  \;

  \;

  \;

  Having established that no variable may be both positive and negative, we
  may now give a proper definition of variables and small constructed types.
  The variables are divided into two infinite disjoint sets
  <math|\<cal-V\><rsup|+>> (positive variables, denoted
  <math|a<rsup|+>,b<rsup|+>,\<ldots\>>) and <math|\<cal-V\><rsup|->>
  (negative variables, denoted <math|<around*|(|a<rsup|->, b<rsup|->,
  \<ldots\>|)>>. The polarity signs are considered part of the name, there is
  no implied relationship between <math|a<rsup|+>> and <math|a<rsup|->>.

  Likewise, the <dfn|small constructed terms> are divided into two classes.
  Positive small constructed terms will be written
  <math|\<tau\><rsup|+><rsub|1>,\<tau\><rsup|+><rsub|2>,\<ldots\>> while
  negative ones are <math|\<tau\><rsub|1><rsup|->,\<tau\><rsup|-><rsub|2>>.
  We will occasionally abstract over the polarity of a term or variable and
  write <math|a<rsup|v>> or <math|\<tau\><rsup|v>> to mean a term of polarity
  <math|v\<in\>\<bbb-V\>>. Similarly, <math|\<box\><rsup|v>> will be used to
  abstract over <math|\<sqcup\>> and <math|\<sqcap\>>, where
  <math|\<box\><rsup|+>=\<sqcup\>> and <math|\<box\><rsup|->=\<sqcap\>>.

  A small constructed term is defined as:

  <\equation*>
    \<tau\><rsup|v>=c<around*|(|l<rsub|1>:a<rsup|p> \<box\><rsup|p> b<rsup|p>
    \<box\><rsup|p> \<ldots\>\<nocomma\>,l<rsub|2>:c<rsup|q> \<box\><rsup|q>
    d<rsup|q> \<box\><rsup|q>\<ldots\>,\<ldots\>|)> where p =
    variance<around*|(|l<rsub|1>|)>\<cdot\>v\<nocomma\>\<nocomma\>,q=variance<around*|(|l<rsub|2>|)>\<cdot\>v
  </equation*>

  That is, a postive small constructed term is one where the parameters to
  the constructor are given by a set of variables combined with
  <math|\<sqcup\>> in covariant positions and <math|\<sqcap\>> in
  contravariant positions, while a negative small constructed term uses
  <math|\<sqcap\>> in covariant positions and <math|\<sqcup\>> in
  contravariant positions.

  These rules allow any set of positive small constructed terms to merged via
  <math|\<sqcup\>> into a single small constructed term, while any set of
  negative small constructed terms can be merged via <math|\<sqcap\>>.

  \;

  ### formal def. merge

  <section|Garbage collection>

  A constraint set constructed from a program will include many redundant
  constraints. Since we are only interested in checking the satisfiability of
  the constraint graph, we can safely delete any constraint which can't
  possibly cause a failure in the closure algorithm. That is, we can safely
  delete any constraint which doesn't actually constrain the set of accepted
  programs.

  The most obvious candidates for deletion are the ``unreachable''
  constraints. Suppose we have the rc type\ 

  <\equation*>
    a\<rightarrow\>b\\a\<leqslant\>b,c\<leqslant\>d\<rightarrow\>e
  </equation*>

  The type variables <math|c>, <math|d> and <math|e> clearly do not constrain
  the type at all. We can generalise this idea a little by defining a
  preliminary notion of <dfn|reachability> of type variables: a type variable
  is reachable if it is present in the type part of the rc type (left of the
  <math|\\>), or if it is present in a constraint with one or more reachable
  variables. This notion, similar to the standard notion of garbage
  collection of data structures, allows us to delete the variables <math|c>,
  <math|d> and <math|e> and the constraints in which they appear.

  \;

  \;

  For a somewhat more interesting example, consider the type

  <\equation*>
    a\<rightarrow\>b\\a\<leqslant\>b,a\<leqslant\>c,b\<leqslant\>c
  </equation*>

  By our previous definition of reachability, the variables <math|a>,
  <math|b> and <math|c> are all reachable. However, the constraints
  <math|a\<leqslant\>c> and <math|b\<leqslant\>c> do not in fact constrain
  the solution space at all.\ 

  \;

  \;

  \;

  <section|Representing the constraint set>

  <math|>Thanks to the garbage collection algorithm, we can vastly limit the
  amount of information we need to store for each variable. In particular,
  for any positive variable <math|a<rsup|+>> we need only store constraints
  of the form <math|\<tau\><rsup|+>\<leqslant\>a<rsup|+>> and
  <math|a<rsup|->\<leqslant\>a<rsup|+>>. Since all of the constraints of the
  first form can be merged into a single one via <math|\<sqcup\>>, all we
  need to store is a single positive small constructed term (written
  <math|\<Omega\><rsup|\<tau\>><around*|(|a<rsup|+>|)>>) and a set of
  negative variables (written <math|\<Omega\><rsup|\<cal-V\>><around*|(|a<rsup|+>|)>>).
  We extend this to negative variables and end up with:

  <\eqnarray>
    <tformat|<table|<row|<cell|\<Omega\><rsup|\<tau\>><around*|(|a<rsup|v>|)>>|<cell|=>|<cell|\<tau\><rsup|v>>>|<row|<cell|\<Omega\><rsup|\<cal-V\>><around*|(|a<rsup|v>|)>>|<cell|\<subseteq\>>|<cell|\<cal-V\><rsup|-v>>>>>
  </eqnarray>

  In the notation of <math|<cite|pottierphd|pottierframework>>
  <math|\<Omega\><rsup|\<tau\>><around*|(|a<rsup|+>|)>=\<tau\><rsup|+>> would
  be represented as <math|C<rsup|\<uparrow\>><around*|(|a<rsup|+>|)>=\<tau\><rsup|+>>,
  while in <cite|subconst> it would be <math|\<tau\><rsup|+>\<leqslant\>a<rsup|+>\<in\>K>.
  The advantage of this representation is that we can store half as many
  bounds by entirely ignoring <math|C<rsup|\<downarrow\>><around*|(|a<rsup|+>|)>>,
  since the mono-polarity invariant ensures that it contains no information
  that would not be immediately removed by garbage collection.

  <subsection|Implementation detail>

  We now present an interesting trick for performing the garbage collection
  algorithm. Since the polarity of each variable is known, GC is only
  concerned with calculating reachability. Reachability must propagate
  through constructed bounds (<math|\<Omega\><rsup|\<tau\>><around*|(|a<rsup|v>|)>>)
  but not through variable bounds (<math|\<Omega\><rsup|\<cal-V\>><around*|(|a<rsup|v>|)>>).

  In an implementation language supporting <dfn|weak references> ### such as
  Haskell ###, we can implement this by using weak references to store the
  elements of <math|\<Omega\><rsup|\<cal-V\>><around*|(|a<rsup|v>|)>>. This
  causes the Haskell garbage collector to collect a variable and destroy weak
  references to it when it becomes unreachable except through weak
  references. So, this type simplification is performed automatically by the
  system garbage collector.

  <section|The incremental closure algorithm>

  When we want to add a constraint on existing variables to the constraint
  graph, we need to ensure that the resulting constraint graph is closed (as
  definined in ###). Since our garbage collection techniques and the
  simplification algorithms described later depend on the graph being closed,
  we must compute the closure of the graph incrementally.

  There are four types of constraint that our constraint generation rules may
  produce:

  <\eqnarray>
    <tformat|<table|<row|<cell|a<rsup|->>|<cell|\<leqslant\>>|<cell|a<rsup|+>\<nocomma\>\<nocomma\><text|,
    for some fresh <math|a<rsup|->> and <math|a<rsup|+>>>>>|<row|<cell|\<tau\><rsup|+>>|<cell|\<leqslant\>>|<cell|a<rsup|+><text|,
    for some fresh <math|a<rsup|+>>>>>|<row|<cell|a<rsup|->>|<cell|\<leqslant\>>|<cell|\<tau\><rsup|-><text|,
    for some fresh <math|a<rsup|->>>>>|<row|<cell|a<rsup|+>>|<cell|\<leqslant\>>|<cell|a<rsup|->>>>>
  </eqnarray>

  The first three rules are trivial to handle: since the variables
  <math|a<rsup|->> and <math|a<rsup|+>> are fresh, closure is guaranteed
  since decomposition yields no new constraints. They are added simply by
  allocating space for the new variable(s) and setting
  <math|\<Omega\><rsup|\<tau\>>> and <math|\<Omega\><rsup|\<cal-V\>>>
  appropriately.

  The last example is the one which requires the incremental closure
  algorithm. The algorithm here is the one presented and proved correct in
  ###citecitecite###, adapted to our constraint graph representation.

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|addConstraint(<math|a<rsup|+>>,<math|b<rsup|->>):>>|<row|<cell|
  \ for each <math|c<rsup|->\<in\>\<Omega\><rsup|\<cal-V\>><around*|(|a<rsup|+>|)>>,
  <math|d<rsup|+>\<in\>\<Omega\><rsup|\<cal-V\>><around*|(|b<rsup|->|)>>:>>|<row|<cell|
  \ \ \ \ add <math|c<rsup|->> to <math|\<Omega\><rsup|\<cal-V\>><around*|(|d<rsup|+>|)>>>>|<row|<cell|
  \ \ \ \ add <math|d<rsup|+>> to <with|mode|math|\<Omega\><rsup|\<cal-V\>><around*|(|c<rsup|->|)>>>>|<row|<cell|
  \ \ \ \ set <with|mode|math|\<Omega\><rsup|\<tau\>><around*|(|a<rsup|+>|)>>
  := <with|mode|math|\<Omega\><rsup|\<tau\>><around*|(|a<rsup|+>|)>\<sqcup\>\<Omega\><rsup|\<tau\>><around*|(|d<rsup|+>|)>>>>|<row|<cell|
  \ \ \ \ set <with|mode|math|\<Omega\><rsup|\<tau\>><around*|(|b<rsup|->|)>>
  := <with|mode|math|\<Omega\><rsup|\<tau\>><around*|(|b<rsup|->|)>\<sqcap\>\<Omega\><rsup|\<tau\>><around*|(|c<rsup|->|)>>>>|<row|<cell|>>|<row|<cell|
  \ for each constraint <math|e<rsup|+>\<leqslant\>f<rsup|->\<in\>subc<around*|(|\<Omega\><rsup|\<tau\>><around*|(|a<rsup|+>|)>\<leqslant\>\<Omega\><rsup|\<tau\>><around*|(|b<rsup|->|)>|)>>:>>|<row|<cell|
  \ \ \ \ addConstraint(<math|e<rsup|+>>,<math|f<rsup|->>)>>>>>>>

  <section|Type simplification and optimisation>

  Since an rc type essentially encodes a constraint for each operation in the
  program source, they can grow to be very large. Due to the decomposition of
  constraints in the incremental closure algorithm, the size of the rc type
  can actually grow faster than linearly in the program size. As well as
  being unweildy and slow to manipulate, such large types are very difficult
  to understand if an error occurs or if the programmer wants to display the
  type of a function. Some method is needed for optimising them.

  Several methods for optimising rc types have appeared in the literature
  ###cite###. Many of these (such as ###cite transitive collapsing###) are in
  fact unnecessary in this system since they are subsumed by the garbage
  collection done implicitly in the constraint graph. We use two other type
  optimisation methods, canonisation and minimisation.

  Canonisation is the removal of <math|\<sqcap\>> and <math|\<sqcup\>>-terms
  from small constucted terms in the constraint graph. As we shall see, any
  constraint graph is equivalent to a constraint graph (possibly with more
  variables) which does not include those two operations. A graph in this
  form will be referred to as ``canonical''. The algorithm is somewhat
  reminiscent of the algorithm to convert a non-deterministic finite state
  automaton into a deterministic one, by adding new states to represent sets
  of states in the original.

  Minimisation is essentially a form of common subexpression elimination,
  applied to type terms to merge redundant variables. The algorithm itself is
  very close to Hopcroft's algorithm for minimising the number of states in a
  finite state automaton<cite|hopcroftmin>. It expects a canonical constraint
  graph, and so canonisation must be run before minimisation.

  Smith and Trifonov <cite|subconst> defined canonisation, and Pottier
  <cite|pottierphd> defined canonisation and minimisation. Our implementation
  is heavily based on Pottier's: the algorithms are identical, but the
  justification for their validity is marginally different as our constraint
  graphs have a simpler form.

  In <cite|pottierphd>, Pottier's garbage collection does not necessarily
  produce a closed output constraint graph given a closed input. He then
  defines a weaker notion of closure known as <with|font-shape|italic|simple
  closure> and proves that it is preserved by the canonisation and garbage
  collection processes. In this presentation, due to application of the
  mono-polarity invariant globally and integration of the garbage collection
  algorithm with incremental closure, we know that all constraint graphs are
  always closed.

  All of our constraint graphs are maintained in the simple form referred to
  in <cite|pottierphd> as ``perfect'', and hence the results therein about
  the validity of the various optimisations (garbage collection,
  canonisation, minimisation) still hold for this system.

  <subsection|Canonisation>

  The canonisation algorithm is as follows. Introduce new variables to
  represent all subsets of at least two variables:
  <math|<around*|{|S<rsup|->\|S\<subseteq\>\<cal-V\><rsup|->,<around*|\||S|\|>\<geqslant\>2|}>>
  and <math|<around*|{|S<rsup|+>\|S\<subseteq\>\<cal-V\><rsup|+>,<around*|\||S|\|>\<geqslant\>2|}>>.
  Set:

  <\eqnarray>
    <tformat|<table|<row|<cell|\<Omega\><rsup|\<tau\>><around*|(|S<rsup|v>|)>>|<cell|=>|<cell|<big-around|\<box\>|<rsub|a<rsup|v>\<in\>S<rsup|>>\<Omega\><rsup|\<tau\>><around*|(|a<rsup|v>|)>>>>|<row|<cell|\<Omega\><rsup|\<cal-V\>><around*|(|S<rsup|v>|)>>|<cell|=>|<cell|<big-around|\<cup\>|<rsub|a<rsup|v>\<in\>S<rsup|>>\<Omega\><rsup|\<cal-V\>><around*|(|a<rsup|v>|)>>>>>>
  </eqnarray>

  Thus, <math|S<rsup|v>> represents a merging of the constraints present
  about each <math|a<rsup|v>\<in\>S>. Then, each set of variables with more
  than two elements appearing in a constructed term may be removed and
  replaced with the singleton set <math|<around*|{|S<rsup|v>|}>>.

  Of course, the actual implementation canonisation algorithm does not create
  all of the variables <math|S<rsup|+>,S<rsup|->>. Instead, the new variables
  are created lazily as a term is found which requires them, and the actual
  set of new variables inserted is calculated as a least-fixed-point.

  It would seem that canonisation always increases the number of terms in the
  constraint graph by adding more variables. This is not necessarily the case
  as the algorithm, while adding new variables, may cause more variables to
  become garbage and be removed from the constraint graph.

  For instance, consider the following function:

  <\center>
    <\verbatim>
      <tabular|<tformat|<table|<row|<cell|def f(x) do>>|<row|<cell|
      \ x.doSomething(4)>>|<row|<cell| \ x.doSomething(4)>>|<row|<cell|end>>>>>
    </verbatim>
  </center>

  As each operation in the function introduces new constraints into the
  constraint graph, after inference has processed this function there will
  likely be two copies of the constraints which indicate that <tt|x> must
  include a <tt|doSomething> method. These constraints will be merged into a
  single constraint, but that constraint will include a <math|\<sqcap\>>
  term.

  The initial constraint graph for this function might look like:

  <\eqnarray>
    <tformat|<table|<row|<cell|a<rsup|->\<rightarrow\>b<rsup|+>>|<cell|\<leqslant\>>|<cell|<tt|f><rsup|+>>>|<row|<cell|a<rsup|->>|<cell|\<leqslant\>>|<cell|<around*|{|<tt|doSomething>:c<rsup|->\<sqcap\>d<rsup|->|}>>>|<row|<cell|<around*|(||)>>|<cell|\<leqslant\>>|<cell|b<rsup|+>>>|<row|<cell|c<rsup|->>|<cell|\<leqslant\>>|<cell|e<rsup|+>\<rightarrow\>f<rsup|->>>|<row|<cell|d<rsup|->>|<cell|\<leqslant\>>|<cell|g<rsup|+>\<rightarrow\>h<rsup|->>>|<row|<cell|<tt|int>>|<cell|\<leqslant\>>|<cell|e<rsup|+>>>|<row|<cell|<tt|int>>|<cell|\<leqslant\>>|<cell|g<rsup|+>>>>>
  </eqnarray>

  Canonisation will introduce a new variable (call it <math|x<rsup|->>) to
  replace <math|c<rsup|->\<sqcap\>d<rsup|->>. Its constructed bound will be
  the merged bounds of <math|c<rsup|->> and <math|d<rsup|->>, which will be
  <math|<around*|(|e<rsup|+>\<sqcup\>g<rsup|+>|)>\<rightarrow\><around*|(|f<rsup|->\<sqcap\>h<rsup|->|)>>.
  The algorithm then introduces variables <math|y<rsup|+>> and
  <math|z<rsup|->> to stand for <math|e<rsup|+>\<sqcup\>g<rsup|+>> and
  <math|f<rsup|->\<sqcap\>h<rsup|->>. Thus, the final constraint graph
  becomes:

  <\eqnarray>
    <tformat|<table|<row|<cell|a<rsup|->\<rightarrow\>b<rsup|+>>|<cell|\<leqslant\>>|<cell|<tt|f><rsup|+>>>|<row|<cell|a<rsup|->>|<cell|\<leqslant\>>|<cell|<around*|{|<tt|doSomething>:x<rsup|->|}>>>|<row|<cell|<around*|(||)>>|<cell|\<leqslant\>>|<cell|b<rsup|+>>>|<row|<cell|x<rsup|->>|<cell|\<leqslant\>>|<cell|y<rsup|+>\<rightarrow\>z<rsup|->>>|<row|<cell|<tt|int>>|<cell|\<leqslant\>>|<cell|y<rsup|+>>>>>
  </eqnarray>

  which is actually smaller than the original graph since garbage collection
  removes the original <math|c<rsup|->,d<rsup|->,e<rsup|+>,g<rsup|+>,f<rsup|->>
  and <math|h<rsup|->> variables.

  <subsection|Minimisation>

  The minimisation algorithm in <cite|pottierphd> grew out of other work by
  the same author (###) and others (###,###) based on finding variable
  substitutions which simplify the constraint graph while preserving its
  semantics.

  These algorithms sought to find a substitution which mapped mutiple
  variables to the same variable, and so reduced the number of variables in
  the constraint graph. Instead of using <with|font-shape|italic|ad-hoc>
  heuristics to find this substitution, the minimisation algorithm seeks
  instead to find the coarsest possible equivalence relation such that any
  two variables which are in the same equivalence class can be merged into a
  single variable without changing the semantics of the graph.

  An equivalence relation <math|\<equiv\>> is <dfn|compatible> with an rc
  type <math|\<sigma\>> if, for all variables <math|a,b> in <math|\<sigma\>>
  such that <math|a\<equiv\>b>:

  <\itemize>
    <item><math|a> and <math|b> have the same polarity

    <item><math|C<around*|(|a|)>\<equiv\>C<around*|(|b|)>> where equivalence
    of small canonical constructed terms means they have the same constructor
    and the parameters are pairwise equivalent

    <item><math|V<around*|(|a|)>=V<around*|(|b|)>>
  </itemize>

  The minimisation algorithm finds the coarsest compatible equivalence
  relation and applies it to the constraint graph. This relation can be
  computed by a simple fixpoint calculation. We start off with an extremely
  coarse, probably incompatible relation: all of the positive variables are
  equivalent to each other and all of the negative variables are equivalent
  to each other.

  Next, for each equivalence class in our tentative relation, we try to split
  the equivalence class by finding variables which are equivalent which cause
  the relation to be incompatible. We then split all such equivalence classes
  to resolve the compatibility.

  We repeat the previous step until we can no longer split equivalence
  classes. Since the equivalence relations on the set of variables form a
  lattice under refinement, and this splitting procedure is monotonic with
  respect to this lattice (it always produces a finer relation), it must have
  a least fixed point.

  Since the lattice is finite, we can be guaranteed that we eventually reach
  this fixpoint and so produce the coarsest compatible relation. We then
  apply this relation by choosing one element of each equivalence class as
  the representative, and replacing each variable with its equivalence
  class's representative. This causes all of the other variables in the graph
  to become garbage and be removed.

  As an example, consider the following function which operates on
  singly-linked lists:

  <\center>
    <\verbatim>
      <tabular|<tformat|<table|<row|<cell|def f(x) do>>|<row|<cell| \ var y =
      x>>|<row|<cell| \ if true do>>|<row|<cell| \ \ \ y =
      x.next>>|<row|<cell| \ else do>>|<row|<cell| \ \ \ y =
      x.next.next>>|<row|<cell| \ end>>|<row|<cell| \ y =
      y.next>>|<row|<cell| \ return y>>|<row|<cell|end>>>>>
    </verbatim>
  </center>

  The condition on the ``if'' is simply <tt|true> to avoid introducing
  boolean types; the types are independent of the execution path. The point
  of this example is that the branches of the if statement combine
  <tt|x.next> and <tt|x.next.next>, thus indicating that <tt|x> has a
  recursive type. The <tt|x.next.next> expression will lead to a complex
  nested type, which must be merged with the rest of the information gleaned
  from the program structure about <tt|x>.

  So, the <brick> type inferencer generates a type with many redundancies
  when given this function. The actual type generated, after canonisation but
  before minimisation has run, is:

  <\eqnarray>
    <tformat|<table|<row|<cell|a<rsup|->\<rightarrow\>b<rsup|+>>|<cell|\\>|<cell|a<rsup|->\<leqslant\>b<rsup|+>\<nocomma\>,a<rsup|->\<leqslant\><around*|{|<tt|next>:c<rsup|->|}>\<nocomma\>,c<rsup|->\<leqslant\>b<rsup|+>,c<rsup|->\<leqslant\><around*|{|<tt|next>:d<rsup|->|}>,d<rsup|->\<leqslant\>b<rsup|+>,d<rsup|->\<leqslant\><around*|{|<tt|next>:e<rsup|->|}>>>|<row|<cell|>|<cell|>|<cell|e<rsup|->\<leqslant\>b<rsup|+>\<nocomma\>,e<rsup|->\<leqslant\><around*|{|<tt|next>:f<rsup|->|}>,f<rsup|->\<leqslant\>b<rsup|+>\<nocomma\>,f<rsup|->\<leqslant\><around*|{|<tt|next>:g<rsup|->|}>,g<rsup|->\<leqslant\>b<rsup|+>,g<rsup|->\<leqslant\><around*|{|<tt|next>:g<rsup|->|}>>>>>
  </eqnarray>

  What has happened is that the inference engine has created separate
  constraints for each of the unrollings of
  <math|\<mu\>x.<around*|{|<tt|next>:x|}>> used in the function. After
  minimisation has run, the unrollings are noticed to be compatible and the
  constraint graph is collapsed down to:

  <\eqnarray>
    <tformat|<table|<row|<cell|a<rsup|->\<rightarrow\>b<rsup|+>>|<cell|\\>|<cell|a<rsup|->\<leqslant\>b<rsup|+>,a<rsup|->\<leqslant\><around*|{|<tt|next>:a<rsup|->|}>>>>>
  </eqnarray>

  This constraint graph is the optimal representation. For display to the
  user, using the techniques in ###, this type would be rendered simply as
  <math|a\<rightarrow\>a\\a\<leqslant\><around*|{|<tt|next>:a|}>>.

  <section|rc type subsumption>

  ### polarity issues in this section

  ### should this move?

  Occasionally the question may arise of whether one rc type is a subtype of
  another. This is not needed for most type inferencing operations, since the
  closure algorithm correctly combines constraint sets ###. However, there
  are situations in which we need to decide this relation. In particular, a
  language which allows optional type annotations (which might be rc types
  with constraints and free variables) will need to check those type
  annotations against the inferred type of the program. Also, a language with
  some notion of an interface type which allows multiple specialised
  implementations of the interface (such as Haskell's typeclasses or Java's
  interfaces) will need to be able to check whether a given implementation of
  an interface in fact conforms to the type requirements of that inferface.

  The closure algorithm will not suffice in this case: attempting to check
  whether an implementation conforms to a previously-declared interface by
  adding constraints to the constraint set would result in the interface
  being constrained to meet the implementation. We need not to constrain the
  interface type to fit the implementation, but simply to verify that the
  implementation type corresponds to the interface as it is written.

  \;

  \;

  <subsection|Entailment>

  A constraint graph <math|C> entails a constraint
  <math|x<rsup|->\<leqslant\>y<rsup|+>> if, for all solutions to <math|C> the
  type assigned to <math|x<rsup|->> is a subtype of that assigned to
  <math|y<rsup|+>>. This is a more subtle notion than the constraint
  <math|x<rsup|->\<leqslant\>y<rsup|+>> simply being present in the
  constraint set: it is possible for the constraint not to be explicity
  stated but still necessarily hold in any solution.

  Incremental closure is used to add a constraint to the constraint graph,
  whereas entailment is used to ask whether a constraint is ``already
  there''.

  ## example ##

  Entailment is not efficiently decidable(###). However, there is an
  approximation algorithm (sound, but not complete) which will efficiently
  decide a sound, but not complete, approximation to entailment. ###.

  <subsection|Subsumption>

  ###

  As shown in ###pottier###, the garbage collection algorithm can
  alternatively be seen as simulating a run of the subsumption algorithm to
  prove that <math|\<sigma\>\<leqslant\><rsup|\<forall\>>\<sigma\>>, and
  removing all of those constraints which are not necessary for the
  subsumption algorithm to give a positive result.

  \;

  \;

  \;

  <section|Display>

  The representation of constraint graphs internal to the typechecker is
  designed for efficiency and ease of implementation. This representation is,
  however, almost entirely incomprehensible to a human programmer. In
  particular, the small-terms invariant results in a constraint graph which
  contains only small constructed terms and so requires a large number of
  intermediate variables which serve no purpose other than to link small
  terms (this is analogous to the unreadability of code where all of the
  expressions have been converted to three-address code).

  So, we perform some simplifications before displaying a type to the user.
  These simplifications are not performed on the internal representation as
  they violate the small-terms invariant or the mono-polarity invariant in
  pursuit of readable type expressions. By way of examples, consider the
  following two functions (written in <brick> syntax):

  <center|<verbatim|<tabular|<tformat|<cwith|1|3|2|2|cell-lborder|0.2pt>|<table|<row|<cell|def
  f1(x) do>|<cell|def f2(x) do>>|<row|<cell| \ x.increment(5)>|<cell|
  \ return x>>|<row|<cell|end>|<cell|end>>>>>>>

  The function <tt|f1> takes an object that has an <tt|increment> method
  taking an int, and returns nothing. The function <tt|f2> is the identity
  function.

  The constraint graph for <tt|f1> will look something like this:

  <\eqnarray>
    <tformat|<table|<row|<cell|a<rsup|->\<rightarrow\>b<rsup|+>>|<cell|\<leqslant\>>|<cell|<tt|f1><rsup|+>>>|<row|<cell|a<rsup|->>|<cell|\<leqslant\>>|<cell|<around*|{|<tt|increment>:c<rsup|->|}>>>|<row|<cell|<around*|(||)>>|<cell|\<leqslant\>>|<cell|b<rsup|+>>>|<row|<cell|c<rsup|->>|<cell|\<leqslant\>>|<cell|d<rsup|+>\<rightarrow\>e<rsup|->>>|<row|<cell|<tt|int>>|<cell|\<leqslant\>>|<cell|d<rsup|+>>>>>
  </eqnarray>

  While the constraint graph for <tt|f2> would look something like

  <\eqnarray>
    <tformat|<table|<row|<cell|a<rsup|->\<rightarrow\>b<rsup|+>>|<cell|\<leqslant\>>|<cell|<tt|f2><rsup|+>>>|<row|<cell|a<rsup|->>|<cell|\<leqslant\>>|<cell|b<rsup|+>>>>>
  </eqnarray>

  While convenient for internal manipulations, these graphs are not at all
  readable for a programmer!

  The graph of <tt|f1> has many variables which give no information other
  than to split the type into small terms. For instance, <math|c<rsup|->>
  only exists to link the function type <math|d<rsup|+>\<rightarrow\>e<rsup|->>
  into the <rigid|<tt|increment>> field of the argument type. Also, the
  variable <math|e<rsup|->> is not constrained at all (since the result of
  <tt|x.increment> is never used, the programmer doesn't care about the
  variable used to represent its type).

  The graph of <tt|f2> has a slightly different problem: to comply with the
  mono-polarity invariant, we must use different type variables to describe
  the argument and the result of the function. The programmer has no such
  qualms, and would prefer to see the type as the more natural
  <rigid|<math|a\<rightarrow\>a>.>\ 

  Both of these type graphs can be made readable by applying a simple
  substitution: replacing type variables with their unique bounds. ### def in
  terms of graph, cite, safety, varvar

  This applies the following substitutions to <math|<tt|f1><rsup|+>>:

  <\eqnarray>
    <tformat|<table|<row|<cell|<tt|f1><rsup|+>>|<cell|\<mapsto\>>|<cell|a<rsup|->\<rightarrow\>b<rsup|+>>>|<row|<cell|a<rsup|->>|<cell|\<mapsto\>>|<cell|<around*|{|<tt|increment>:c<rsup|->|}>>>|<row|<cell|b<rsup|+>>|<cell|\<mapsto\>>|<cell|<around*|(||)>>>|<row|<cell|c<rsup|->>|<cell|\<mapsto\>>|<cell|d<rsup|+>\<rightarrow\>e<rsup|->>>|<row|<cell|d<rsup|+>>|<cell|\<mapsto\>>|<cell|<tt|int>>>|<row|<cell|e<rsup|->>|<cell|\<mapsto\>>|<cell|\<top\>>>>>
  </eqnarray>

  Thus, the type of <tt|f1> is displayed to the user as

  <\equation*>
    <around*|{|<tt|increment>:<tt|int>\<rightarrow\>\<top\>|}>\<rightarrow\><around*|(||)>
  </equation*>

  which is much more readable. Similarly, the following substitution is
  applied to <math|<tt|f2><rsup|+>>:

  <\eqnarray>
    <tformat|<table|<row|<cell|<tt|f2><rsup|+>>|<cell|\<mapsto\>>|<cell|a<rsup|->\<rightarrow\>b<rsup|+>>>|<row|<cell|b<rsup|+>>|<cell|\<mapsto\>>|<cell|a<rsup|->>>>>
  </eqnarray>

  The choice of <math|b<rsup|+>\<mapsto\>a<rsup|->> was arbitrary, the
  algorithm could equally have been the other way around. So, the type of
  <tt|f2> is displayed to the user (without polarity indicators) as:

  <\equation*>
    a\<rightarrow\>a
  </equation*>

  <chapter|... (objects, nom/struct, constraintgen)>

  <section|Generalised and ungeneralised bindings>

  A binding of a name may be <with|font-shape|italic|generalised>. This
  allows it to be used with multiple different incompatible types at
  different points in the program. ### xref ### For instance, consider this
  function:

  <center|<\verbatim>
    <tabular|<tformat|<table|<row|<cell|def id(x) do>>|<row|<cell| \ return
    x>>|<row|<cell|end>>>>>
  </verbatim>>

  This function has type <math|a\<rightarrow\>a>, for all values of <math|a>.
  It may be used with different instantiations of this type scheme at
  different points in the program: in one instance it may be passed a string
  and return a string, and in another it may be passed an integer and return
  an integer.

  Generalisation essentially means that the type of the term is inferred
  based on its definition but not on its uses. Each use must be compatible
  with the definition, but the uses need not be compatible with each other.\ 

  An <dfn|ungeneralised> binding, on the other hand, infers its type based on
  both its definition and its uses. In the example above, if <tt|id> were
  called with both string and integer arguments at different points in the
  program, it would be inferred the type <math|\<top\>\<rightarrow\>\<top\>>.
  That is, its argument would be of any type, and it would return an argument
  about which nothing could be proven.

  Typing ungeneralised bindings is simpler as all of the information about
  the binding can be merged into a single set of constraints. Generalised
  bindings offer more flexibility since they allow terms to be used in
  different ways at different points in the program. Unfortuneatly, we can't
  generalise everything: type inference with first-class generalised bindings
  is undecidable<\footnote>
    Although, by requiring type annotations in situations requiring
    first-class generalised bindings, the typing problem can be made
    tractable, see <cite|ranknml|ranknhaskell> for examples.
  </footnote>. The variables bound as function arguments must therefore be
  ungeneralised, and as we'll see in the next section, due to imperative
  constructs some other classes of binding must be ungeneralised.

  <subsection|The value restriction>

  \;

  In languages like Haskell, every <with|font-family|tt|let>-bound and all
  toplevel bindings are generalised<\footnote>
    Generalised bindings are \ known as <with|font-family|tt|let>-bindings in
    functional languages.
  </footnote>. This poses a well-known problem<cite|valuerestriction|valurestriction2>
  in the presence of mutable references and side-effects. Consider this
  example:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|def obj = {list =
  []}>>>>>>>

  This creates an object containing a single mutable field which is an empty
  list. If we generalise the type, we infer that
  <with|font-family|tt|obj.list> is a list of element type <math|a>. That is,
  it may be used with any possible element type.

  This causes a problem when we refer to <with|font-family|tt|obj>. If we
  store an integer into <with|font-family|tt|obj.list>, the typechecker will
  instantiate <math|a> as <with|font-family|tt|int>, and the program will
  pass the typechecker. If we read a string from
  <with|font-family|tt|obj.list>, the typechecker will instantiate <math|a>
  as <with|font-family|tt|string>, and the program will pass the typechecker.
  But the program will crash since what's written as an
  <with|font-family|tt|int> can't be read as a <with|font-family|tt|string>!

  The problem is that having mutable references allows communication between
  different uses of a binding. Thus, the uses of objects containing mutable
  fields must be compatible, and hence the binding can't be generalised.

  There are a number of standard techniques used to mitigate this problem.
  Tofte's system<cite|toftepoly>, used in many ML implementations, separates
  the type variables into two categories: the <dfn|imperative> and the
  <dfn|applicative> type variables. A binding will not be generalised if it
  contains imperative type variables. There are various increasingly complex
  extensions of this system, such as Leroy's system<cite|leroypoly>, which
  all aim to generalise as many bindings as possible. They have the property
  that any purely functional term can be generalised, as is the case in
  languages without direct imperative features.

  The <dfn|value restriction><cite|valuerestriction|valuerestriction2> is a
  much simpler alternative. Using it, only values (that is, literal
  constants, functions or immutable data structures consisting only of other
  values) may be generalised in a binding. This results in a certain loss of
  generality: some terms which could previously be generalised cannot with
  this restriction in place. However, simple changes to such terms (making
  them functions, essentially) make them generalisable, so it seems to be
  worthwhile for the reduction in complexity of the type system compared to
  other solutions.

  Finally, the value restriction is much more natural in <brick>, a language
  where imperative constructs are pervasive. Since almost all terms include
  some imperative side-effects, separating imperative and applicative type
  variables would have little benefit as purely applicative typings would be
  difficult to achieve.

  In fact, <brick> adopts an even more restrictive version of the value
  restriction, on the basis that it should be easier to understand: only
  function bindings (those of the form ``<tt|def f(x)>'') and classes are
  generalised.

  <section|Optional type annotations>

  Due to the type inference system, <brick> programs need not provide
  explicit type annotations. Generally, this is an improvement over
  fully-annotated code as the signal-to-noise ratio increases and less of the
  code consists of repetitive type declarations.

  However, often it is valuable to be able to provide some annotations, as a
  form of machine-checked documentation. This is common practice in the
  Haskell programming language (which also supports global type inference),
  where annotations are commonly placed on top-level functions as
  documentation of the interface provided.

  Annotations may also be used to voluntarily restrict a piece of code with a
  very general type to a specific subtype. By the behavioural subtyping rule,
  a term with a given type can also be considered to have any supertype of
  that type. A programmer, after writing a program fragment with a particular
  type <math|t>, may want to explicitly limit the uses of that fragment as
  though it in fact had type <math|t<rprime|'>>, where
  <math|t\<leqslant\>t<rprime|'>>. This could be done to make it more clear
  what the programmer's intentions were and to indicate to a user what the
  function's purpose is.

  As an example, consider a program which uses the type
  <math|<around*|{|<tt|x>:<tt|float>,<tt|y>:<tt|float>|}>> to represent
  points on a 2-D plane. The programmer writes a function <tt|get_x> to
  extract the <tt|x> co-ordinate of a point<\footnote>
    Ignoring for a moment that <tt|get_x> is actually
    <with|font-shape|italic|longer> than the expression it abstracts!
  </footnote>:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|def get_x(point)
  do>>|<row|<cell| \ return point.x>>|<row|<cell|end>>>>>>>

  This will be given the type <math|<around*|{|<tt|x>:a|}>\<rightarrow\>a> by
  inference. However, the programmer wishes to indicate that this function is
  to be used only with points, and not with merely any structure which
  declares an <math|x> coordinate. So, the function can be rewritten to
  include specific annotations:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|def
  get_x(point:{x:float,y:float}):float do>>|<row|<cell| \ return
  point.x>>|<row|<cell|end>>>>>>>

  In this case, the function has type <math|<around*|{|<tt|x>:<tt|float>,<tt|y>:<tt|float>|}>\<rightarrow\><tt|float>>,
  which better indicates the programmer's intentions. Since
  <math|<around*|{|<tt|x>:<tt|float>,<tt|y>:<tt|float>|}>\<rightarrow\><tt|float>>
  is a supertype of <math|<around*|{|<tt|x>:a|}>\<rightarrow\>a>, the
  annotation is valid.

  <subsection|Checking type annotations>

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  For reasons outlined in the introduction###, it was a design goal to
  support both structural and nominative typing.

  <brick> is not the first language to seek to combine nominative and
  structural typing for objects. Whiteoak<cite|whiteoak> is an extension of
  the Java programming language with, amongst other features, structural
  subtyping. Their implementation of structural subtyping is somewhat
  complex, as it is necessary to shoehorn the new feature into the existing
  nominatively-typed Java virtual machine. Since Java requires full type
  annotations, this is done by detecting all points in the program where a
  nominative type is converted to a structural type and generating code for
  wrapper objects at rutime.

  A similar effort was undertaken to add structural subtyping to the language
  Scala<cite|scalastructural> which also runs on the Java virtual machine.
  This included a more sophisticated implementation, combining techniques
  based on runtime code generation and Java's reflection mechanism.

  The Unity language<cite|unitynomstruct> combines nominative and structural
  subtyping in a way somewhat closer to the technique used in <brick>, as
  well as providing other features such as external dispatch (aka
  multi-methods) and a full proof of soundness. It does not attempt to tackle
  the problem of integrating type inference with this system.

  \;

  ### footnote that multiple subtyping is vital, regardless of whether
  multiple inheritance is a good thing ###

  Here is a concrete example: Suppose we have class
  <with|font-family|tt|Cowboy> and class <with|font-family|tt|Shape>. Both of
  these have a method <with|font-family|tt|draw>, with very different
  meanings. Class <with|font-family|tt|Square> is a subtype of
  <with|font-family|tt|Shape>, implementing the <with|font-family|tt|draw>
  defined by shapes.

  Now suppose we define three functions:

  \;

  <center|<with|font-family|tt|<tabular|<tformat|<cwith|1|3|2|3|cell-lborder|0.2pt>|<cwith|1|3|1|3|cell-width|5.1cm>|<cwith|1|3|1|3|cell-hmode|exact>|<table|<row|<cell|def
  drawany(x) do>|<cell|def render(x: Shape) do>|<cell|def brandish(x: Cowboy)
  do>>|<row|<cell| \ x.draw()>|<cell| \ x.draw()>|<cell|
  \ x.draw()>>|<row|<cell|end>|<cell|end>|<cell|end>>>>>>>

  We also have three variables <with|font-family|tt|a>,
  <with|font-family|tt|b>, and <with|font-family|tt|c>, of types
  <with|font-family|tt|Cowboy>, <with|font-family|tt|Shape>, and
  <with|font-family|tt|Square> respectively. We'd like them to be compatible
  with the functions defined above according to this matrix:

  <center|<tabular*|<tformat|<table|<row|<cell|>|<cell|<with|font-family|tt|a:
  Cowboy>>|<cell|<with|font-family|tt|b: Shape>>|<cell|<with|font-family|tt|c:
  Square>>>|<row|<cell|<with|font-family|tt|drawany>>|<cell|<math|\<checked\>>>|<cell|<math|\<checked\>>>|<cell|<math|\<checked\>>>>|<row|<cell|<with|font-family|tt|render>>|<cell|>|<cell|<math|\<checked\>>>|<cell|<math|\<checked\>>>>|<row|<cell|<with|font-family|tt|brandish>>|<cell|<math|\<checked\>>>|<cell|>|<cell|>>>>>>

  That is, the functions that required their arguments to be of specific
  class types only accept those types, while the function that required
  merely that its argument have a method called ``draw'' accepts the
  structural type ``anything that has a draw field''.

  To fit this into the type inference system we need to define the subtyping
  relation between object types. It is clear from the above that we should
  have <with|font-family|tt|Shape> and <with|font-family|tt|Cowboy> be
  subtypes of <with|font-family|tt|{draw}> (i.e. the structural type
  ``containing a draw field''), but unrelated to each other.

  \;

  <subsection|A potential problem>

  A class may extend any number of other classes. Whether multiple
  inheritance (the ability to inherit code and data definitions from multiple
  extended classes) is a good thing or not, it is clear from its presence in
  almost every that multiple <with|font-shape|italic|subtyping> (the ability
  to implement interfaces from multiple exteded classes, such as Java or C#
  interfaces) is vital to a nominatively-typed object-oriented language. It
  is this feature which allows, say, a <tt|List> class to be iterated over
  (via a <tt|Iterable> interface), checked for equality with other lists (via
  a <tt|Comparable> interface) and so on using common generic interfaces.

  So, consider two subclasses of <tt|Shape>: <tt|Rectangle> and
  <tt|RegularPolygon>. <tt|Rectangle> defines width and height fields, and
  <tt|RegularPolygon> defines a side-length field. A subclass <tt|Square> is
  created, extending both of these. This poses no problem: <tt|Square> must
  simply implement all of the interfaces its superclasses demand. That is, it
  must provide <tt|draw>, <tt|width>, <tt|height>, and <tt|side-length>.

  What if a programmer tried to write a subclass of both <tt|Rectangle> and
  <tt|Cowboy>? In particular, what operation would such a class's <tt|draw>
  method perform? One of the central features of a nominative type system is
  that two features of a type are not considered equivalent merely by having
  the same name.\ 

  The problem is not merely having two different superclasses that define the
  same name. There was no problem with <tt|Square> having a <tt|draw> method,
  even though it was part of both <tt|Rectangle> and <tt|RegularPolygon>,
  since both methods referred to the same <with|font-shape|italic|meaning>,
  that of <tt|Shape.draw>. Our hypothetical rectangular cowboy has no such
  luxury: its <tt|draw> method must implement both <tt|Shape.draw> and
  <tt|Cowboy.draw>, which is nonsensical.

  We cannot allow such objects: we cannot demand that there be a single
  <tt|draw> method, for that would violate the principle that nominative
  declarations are not equivalent unless declared so, and we cannot allow
  multiple <tt|draw> methods since we cannot in general disambiguate (what if
  such an object was passed to <tt|drawany> above?).

  So, the problem is solved simply by disallowing such objects. This requires
  a certain amount of subtlety: we must find a way of detecting when a
  constraint graph requires such an impossible object and consider it in
  error.\ 

  \;

  \;

  \;

  \;

  \;

  Having given an intuitive explanation for how we would like nominative and
  structural types to interoperate, it remains to fit it into the formal
  model of constructor lattices defined in section ###. If this can be done,
  then we will know that the type inference algorithms will support inference
  and annotation-checking of code using these types.

  So, we would like to add <dfn|object types> to our constructor lattice.
  These types must support an arbitrary set of fields, and must support
  (user-defined) classes. As was explained above, a class is a subtype of the
  purely structural type with the same set of fields, as well as being a
  subtype of those classes it explicitly extends. An important (almost
  defining) property of nominative typing is that two classes do not enter
  into a subtype relation merely by having the same set of fields. However,
  those two classes must both be subtypes of the structural type defining
  their common fields.

  <subsection|Classes (partial description)>

  We may consider a class, therefore, as consisting of a set of classes that
  it directly extends and a set of members that it defines (as specified by
  the programmer in the class definition). Classes will be written as
  <math|\<b-C\><rsub|1>\<nocomma\>\<nocomma\>,\<b-C\><rsub|2>,\<ldots\>> with
  <math|\<b-C\><rsub|1> <with|math-font-series|bold|extends> \<b-C\><rsub|2>>
  denoting the ``directly extends'' relation and
  <math|<with|math-font-series|bold|defined><around*|(|<with|math-font-series|bold|C><rsub|1>|)>>
  denoting the set of members defined in the class.

  We will temporarily ignore that part of the class which places restrictions
  on the types of its members, which will be explained in a later section.
  For now, we seek only to define a constructor lattice capable of
  representing the top-level types.

  The directed graph formed by the <math|<with|math-font-series|bold|extends>>
  relation is acyclic, and so its reflexive transitive closure forms a
  partial order, which we will refer to as <dfn|subclassing><\footnote>
    Not that, under this definition, each class is a subclass of itself.
  </footnote>. <math|<with|math-font-series|bold|superclasses><around*|(|<with|math-font-series|bold|C>|)>>
  will denote the set of classes of which
  <math|<with|math-font-series|bold|C>> is a subclass.

  As well as defining some members, a class inherits the members defined in
  each of its superclasses. Some of these members (particularly methods) may
  be overridden and given a different definition in the superclass, giving
  rise to ``polymorphic dispatch'': the target of a function call depends on
  the runtime class of a object ### reword ###

  We will consider <math|<with|math-font-series|bold|defined><around*|(|<with|math-font-series|bold|C>|)>>
  to include only those members defined for the first time in
  <math|<with|math-font-series|bold|C>>, rather than those inherited or
  overriden. Thus, we can define <math|<with|math-font-series|bold|members><around*|(|<with|math-font-series|bold|C>|)>>,
  the complete set of members in <math|<with|math-font-series|bold|C>>, as
  <math|<big-around|\<cup\>|<around*|{|<with|math-font-series|bold|defined><around*|(|<with|math-font-series|bold|C<rprime|'>>|)><with|math-font-series|bold|>\|<with|math-font-series|bold|C<rprime|'>>\<in\><with|math-font-series|bold|superclasses><around*|(|<with|math-font-series|bold|C>|)>|}>>>.

  The sets <with|mode|math|<around*|{|<with|math-font-series|bold|defined><around*|(|<with|math-font-series|bold|C<rprime|'>>|)><with|math-font-series|bold|>\|<with|math-font-series|bold|C<rprime|'>>\<in\><with|math-font-series|bold|superclasses><around*|(|<with|math-font-series|bold|C>|)>|}>>
  must be disjoint, and so for any member in
  <math|<with|math-font-series|bold|members><around*|(|<with|math-font-series|bold|C>|)>>
  we may find the unique superclass <with|mode|math|<with|math-font-series|bold|C<rprime|'>>>
  which defines it. Two classes which define disjoint sets of members are
  said to be <dfn|compatible>, and so the above condition may be restated as
  ``no class may have two incompatible superclasses''. In the example above,
  <tt|Shape>, <tt|RegularPolygon> and <tt|Rectangle> are all
  pairwise-compatible (and so <tt|Square> is a legal class), but <tt|Shape>
  is not compatible with <tt|Cowboy> (thus banning rectangular cowboys).

  Since the set of classes extended and the set of members defined by a new
  class are written directly in the class declaration, these restrictions
  (that <math|<with|math-font-series|bold|extends>> is acyclic and that
  superclasses are all pairwise compatible) are simple syntactic criteria and
  can be verified without invoking the typechecker.

  This brings us part-way towards solving the problem mentioned above: it now
  becomes impossible to define a class which is a subclass of both
  <tt|Cowboy> and <tt|Shape>, since the <tt|draw> method would not have a
  unique definition. The problem is not completely solved, however, as it
  will require some more sophistication to recognise that a function which
  tries to use objects of both these types (say, a function that passes its
  argument to both <tt|brandish> and <tt|render>) is ill-typed.

  <subsection|The object constructor lattice>

  An <dfn|object type constructor> <math|\<b-O\>> consists of a set of
  classes <math|<with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O>|)>>
  and a set of fields <math|<with|math-font-series|bold|fields><around*|(|<with|math-font-series|bold|O>|)>>
  such that:

  <\itemize>
    <item><math|<with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O>|)>>
    is upwards-closed.

    That is, for all <math|<with|math-font-series|bold|C>\<in\><with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O>|)>>,
    <math|<with|math-font-series|bold|superclasses><around*|(|<with|math-font-series|bold|C>|)>\<subseteq\><with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O>|)>>.

    <item>The elements of <math|<with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O>|)>>
    are compatible.

    That is, for all <math|<with|math-font-series|bold|C<rsub|1>>,<with|math-font-series|bold|C<rsub|2>>\<in\><with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O>|)>>,
    <math|<with|math-font-series|bold|>><with|mode|math|<with|math-font-series|bold|C<rsub|1>>
    >and <with|mode|math|<with|math-font-series|bold|C<rsub|2>>> are
    compatible.

    <item><math|<with|math-font-series|bold|fields><around*|(|<with|math-font-series|bold|O>|)>>
    contains at least the fields defined by the classes in
    <math|<with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O>|)>>.

    That is, for all <math|<with|math-font-series|bold|C>\<in\><with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O>|)>>,
    <math|><with|mode|math|<with|math-font-series|bold|members><around*|(|<with|math-font-series|bold|C>|)>\<subseteq\><with|math-font-series|bold|fields><around*|(|<with|math-font-series|bold|O>|)>>.
  </itemize>

  The space of object type constructors <math|\<bbb-O\>> consists of all such
  object type constructors, as well as a bottom element
  <math|\<bot\><rsub|\<bbb-o\>>>. For the type inference engine to
  successfully check programs, it must be proven that <math|\<bbb-O\>> forms
  a type constructor lattice (as defined in ###).

  <\itemize>
    <item>The set of constructors is <math|\<bbb-O\>>.

    <item>The set of labels is the set of all possible field names.

    <item><math|arity<around*|(|<with|math-font-series|bold|O>|)>=<with|math-font-series|bold|fields><around*|(|<with|math-font-series|bold|O>|)>;
    arity<around*|(|\<bot\><rsub|\<bbb-o\>>|)>=<around*|{|all possible field
    names|}>>

    The arity is simply the set of fields, each field becomes a label.

    <item><math|variance<around*|(|f|)>=+>

    All of the labels (fields) have positive variance.###

    <item><math|\<bot\><rsub|\<bbb-o\>>\<leqslant\><with|math-font-series|bold|O>;<with|math-font-series|bold|O<rsub|1>\<leqslant\>O<rsub|2>\<Leftrightarrow\>><with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O<rsub|1>>|)>\<supseteq\><with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O<rsub|2>>|)>\<wedge\><with|math-font-series|bold|fields><around*|(|<with|math-font-series|bold|O<rsub|1>>|)>\<supseteq\><with|math-font-series|bold|fields><around*|(|<with|math-font-series|bold|O<rsub|2>>|)>>

    <with|mode|math|\<bot\><rsub|\<bbb-o\>>> is a subtype of every type
    constructor.

    A type constructor <math|<with|math-font-series|bold|O<rsub|1>>> is a
    subtype of <math|<with|math-font-series|bold|O<rsub|2>>> if it has a
    larger set of classes and fields.
  </itemize>

  We need to show that the ordering on object type constructors forms a
  lattice and follows the convexity of arity condition. The latter is easy:
  the constructor ordering is anti-monotonic in arity (that is,
  <math|<with|math-font-series|bold|O<rsub|1>\<leqslant\>O<rsub|2>>> only if
  <math|arity<around*|(|<with|math-font-series|bold|O<rsub|1>>|)>\<supseteq\>arity<around*|(|<with|math-font-series|bold|O<rsub|2>>|)>>),
  and so the convexity condition trivially holds.

  It remains to show that this structure forms a lattice. Rather than prove
  this directly (which would be somewhat messy), we prove it by ###.

  First, a few well-known lattice constructions:

  <\itemize>
    <item>If <math|S> is a set, then <math|S> forms a lattice under
    <math|\<subseteq\>>:

    <math|a\<sqcap\><rprime|'>b is a\<cap\>b;a\<sqcup\><rprime|'>b is
    a\<cup\>b;\<bot\><rprime|'> is \<varnothing\>;\<top\><rprime|'> is S>

    <item>If <math|S> is partially ordered, then the upwards-closed subsets
    of <math|S> form a lattice under <math|\<subseteq\>>:

    <math|a\<sqcap\><rprime|'>b is a\<cap\>b;a\<sqcup\><rprime|'>b is
    a\<cup\>b;\<bot\><rprime|'> is \<varnothing\>;\<top\><rprime|'> is
    \<cal-P\><around*|(|S|)>>

    <item><math|If L<rsub|1>,L<rsub|2> >are lattices, then <math|L<rsub|1>
    \<times\>L<rsub|2>> forms a lattice where
    <math|<around|(|x,y|)>\<leqslant\><around|(|x<rprime|'>,y<rprime|'>|)>
    \<Leftrightarrow\>x\<leqslant\>x<rprime|'> and y\<leqslant\>y<rprime|'>>:

    <math|><math|<around*|(|a,x|)>\<sqcap\><rprime|'><around*|(|b,y|)> is
    <around*|(|a\<sqcap\>b,x\<sqcap\>y|)>;<around*|(|a,x|)>\<sqcup\><rprime|'><around*|(|b,y|)>
    is <around*|(|a\<sqcup\>b,x\<sqcup\>y|)>;\<bot\><rprime|'> is
    <around*|(|\<bot\>,\<bot\>|)>;\<top\><rprime|'> is
    <around*|(|\<top\>,\<top\>|)>>

    <item>If <math|L> is a lattice, the dual of <math|L> (the same set with
    the ordering reversed) forms a lattice:

    <math|a\<sqcap\><rprime|'>b is a\<sqcup\>b;a\<sqcup\><rprime|'>b is
    a\<sqcap\>b;\<bot\><rprime|'> is \<top\>;\<top\><rprime|'> is \<bot\>>
  </itemize>

  <\lemma>
    If <math|L> is a lattice, <math|s\<in\>L> and
    <math|erase<rsub|s><around|(|L|)>=<around|{|x\|x
    \<in\>L,x\<nleqslant\>s|}>\<cup\><around|{|\<bot\>|}>>, then
    <math|erase<rsub|s><around|(|L|)>> is a lattice.
  </lemma>

  <\proof>
    Let <math|L<rprime|'>=erase<rsub|s><around|(|L|)>>. It must be shown that
    <math|L<rprime|'>> is partially ordered, and has unique l.u.b and g.l.b.

    The elements of <math|L<rprime|'>> are a subset of those of <math|L>
    (with all the non-bottom elements below <math|s> removed). The partial
    ordering on <math|L<rprime|'>> will be <math|L>'s ordering restricted to
    the elements of <math|L<rprime|'>>, so <math|L<rprime|'>> is trivially a
    poset.

    Let <math|x,y> be arbitrary elements of <math|L<rprime|'>>. If either
    <math|x> or <math|y> is <math|\<bot\>>, then <math|x\<sqcap\>y> and
    <math|x\<sqcup\>y> are trivially well-defined. Hence we can assume
    <math|x> and <math|y> are not <math|\<bot\>>, and by definition of
    <math|erase<rsub|s>> that <math|x\<nleqslant\>s> and
    <math|y\<nleqslant\>s>.

    Let <math|a\<in\>L=x \<sqcup\><rsub|L> y><math|>. Since
    <math|x\<nleqslant\>s> and <math|y\<nleqslant\>s>, <math|a\<nleqslant\>s>
    and so <math|a\<in\>L<rprime|'>>. Thus, <math|\<sqcup\>> is well-defined
    on <math|L<rprime|'>>.

    Let <math|b\<in\>L=x\<sqcap\><rsub|L>y>.
  </proof>

  <math|erase<rsub|s><around|(|L|)>> can be thought of as a new lattice with
  all elements below <math|s> removed. We can now restate the object type
  structure in terms of lattices: Define the full class-lattice as the
  upwards-closed subsets of the set of classes under the subclassing
  relation<\footnote>
    where the subclassing relation is the reflexive transitive closure of the
    relation given each classes' listed parent classes, that is it represents
    ``indirect subclassing''
  </footnote>. Define the class-lattice as the full class-lattice with each
  pair of incompatible classes removed via <math|erase<rsub|s>>

  ######

  \;

  \;

  The requirement that our types form a lattice led to the inclusion of a few
  extra types (to ``fill in the blanks'' by giving every pair of types a glb
  and lub), some of which turn out to be independantly useful. In particular,
  we gain intersection types: for any two classes or interfaces
  <math|C<rsub|1>> and <math|C<rsub|2>>, it is possible to define a function
  which takes arguments of type <math|C<rsub|1>\<sqcap\>C<rsub|2>>###,
  demanding that the parameter implement both of these interfaces. This is a
  useful property that cannot be expressed in many statically-typed
  languages, including Java<\footnote>
    It is possible to define a new interface type which extends both
    <math|C<rsub|1>> and <math|C<rsub|2>>, but then both classes must be
    modified to explicitly implement it, something which may not be possible
    if the interfaces are from different packages.
  </footnote>.

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  <subsubsection|Mutability>

  Should mutable type constructors (e.g. array, structure) be co- or
  contra-variant? Neither seems to work in the presence of mutability. For
  example, Java chose arrays to be covariant, allowing the following code:\ 

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|void f1(Mammal[]
  animals){>>|<row|<cell| \ mammals[0].eat();>>|<row|<cell|}>>|<row|<cell|...>>|<row|<cell|Dog[]
  dogs;>>|<row|<cell|f(dogs);>>>>>>>

  We can safely pass an array of <with|font-family|tt|Dog>s to a function
  expecting an array of <with|font-family|tt|Mammal>s. Now consider this
  example:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|void f2(Mammal[]
  mammals){>>|<row|<cell| \ mammals[0] = new
  Cat();>>|<row|<cell|}>>|<row|<cell|...>>|<row|<cell|Dog[]
  dogs;>>|<row|<cell|f(dogs);>>>>>>>

  This is a type error! (It will in fact be accepted by the Java compiler but
  will lead to an <verbatim|ArrayStoreException> at runtime). An array of
  <with|font-family|tt|Dog>s cannot be considered to be an array of
  <with|font-family|tt|Mammal>s when it is being stored into: you cannot
  store just any mammal into an array of dogs.

  The solution to this adopted by many languages is to introduce
  <em|invariant> type constructors. That is, there will be type constructors
  <with|font-family|tt|C[t]> where <with|font-family|tt|C[t1]> and
  <with|font-family|tt|C[t2]> are never related by subtyping unless
  <with|font-family|tt|t1> and <with|font-family|tt|t2> are exactly the same
  type. This is the solution adopted by Java's generics.

  This is a little problematic for us: Firstly, <with|font-family|tt|f1> was
  an entirely sensible piece of code and it would be better to allow it, and
  secondly adding invariant type construtors would violate the assumption in
  the type system that all type constructors are co- or contra-variant.

  The problem arises from the type parameter being used as covariant during
  ``read'' operations (as in <with|font-family|tt|f1>), and contravariant
  during ``write'' operations (as in <with|font-family|tt|f2>). Following
  ###ref###, we solve the problem by introducing a pair of type parameters:
  one covariant and one contravariant#######

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  <subsubsection|``Polymorphism''>

  ``Polymorphism'' in general means using the same code at different types.
  There are two distinct notions of polymorphism in common use: subtype
  polymorphism, common in OO languages and parametric polymorphism, common in
  functional languages.\ 

  Subtype polymorphism allows the use of an object with a subtype whenever a
  supertype was expected. For instance, a function that calculates the area
  of any shape would require that its argument be of type <tt|Shape>.
  However, it can be passed a <tt|Square>, as all <tt|Square>s are
  <tt|Shape>s. Subtype polymorphism essentially amounts to transparently
  strengthening preconditions or weakening postconditions.

  Parameteric polymorphism allows the use of an object whose type is only
  partially specified. For instance, a function returning the first element
  of a list will work for all possible types of list. It can be considered a
  function from lists of integers to integers, or equally a function from
  lists of strings to strings.

  Both are useful and serve broadly different goals, as evidenced by the
  (mostly successful) addition of parametric polymorphism to imperative
  languages (generics in Java and C# being good examples) and the (variously
  successful attempts at) adding subtype polymorphism to functional
  languages.

  In <brick>, parametric polymorphism manifests itself as a type with
  variables. The list example above would have type
  <math|<tt|List><around*|[|a|]>\<rightarrow\>a for all a>. Subtype
  polymorphism is implicit in the typing rules, and the shape area example
  above would have type <math|<tt|Shape>\<rightarrow\><tt|float>> (which can
  transparently be used as if it had type
  <math|<tt|Square>\<rightarrow\><tt|float>>).

  \;

  \;

  \;

  <chapter|Implementation tools>

  <section|Haskell>

  The pure, lazy, functional language Haskell ###cite### was used for the
  implementation. There are two somewhat unusual features of Haskell which
  were used<\footnote>
    Abused
  </footnote> heavily to describe the generic compiler infrastructure:
  laziness and monads.

  <subsection|Laziness>

  Haskell evaluates lazily. That is, when evaluating an application of a
  function to a value, Haskell will go straight into the evaluation of the
  function and only evaluate the value as and when it's needed. This means
  that a number of constructs which would loop infinitely in other languages
  complete in a finite time in Haskell. Also, constructs which would cause an
  error such as division by zero or the built-in <tt|error> function only
  propagate the error if the offending value is actually examined during the
  computation. For example:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|f x y = x * 2>>>>>>>

  This defines a function <tt|f> which takes two arguments and returns the
  first multiplied by two, ignoring the second. Haskell's laziness means that
  a term like <tt|f 42 (error ``broken!'')> will in fact output 84, since the
  error term is never evaluated.

  We can do some more interesting things with laziness. In particular, it
  allows us to define ``infinite'' data structures:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|biglist = [1,2,3] ++
  biglist>>>>>>>

  Here <tt|biglist> represents the list <tt|[1,2,3,1,2,3,1,2,3,1,2,3,...]>.
  This list is evaluated as needed, and so takes only a finite amount of
  memory. Similarly, we can ``use'' the result of a computation before it has
  been fully evaluated:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|let result = f
  100>>|<row|<cell| \ \ \ f x = [1,2] ++ [a + x \| a \<less\>-
  result]>>|<row|<cell|in result>>>>>>>

  That is, the result is defined to be 1, then 2, followed by each element of
  the result with 42 added. When evaluated, the list comes out as
  <tt|[1,2,101,102,201,202,...]>. Of course, we must ensure that we don't try
  and use a value in the computation of that value, but we may use the
  earlier parts to compute the later parts. For instance, if this example did
  not include the <tt|[1,2]> at the start, there would be no way to compute
  the first element of the list and so the program can hang<\footnote>
    Such errors are known as ``strictness bugs'' and are some of the most
    truly evil problems to debug as attempting to observe the value will
    change the order of evaluation.
  </footnote>. This tactic is used in the implementation of recursive
  functions, loops and similar recursive structures.

  <subsection|Monads>

  Monads are a central mechanism for expressing sequential code in Haskell.
  There are many, many, many introductions to the concept (###) ranging from
  category-theoretic interpretations to their use in describing I/O effects.
  What follows is a broad overview of how they can be used to describe
  sequential computation in a generic way, without reference to the
  technicalities of Haskell's type system. For a deeper discussion, see any
  of the above references.

  Haskell does not have any notion of ``side-effect'' as present in most
  other languages. When a Haskell function is invoked, the only thing that
  can happen is the function producing a value. The function cannot modify a
  global, or perform I/O, or change a local variable, or perform side-effects
  of any form. This has advantages (you can be utterly sure that the function
  doesn't silently change some important piece of state) but it makes many
  constructs which are trivial in an imperative language difficult to express
  in Haskell.

  Haskell supports pieces of imperative-looking code like:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|do {x \<less\>-
  doSomething 42;>>|<row|<cell| \ \ \ somethingElse x;>>|<row|<cell|
  \ \ \ return (y + 7)}>>>>>>>

  This does not execute as would be expected by someone familiar with
  imperative languages. In an imperative language, the semicolon acts as a
  sequencing operator separating evaluations, so that whatever side-effects
  the first computation has can affect the second.

  In Haskell there are no side-effects and order of evaluation is irrelevant.
  So, the semicolon must do something different. Haskell's semicolon is
  <with|font-shape|italic|programmable>: exactly what it does depends on
  which monad the statement is being evaluated in.\ 

  Semicolon is a sequential composition operator: its action is to combine
  two statements into a larger statement. The second statement may depend on
  the results of the first, as in the call to <tt|somethingElse> above and
  can so be considered a function producing a statement from a value. Thus, a
  semicolon takes a statement on the left, and a function from values to
  statements on the right, and combines them into a larger statement whose
  effect is to perform both statements, passing the result of the first into
  the second.

  This allows a number of otherwise difficult-to-express operations to be
  written simply. For instance, some monads in the Haskell standard library
  include:

  <\description>
    <item*|Reader>This is used to pass global data or configuration
    information to every operation in a program. The sequential composition
    operation performs the left statement and the right statement, but passes
    an extra hidden datum to both.

    <item*|Writer>Similarly, Writer allows logging or additional output from
    a function. Its notion of sequential composition is to perform both
    statements and combine their extra hidden outputs.

    <item*|State>This allows stateful imperative programming to be simulated
    within a functional language. Each statement has an extra hidden input
    and output, and the sequential composition threads them together so that
    each statement can ``see'' the effect the previous one had on this hidden
    parametr.

    <item*|List>This one is difficult to express in an imperative language:
    its notion of sequential composition is to perfom the second statement
    for each value that the left produces, thus modelling non-determinism or
    multiple-valued returns.

    <item*|Error>Error handling in Haskell is implemented as a monad where
    each statement can either return a value or an error. Sequential
    composition runs the first statement, and then runs the second statement
    only if the first didn't raise an error. The result from the composed
    statement will an error if either statement resulted in an error,
    otherwise it will be the result of the second statement.
  </description>

  These can be layered using a technique known as <dfn|monad transformers>
  ###cite###. For instance, a <strong|Reader> can be layered over any monad
  to give a monad which acts as the underlying monad, but where each
  statement can also access a global parameter.

  The power of the <brick> compiler architecture lies in defining an
  ``evaluator'' which implements most of the semantics of the language such
  as symbol table management, order of evaluation issues, and the like. This
  evaluator is a monad transformer which will evaluate programs in
  <with|font-shape|italic|any> monad which defines a certain set of primitive
  operations. We can then define a number of distinct underlying monads which
  implement only the primitives, and yet provide a full interpreter,
  compiler, or typechecker.

  <section|Happy and Alex>

  Happy<cite|happy> is a LR parser generator for Haskell, in the style of
  yacc for C. It accepts input in the form of a BNF grammar. Each production
  of the grammar is annotated with an action, which gives a means of
  computing a value for that node in the derivation tree from the values of
  the sub-nodes. There are no restrictions on what form the values may take;
  any Haskell value is permissable. Common examples would be simple
  calculator-style grammars, where the value is simply the result of the
  computation, and grammars constructing abstract sytax trees where the value
  is a list (or other structure) of its children.

  These essentially amount to an attributed translation grammar with support
  for synthesised attributes. Inherited attributes, where a node higher in
  the derivation tree passes a value to a node lower in the tree, can be
  emulated. Since Haskell has first-class functions, the synthesised value
  from a node can in fact be a function. A higher-level node can apply this
  function (in effect passing a value down the tree) before return its result
  (passing it up the tree).

  Like all LR parser generators, to parse any interesting languages Happy
  needs a pre-processing lexical analysis stage to convert the input string
  into a sequence of tokens. This is provided by the Alex package<cite|alex>,
  which is a rough equivalent of C's lex. The lexical syntax is described by
  a sequence of regular expressions, and Alex generates a scanner which is
  used to feed Happy with tokens.

  <section|LLVM>

  LLVM, or the Low-Level Virtual Machine, is ``a compilation framework for
  lifelong program analysis and transformation''<cite|llvm>. It provides a
  simple language-independent framework for compilation, and a machine-level
  type system.

  Programs are expressed in the LLVM intermediate representation, which is
  essentially a typed assembly language. The LLVM type system is purely
  structural and tries to impose minimal constraints on the higher-level
  language being compiled.\ 

  LLVM provides a generic backend for compiler authors. LLVM contains a large
  number of standard analysis and optimisation passes defined in terms of the
  LLVM IR, and so can be used to perform all of the mid- and low-level
  optimisations that are necessary for efficient code. These include dead
  code elimination, partial redudancy elimination, invariant hoisting and
  inlining. So, the task for a compiler-writer becomes simply to generate
  <with|font-shape|italic|valid> LLVM IR and let LLVM worry about generating
  fast code.

  There are a number of higher-level optimisations which should be applied at
  a level above LLVM. Most of these rely on having extra type information
  available. For instance, knowledge about types would allow a compiler to
  make extra assumptions about aliasing, and may present better opportunities
  for inlining. The implementation of such optimisations wouldn't generally
  take the form of complicated code transformations, but rather generating
  code in such a way that LLVM's standard optimisation passes can pick up on
  the extra opportunities. None of these type-based optimisations have been
  implemented yet, but some rough designs are noted in the ###future work
  section###.

  <subsection|LLVM IR>

  The LLVM IR is a typed assembly language for a virtual machine with:

  <\description>
    <item*|An arbitrary number of registers>LLVM registers are simply
    identifiers, and any number of them can be used. All operations using IR
    registers are in SSA form, but LLVM contains an optimisation pass
    (<tt|mem2reg>) to convert non-SSA reads and writes into SSA form.

    <item*|A structural, machine-level type system>LLVM knows about the type
    of each operand or register, which may be an integer of any bit-width, a
    structure, an array, a function pointer, etc. The operations are defined
    in terms of the types, and so for instance there is an ``instruction'' to
    convert a pointer to a structure into a pointer to one of its fields.
    LLVM handles target structure layout issues and calculates offsets before
    generating native code.

    <item*|Stack management>Stack slots are explicitly allocated and typed
    using the <tt|alloca> instruction and the LLVM system keeps track of the
    stack offsets at which data is stored. Since the system ``knows'' about
    every access to the stack, it can safely perform optimisations such as
    assigning a value to a register and eliminating the stack slot, as well
    as producing register spill and restore code without affecting stack
    variables.

    <item*|Calling convention support>The <tt|call> instruction abstracts
    away all of the target-specific details of the platform, and so functions
    can be called without worrying about issues such as calling conventions,
    caller-save registers, stack frame management and so on.
  </description>

  All of these features make LLVM IR a much more pleasant target for a
  compiler than a normal assembly language. The LLVM typing system makes
  debugging code generation much easier, as many simple bugs such as
  accessing the incorrect field of a structure can be caught by the LLVM
  code-generation utilities.

  <chapter|Extending an interpreter>

  Most compilers have quite a lot of seemingly redudant code. For instance,
  each phase of the compiler (e.g. code generation, type checking,
  optimisation) must ``know'' about the symbol table data structures. They
  must all understand whatever IR is being used to represent the program
  being compiled, and they must all implement code to process this IR, to
  match up operations and operands, etc.

  This adds a complexity to the implementation, and makes it difficult to
  modify various internal compiler data structures since so many parts of the
  system depend upon them. This complexity makes adding new language features
  or modifying existing ones a significant investment of time.

  One of the primary design goals of <brick> was the ability to quickly and
  easily prototype and test new features, and so flexibility and modularity
  of the compiler's implementation was of great importance.

  <section|Meta-circular interpreters>

  So, in the implementation of <brick>, we started with the simplest form of
  executable definition of a language, the
  <with|font-shape|italic|meta-circular interpreter>. This is a form of
  interpreter where the interpreter itself is written in a high-level
  language (in this case, Haskell), and so many features of the language
  being implemented can simply be passed on to the high-level language.

  For instance, the <brick> interpreter includes no garbage collector.
  Instead, <brick> objects are allocated as Haskell objects, and Haskell's
  garbage collector takes care of ensuring that they are collected and the
  memory reclaimed.

  A similar technique was used in the implementation of closures. <brick>
  allows first-class functions, and has lexical scoping. This combination,
  while powerful, often leads to some implementation difficulties since the
  symbol table must be ``closed over'' when a function is returned as a
  value. For instance, see the following function:

  <center|<\verbatim>
    <tabular|<tformat|<table|<row|<cell|def make_closure() do>>|<row|<cell|
    \ def x = 42>>|<row|<cell| \ return (function() do return x
    end)>>|<row|<cell|end>>>>>
  </verbatim>>

  <tt|make_closure> returns a function, which itself returns <tt|x> as
  defined in <tt|make_closure>. So, when the <tt|return> statement is
  executed, a closure must be created to house the function being returned.
  This closure must contain a reference to the code itself, as well as some
  representation of how the symbol table looked at the time the closure was
  created (so that <tt|x> can be found, even though it is ``out of scope'' by
  the time the function is invoked).

  Again, we piggybacked on Haskell's implementation of this feature:
  first-class functions in <brick> are implemented as first-class functions
  in Haskell. Using Haskell's closure mechanism, they close over the entire
  symbol table.

  ###code###

  <section|Monadic interpreters>

  Our interpreter, while being concise, is also difficult to read. This is in
  no small part due to the necessity of passing around the symbol table
  parameters (<tt|s1>, <tt|s2> and so on) so that names can always be
  resolved. We can abstract this away and hide the symbol table inside a
  <tt|State> monad, so that it is always available but need not be explicitly
  passed around.

  ###code###

  As an added benefit, our <tt|eval> function is now free from the
  implementation details of the symbol table. The interaction between
  <tt|eval> and the symbol table consists solely of a few\ 

  \;

  and we can freely substitute other more efficient representations\ 

  \;

  \;

  <section|Generalising <tt|eval> further>

  We have already generalised <tt|eval> so that it does not depend on the
  concrete details of the type <math|\<cal-V\>> used to represent variables.
  By abstracting this away, we allow different implementations of the symbol
  table data structures without having to change any code in <tt|eval> to
  accomodate them. <tt|eval> no longer depends on a specific data structure
  used to represent variables, and will now work with any type
  <math|<with|math-font|cal|V>> as long as certain operations (<tt|varNew>,
  <tt|varGet>, <tt|varSet> and so on) are defined on it.

  We can continue applying this notion and generalise the type used to
  represent the value of an expression. Currently, <tt|eval> is hardcoded to
  use a particular algebraic datatype which may represent a function, an
  integer, etc. Generalising this so that <tt|eval> can use any type
  <math|<with|math-font|cal|E>> on which the appropriate operations have been
  defined allows the same modularity as generalising variables to
  <math|<with|math-font|cal|V>> did. For instance, a more efficient
  representation for values can be used without needing to modify <tt|eval>.
  Alternatively, we could define new representation which kept more debugging
  information such as making each value keep track of the line of code which
  produced it. This information could be used to pinpoint the source of an
  incorrect value and aid in debugging. Since <tt|eval> is generalised over
  the type <math|<with|math-font|cal|E>>, then as long as we could implement
  the few primitives for manipulating values in terms of
  <math|<with|math-font|cal|E>>, <tt|eval> would transparently work on our
  new representation without needing to change a line of code.

  As the language grows bigger, the <tt|eval> function grows to accomodate
  every part of the syntax and define the semantics for the entire language.
  The set of primitive operations remains very small. So, by generalising
  <tt|eval> over <math|<with|math-font|cal|V>> and
  <math|<with|math-font|cal|E>>, we gain the ability to have multiple
  representations of the language's runtime data structures (optimised and
  debugger-friendly, for instance), without having to maintain a large amount
  of near-duplicated code.

  So far, this is all quite standard software engineering. Reducing the
  number of components that see the internals of a data structure and making
  them instead communicate through well-defined interfaces leads to more
  flexible and maintainable software. In particular, it allows us to
  substitute alternative implementations of the data structures without
  needing to modify <tt|eval>, so we can support multiple different
  implementations of the interpreter which share all of the same code and
  differ only in the primitives' implementations.

  <section|Generalising <tt|eval> even further>

  The real power of this approach comes when we generalise not just over the
  data structures used to represent the program, but over the underlying
  monad. The monad is what defines the interpreter's sequencing and control
  flow. So far, our interpreter has been running over a <tt|State
  <rigid|SymbolTable>> monad. This monad's notion of sequencing operations is
  simply to pass the state of the symbol table as defined by earlier
  operations into the current operation, and to keep track of any changes
  made so that they can be passed to future operations. The implementation of
  control flow (via the <tt|cond> function) is simply to check whether a
  condition is true and to return either <tt|True> or <tt|False>, to allow
  <tt|eval> to take the correct branch.

  By generalising <tt|eval> over <math|<with|math-font|cal|M>>, the monad
  used to keep track of sequencing operations in the interpreter, we open the
  door to many interesting parameterisations. In particular, we will see that
  some particular instantiations of <math|<with|math-font|cal|M>>,
  <math|<with|math-font|cal|V>> and <math|<with|math-font|cal|E>> will allow
  us to make our interpreter compile or typecheck code. We can do all this
  without changing the definition of the interpreter (much), just as we could
  allow multiple implementations of the data structure for values without
  needing to explicitly support them all in the <tt|eval> function.

  As shall be seen in the next chapter, this means that a compiler generating
  LLVM assembly code can be implemented just by implementing the primitive
  operations (<tt|varGet>, <tt|varSet>, <tt|cond>, etc.) and defining the
  monad <math|<with|math-font|cal|M>> and the types
  <math|<with|math-font|cal|V>> and <math|<with|math-font|cal|E>\<nosymbol\>>.
  In particular, complex flow control constructs (such as <tt|break>,
  <tt|continue>, non-local returns and the like) don't have to be implemented
  in the compiler at all: we just define a notion of sequencing and
  branching, and let the much simpler <tt|eval> function define the meaning
  of the language. This frees us from the usual code-generator burden of
  hooking together labels and jumps, as this is done automatically according
  to the semantics defined by <tt|eval>.

  <chapter|A compiler from an interpreter>

  We would like to define a compiler from <brick> source to native code (via
  LLVM assembly). Not wanting to implement the large body of code necessary
  to emit assembly for every possible language construct, we instead define
  our compiler by parameterising the existing interpreter over a different
  monad.

  <section|A code generation monad>

  The compiler needs to keep track of generated code, and be able to generate
  fresh names for temporary variables. So, a good start for a code generation
  monad is:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|type Codegen = RWS ()
  \ \ \ \ \ \ \ \ -- no Reader, we're not using it>>|<row|<cell|
  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ [LLVMInsn] -- Writer writes a list of
  output instructions>>|<row|<cell| \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Int
  \ \ \ \ \ \ \ -- We keep track of a single Int for fresh names>>>>>>>

  \;

  This is Haskell's standard Reader-Writer-State monad, where we use the
  Writer part to keep track of the instructions written and the State part to
  help us generate fresh names (Reader is unused here).

  How does a compiler represent values? We can't very well return values from
  the primitive operations; we can't know what the answers are when
  compiling. Instead, a compiler represents values by symbolic names. In our
  case these will be LLVM register names, so we implement the type
  <math|<with|math-font|cal|E>> simply as <tt|String>. The primitive
  operation for addition takes <math|<around*|(|<with|math-font|cal|E>,<with|math-font|cal|E>|)>>
  and returns <math|<with|math-font|cal|E>>. In the interpreter, these were
  two integers and it simply added them together and returned the result. In
  the compiler, these are two LLVM register names (represented simply as
  strings), so we output the code necessary to add the two operands and store
  the result in a fresh temporary, and then we return the name of that
  temporary. Again, note that we don't have to modify <tt|eval> to implement
  this: <tt|eval> blindly passes around objects of type
  <math|<with|math-font|cal|E>> and neither knows nor cares about exactly how
  they are represented. Similarly, <math|<with|math-font|cal|V>> is also set
  to <tt|String>, this time representing a stack location, where <tt|varGet>
  outputs a load instruction, <tt|varSet> outputs a store instruction, and
  <tt|varNew> allocates a new stack slot (an LLVM ``alloca'' instruction).

  How does a compiler represent state? It doesn't have to keep track of the
  values of each variable as in the interpreter's symbol table, that's done
  by the machine's memory. All it really needs to know about is the current
  location of executing in the program: the compiler merely has to produce
  the right stream of instructions and the machine will track the rest. So,
  the only ``program state'' that the compiler must keep track of is the
  current position in the program. Since the compiler outputs to LLVM, the
  current state is represented by a single LLVM assembly label.

  <section|Representing flow control>

  Perhaps one of the biggest differences between an interpreter and a
  compiler is their treatment of flow control. An interpreter must evaluate
  only a single path through a program while a compiler must generate code
  capable of executing any possible path through the code.

  In our generalised <tt|eval>, this distinction manifests itself as the
  implementation of sequencing in the monad and the definition of the
  <tt|cond> primitive.

  <tt|cond> in the interpreter simply checked that its argument was of the
  boolean data type and returned its value, either <tt|True> or <tt|False>.
  <tt|cond> in the compiler is more complicated: we must handle both
  possibilities and correctly link them together in the generated code.

  In the presence of conditions and branching, the generated output is not
  necessarily in exact order of execution. So, we will need to use the state
  field defined above to determine which instruction will be executed next.
  This leads to a simple means of sequencing code correctly: instead of
  generating simple instructions, we generate label-instruction-jump
  sequences of the form:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|L1: instruction op1
  op2 op3; goto L2;>>>>>>>

  Here <tt|L1> represents the state upon control reaching the instruction,
  and <tt|L2> represents the state after it is executed. If each and every
  instruction is output in this form, we can be guaranteed that the execution
  path through the compiled program will exactly correspond to the path that
  states were passed along in the compiler's monad. It does have the
  unfortunate side-effect of generating a large number of redundant sequences
  of the form ``<tt|goto L2; L2: >'' although these are easily removed by a
  simple post-processing pass<\footnote>
    Since this is implemented in Haskell, these redundant sequences don't
    consume a large amount of memory: they will only be computed lazily as
    the post-processing cleaning step demands them, so there are only a small
    number of them in memory at once even for a large program.
  </footnote>.

  This suggests a natural mechanism for implementing <tt|cond>: it should
  return <with|font-shape|italic|both <tt|True> and <tt|False>>, each in a
  different ``state'' (i.e. assembly language label). When it returns
  <tt|True> in state <tt|L1> the ``true-path'' of the branch will be run and
  will output code starting from state <tt|L1>. Then, when it returns
  <tt|False> in state <tt|L2> the ``false-part'' of the branch will be run
  and will output code starting from state <tt|L2>. All that remains is for
  <tt|cond> to link these together by outputting a single instruction <tt|if
  condition then goto L1 else goto L2>. So, the code output will look like:

  <center|<\verbatim>
    <tabular|<tformat|<table|<row|<cell|L0:>|<cell|if
    <with|font-shape|italic|condition>>|<cell|then goto L1 else goto
    L2;>>|<row|<cell|L1:>|<cell|<with|font-shape|italic|true-part>;>|<cell|goto
    L3;>>|<row|<cell|L2:>|<cell|<with|font-shape|italic|false-part>;>|<cell|goto
    L4;>>|<row|<cell|L3:>|<cell|>|<cell|>>|<row|<cell|L4:>|<cell|>|<cell|>>>>>
  </verbatim>>

  \;

  Flow control thus becomes easy to implement if we allow our monad to return
  multiple values in multiple states. Thus, our compiler's definition of
  <math|<with|math-font|cal|M>> becomes something like:

  <\equation*>
    <with|math-font|cal|M>=<tt|ListT <around*|(|StateT LLVMLabel
    <around*|(|Codegen|)>|)>>
  </equation*>

  That is, our monad produces multiple results (<tt|ListT>) each of which
  carries an LLVM label (<tt|StateT LLVMLabel>) and produces some code
  (<tt|Codegen>).

  <tt|ListT> is a monad transformer representing non-determinism. Its notion
  of sequencing is to run the second half of a sequenced operation for each
  result that the first one produces. In the compiler, this means that the
  code that depends on the result of <tt|cond> will be run for each result
  that <tt|cond> produces, which is the desired result.

  <subsection|Coalescing>

  There is an issue with this presentation so far, however. What about code
  like:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|if cond1 then
  do>>|<row|<cell| \ f1()>>|<row|<cell|end>>|<row|<cell|if cond2 then
  do>>|<row|<cell| \ f2()>>|<row|<cell|end>>|<row|<cell|if cond3 then
  do>>|<row|<cell| \ f3()>>|<row|<cell|end>>>>>>>

  When this code is compiled, the successive calls to <tt|cond> each cause
  the rest of the compiler's execution to be duplicated. Thus, four separate
  calls to <tt|f3> will be emitted by the code generator, one for each path
  along which the code can be reached. In general, this can cause an
  exponential increase in code size.

  We resolve this problem by introducing another primitive operation, called
  <tt|coalesce>. The purpose of <tt|coalesce> is for the <tt|eval> function
  to inform the underlying monad <math|<with|math-font|cal|M>> that all
  states reaching a given point are considered equivalent and may be combined
  into one.

  In the compiler, <tt|coalesce> coalesces states simply by outputting all of
  the labels instead of just one of them. If a set of labels <tt|L1>,
  <tt|L2>, etc. are coalesced, then the first instruction to be executed in
  this coalesced state will be labelled with each label from the set. This
  causes the execution paths to those labels to all flow to the same point in
  the control-flow graph, and so we can continue from there with only a
  single state rather than require code duplication.

  In the interpreter, <tt|coalesce> is simply a no-op: there are never
  multiple states to coalesce. In general, <tt|coalesce> may be thought of as
  a no-op: even in the compiler it has no effect on the semantics of the
  compiled program, it serves simply to make the resulting output
  (considerably) shorter.

  <subsection|Iteration>

  There is, sadly, one similar case which <tt|coalesce> is unable to address:
  looping.

  <center|<\verbatim>
    <tabular|<tformat|<table|<row|<cell|while cond1 do>>|<row|<cell|
    \ f1()>>|<row|<cell|end>>>>>
  </verbatim>>

  If we use the existing compiler implementation and ``branch both ways'' on
  each iteration of the loop, the resulting emitted code will be infinite.
  Our problem is that the monad <math|<with|math-font|cal|M>> has no way of
  ``seeing'' the recursion inherent in <tt|eval>'s definition of looping.
  <tt|eval> simply calls itself, and so the monad cannot spot that the next
  iteration of the loop will be exactly the same as the previous.

  So, we introduce one more primitive operation: <tt|fixiter>. This operation
  perfoms something akin to a fixpoint iteration. <tt|fixiter> converts a
  monad action taking an input of type <math|a> and returning an output of
  type <math|a> or type <math|b> into one that takes an input of type
  <math|a> and returns one of type <math|b>. In Haskell syntax:

  <center|<verbatim|fixiter :: (a -\<gtr\> m (Either b a)) -\<gtr\> (a
  -\<gtr\> m b)>>

  The effect is to run the monadic action, passing its output back to its
  input, until it returns something of type <math|b>.\ 

  By wrapping the definition of <tt|while> withing the <tt|eval> function in
  a call to <tt|fixiter>, we can avoid the infinite-code problem. The
  interpreted semantics of the language do not change, as the interpreter's
  definition of <tt|fixiter> is a simple recursion which runs the action over
  and over again until a result is produced.

  The compiler, however, can now implement <tt|fixiter> to handle loops. The
  input to <tt|fixiter> will be a state, which is the result of coalescing
  the state as it was before the <tt|fixiter> action was invoked, and the
  state as it will be when the <tt|fixiter> action loops. Thus, we can output
  one sequence of code which runs in the states (i.e. from the labels) which
  are defined just before the while loop begins and at the end of the while
  loop, when it's about to loop back.

  Using the yet-to-be-defined state from the end of the while loop before
  we've evaluated that far would seem to present a problem. Luckily, since
  Haskell is a lazy language, we can get away with using this state before
  it's been defined since all we do with the state is blindly copy it to the
  output.

  <section|Implementation of structures>

  The fundamental data type used to represent objects is the ``struct'': this
  is a mapping of string keys to string values, where the set of string keys
  is known at struct creation time and never changes. In the interpreter,
  these are implemented as a Haskell Map from string keys to values, but a
  more sophisticated implementation is necessary for the compiler.

  Due to the nature of the type system, the amount of information we have
  when compiling a structure access operation varies. In some cases, we know
  exactly the set of keys contained in the struct (e.g. when the structure is
  a global constant or when we've just created it). In other cases, we know
  nothing about it other than that it contains the given key (e.g. when
  taking a function parameter with no explicit type annotations whose ``x''
  member we access, the typesystem ascertains no more than that the object
  does indeed have an ``x'' member).

  In the ``easy'' case, where we know exactly the set of fields available, we
  would like to be able to compile the access down to an immediate offset.
  However, it is still important to keep the harder case efficient, where we
  don't know anything about the struct.

  \;

  Structs are layed out as a series of pointer-width words.<\footnote>
    In the current implementation, there are no unboxed types so every value
    is represented as a pointer. In a future implementation, this constraint
    will be relaxed for efficiency.
  </footnote> The first word points to a ``type table'', which describes the
  layout of the rest of the structure. The ``type table'' must map string
  keys to offsets within the structure efficiently.

  This problem is related to the problems of minimal perfect hashing and the
  Java interface lookup problem (###).

  To avoid performing string comparisons, field names are hashed at compile
  time. To correctly handle hash collisions, each field is associated with a
  ### globals, unique addresses, linker, freshness ###

  The actual lookup is a simple hashing scheme ### hashcodes, collisions,
  length-2, branches ###.

  <section|Implementation of closures>

  Closures are implemented on top of the struct functionality. A closure is
  simply a structure with a specially-named field which contains a pointer to
  the code to execute. If the function closes over values, those are stored
  as extra fields in the structure, with unique names.

  If the function closes over a mutable variable, extra care must be taken to
  ensure that there is only one copy of the variable. For instance, consider
  the following code:

  <\with|font-family|tt>
    def makefunctions() do

    \ \ var v = 0

    \ \ def f1() do

    \ \ \ \ v = v + 1

    \ \ \ \ return v

    \ \ end

    \ \ def f2() do

    \ \ \ \ v = v + 1

    \ \ \ \ return v

    \ \ end

    \ \ return {func1 = f1, func2 = f2}

    end

    def funcs = makefunctions()

    funcs.f1()

    funcs.f2()

    funcs.f1()
  </with>

  This returns a structure containing two fields: the functions f1 and f2
  defined by makefunctions. Both of these close over the same variable v.
  Simply copying v into both closures is not enough: since the two functions
  are accessing the same variable, updates from one must be reflected in the
  other.

  The problem is solved by not representing v as an unboxed value, but by
  boxing it inside a single-field structure<\footnote>
    Reusing the struct functionality here was a time-saving technique in
    implementation, a simpler box structure would have somewhat less
    overhead.
  </footnote>. Both closures refer to the same box, and all of them alias the
  same copy of v.

  \;

  <section|A typechecker from an interpreter>

  So far, we've shown how a single semantics for a language parameterised
  over a monad <math|<with|math-font|cal|M>>, a data type for variables
  <math|<with|math-font|cal|V>>, and a datatype for values
  <math|<with|math-font|cal|E>> can be instantiated to give an interpreter or
  a compiler. Next, we show how that can be generalised to form a
  type-checker.

  The algorithms for analysing the constraint graph of a program have been
  described at length in ###part I. What remains is the initial constraint
  generation pass: we must be able to construct such a constraint graph from
  an arbitrary input program.

  We'd rather not define this pass in terms of the concrete syntax of the
  language or in terms of symbols and symbol tables, since we seem to have
  already implemented that code for the compiler and interpreter and would
  like to avoid duplicating it. Instead, we will attempt to re-use our
  generic <tt|eval> code by finding an implementation of the primitives and a
  definition of <math|<with|math-font|cal|M>>, <math|<with|math-font|cal|V>>
  and <math|<with|math-font|cal|E>> which causes the result of our
  interpreter to be a constraint graph.

  The approach is not dissimilar to that of abstract interpretation. Indeed,
  all of the parameterisations of the <tt|eval> function may be considered
  abstractions of the interpreter. In particular, types may be considered
  abstractions of the sets of values which they represent, and so the types
  manipulated by the typechecker can be considered an abstraction of the
  values manipulated by the interpreter.

  For a detailed treatment of this relationship between type inference and
  abstract interpretation, see Cousot's work in <cite|abstracttypes>.

  In this implementation, we describe the constraint generation process by
  instantiating <math|<with|math-font|cal|M>> to be a monad very similar to
  the one used for the compiler. Instead of the bottom-most monad generating
  a list of instructions, we have it generate a set of constraints. Also, we
  can ignore the state parameter used in the compiler's
  <math|<with|math-font|cal|M>>, since the types of terms are required to be
  independant of the point in the execution of the program. Since there is no
  state parameter, coalescing is easy to implement, and since we allow
  recursive constraints, <tt|fixiter> is relatively easy.

  The types <math|<with|math-font|cal|E>> and <math|<with|math-font|cal|V>>
  simply represent type variables. Each of the actual operations of the
  language which operates upon values can be expressed as a constraint upon
  type variables. For instance, the primitve operation <tt|apply> (used to
  apply a function to its argument) takes a pair of
  <math|<with|math-font|cal|E>> (function and argument) and returns a single
  <math|<with|math-font|cal|E>>. It can be implemented in the typechecker as
  taking <math|<around*|(|a,b|)>> and returning a fresh variable <math|c>
  while building the constraint <math|a\<leqslant\>b\<rightarrow\>c>. Each of
  the primitive operations can be defined in this way, giving us a type
  checker which builds constraints as an abstraction of the operation of the
  interpreter.

  Thus, with a single definition of <tt|eval>, as well as getting a compiler
  we also gain a typechecker.

  <chapter|Future work>

  <chapter|Conclusions>

  \;

  <appendix|BNF grammar for the syntax of <brick>><appendix|Detailed typing
  rules for <brick>>

  Subjred as abstract interpretation a la Cousot, fits with compiler
  implementation, easy to verify, don't have to throw it away each
  change<cite|ranknml>

  \;

  <\bibliography|bib|plain|/home/stephen/papers/papers.bib>
    <\bib-list|10>
      <bibitem*|1><label|bib-hopcroftmin>A.<nbsp>V. Aho, J.<nbsp>E. Hopcroft,
      and J.<nbsp>D. Ullman. <newblock><with|font-shape|italic|The Design and
      Analysis of Computer Algorithms>. <newblock>Addison-Wesley Publishing
      Company, 1974.

      <bibitem*|2><label|bib-subrec>Roberto<nbsp>M. Amadio and Luca Cardelli.
      <newblock>Subtyping recursive types.
      <newblock><with|font-shape|italic|ACM Trans. Program. Lang. Syst.>,
      15(4):575--631, 1993.

      <bibitem*|3><label|bib-alex>C.<nbsp>Dornan, I.<nbsp>Jones, and
      S.<nbsp>Marlow. <newblock>Alex: A lexical analyser generator for
      Haskell. <newblock><with|font-shape|italic|University of Glasgow>,
      1995.

      <bibitem*|4><label|bib-scalastructural>G.<nbsp>Dubochet and
      M.<nbsp>Odersky. <newblock>Compiling structural types on the JVM: a
      comparison of reflective and generative techniques from Scala's
      perspective. <newblock>pages 34--41, 2009.

      <bibitem*|5><label|bib-ooprectypes>Jonathan Eifrig, Scott Smith, and
      Valery Trifonov. <newblock>Type Inference for Recursively Constrained
      Types and its Application to OOP. <newblock><with|font-shape|italic|Electronic
      Notes in Theoretical Computer Science>, 1:132 -- 153, 1995.
      <newblock>MFPS XI, Mathematical Foundations of Programming Semantics,
      Eleventh Annual Conference.

      <bibitem*|6><label|bib-whiteoak>J.<nbsp>Gil and I.<nbsp>Maman.
      <newblock>Whiteoak: introducing structural typing into java.
      <newblock><with|font-shape|italic|ACM SIGPLAN Notices>, 43(10):73--90,
      2008.

      <bibitem*|7><label|bib-happy>A.<nbsp>Gill and S.<nbsp>Marlow.
      <newblock>Happy: The parser generator for Haskell.
      <newblock><with|font-shape|italic|University of Glasgow>, 1995.

      <bibitem*|8><label|bib-subrecfast>Dexter Kozen, Jens Palsberg, and
      Michael<nbsp>I. Schwartzbach. <newblock>Efficient recursive subtyping.
      <newblock>pages 419--428, 1993.

      <bibitem*|9><label|bib-llvm>Chris Lattner and Vikram Adve.
      <newblock>LLVM: A Compilation Framework for Lifelong Program Analysis &
      Transformation. <newblock>Mar 2004.

      <bibitem*|10><label|bib-leroypoly>X.<nbsp>Leroy. <newblock>Polymorphism
      by name for references and continuations. <newblock>In
      <with|font-shape|italic|Proceedings of the 20th ACM SIGPLAN-SIGACT
      symposium on Principles of programming languages>, pages 220--231. ACM,
      1993.

      <bibitem*|11><label|bib-unitynomstruct>D.<nbsp>Malayeri and
      J.<nbsp>Aldrich. <newblock>Integrating nominal and structural
      subtyping. <newblock><with|font-shape|italic|ECOOP
      2008--Object-Oriented Programming>, pages 260--284, 2008.

      <bibitem*|12><label|bib-regulartypes>P.<nbsp>Morris,
      T.<nbsp>Altenkirch, and C.<nbsp>McBride. <newblock>Exploring the
      regular tree types. <newblock><with|font-shape|italic|Types for Proofs
      and Programs>, pages 252--267, 2006.

      <bibitem*|13><label|bib-pottierphd>François Pottier. <newblock>Type
      inference in the presence of subtyping: from theory to practice.
      <newblock>Research Report RR-3483, INRIA, 1998.

      <bibitem*|14><label|bib-pottierframework>François Pottier. <newblock>A
      framework for type inference with subtyping.
      <newblock><with|font-shape|italic|SIGPLAN Not.>, 34(1):228--238, 1999.

      <bibitem*|15><label|bib-toftepoly>M.<nbsp>Tofte. <newblock>Type
      inference for polymorphic references.
      <newblock><with|font-shape|italic|Information and computation>,
      89(1):1--34, 1990.

      <bibitem*|16><label|bib-subconst>Valery Trifonov and Scott Smith.
      <newblock>Subtyping constrained types. <newblock>1145:349--365, 1996.
      <newblock>10.1007/3-540-61739-6<rsub|5>2.

      <bibitem*|17><label|bib-valuerestriction>A.K. Wright.
      <newblock>Polymorphism for imperative languages without imperative
      types. <newblock>1993.

      <bibitem*|18><label|bib-valuerestriction2>A.K. Wright. <newblock>Simple
      imperative polymorphism. <newblock><with|font-shape|italic|Lisp and
      symbolic computation>, 8(4):343--355, 1995.
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|par-hyphen|normal>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-10|<tuple|3.3|12>>
    <associate|auto-11|<tuple|3.3.1|13>>
    <associate|auto-12|<tuple|3.3.2|13>>
    <associate|auto-13|<tuple|3.4|13>>
    <associate|auto-14|<tuple|3.5|13>>
    <associate|auto-15|<tuple|3.5.1|14>>
    <associate|auto-16|<tuple|3.6|15>>
    <associate|auto-17|<tuple|4|17>>
    <associate|auto-18|<tuple|4.1|17>>
    <associate|auto-19|<tuple|4.2|17>>
    <associate|auto-2|<tuple|1|5>>
    <associate|auto-20|<tuple|4.3|18>>
    <associate|auto-21|<tuple|4.4|18>>
    <associate|auto-22|<tuple|4.5|19>>
    <associate|auto-23|<tuple|4.5.1|19>>
    <associate|auto-24|<tuple|4.6|19>>
    <associate|auto-25|<tuple|4.7|20>>
    <associate|auto-26|<tuple|4.7.1|20>>
    <associate|auto-27|<tuple|4.7.2|22>>
    <associate|auto-28|<tuple|4.8|22>>
    <associate|auto-29|<tuple|4.8.1|22>>
    <associate|auto-3|<tuple|2|7>>
    <associate|auto-30|<tuple|4.8.2|22>>
    <associate|auto-31|<tuple|4.9|25>>
    <associate|auto-32|<tuple|5|25>>
    <associate|auto-33|<tuple|5.1|25>>
    <associate|auto-34|<tuple|5.1.1|26>>
    <associate|auto-35|<tuple|5.2|27>>
    <associate|auto-36|<tuple|5.2.1|28>>
    <associate|auto-37|<tuple|5.2.2|28>>
    <associate|auto-38|<tuple|5.2.3|29>>
    <associate|auto-39|<tuple|5.2.4|31>>
    <associate|auto-4|<tuple|3|9>>
    <associate|auto-40|<tuple|5.2.4.1|31>>
    <associate|auto-41|<tuple|5.2.4.2|33>>
    <associate|auto-42|<tuple|6|33>>
    <associate|auto-43|<tuple|6.1|33>>
    <associate|auto-44|<tuple|6.1.1|33>>
    <associate|auto-45|<tuple|6.1.2|35>>
    <associate|auto-46|<tuple|6.2|35>>
    <associate|auto-47|<tuple|6.3|35>>
    <associate|auto-48|<tuple|6.3.1|37>>
    <associate|auto-49|<tuple|7|37>>
    <associate|auto-5|<tuple|3.1|9>>
    <associate|auto-50|<tuple|7.1|37>>
    <associate|auto-51|<tuple|7.2|38>>
    <associate|auto-52|<tuple|7.3|38>>
    <associate|auto-53|<tuple|7.4|41>>
    <associate|auto-54|<tuple|8|41>>
    <associate|auto-55|<tuple|8.1|41>>
    <associate|auto-56|<tuple|8.2|42>>
    <associate|auto-57|<tuple|8.2.1|43>>
    <associate|auto-58|<tuple|8.2.2|43>>
    <associate|auto-59|<tuple|8.3|44>>
    <associate|auto-6|<tuple|3.1.1|10>>
    <associate|auto-60|<tuple|8.4|45>>
    <associate|auto-61|<tuple|8.5|47>>
    <associate|auto-62|<tuple|9|49>>
    <associate|auto-63|<tuple|10|51>>
    <associate|auto-64|<tuple|A|53>>
    <associate|auto-65|<tuple|B|55>>
    <associate|auto-66|<tuple|B|?>>
    <associate|auto-7|<tuple|3.2|10>>
    <associate|auto-8|<tuple|3.2.1|11>>
    <associate|auto-9|<tuple|3.2.2|12>>
    <associate|bib-alex|<tuple|3|55>>
    <associate|bib-happy|<tuple|7|55>>
    <associate|bib-hopcroftmin|<tuple|1|55>>
    <associate|bib-leroypoly|<tuple|10|55>>
    <associate|bib-llvm|<tuple|9|55>>
    <associate|bib-objectcalculus|<tuple|1|?>>
    <associate|bib-ooprectypes|<tuple|5|55>>
    <associate|bib-pottierframework|<tuple|14|55>>
    <associate|bib-pottierphd|<tuple|13|55>>
    <associate|bib-regulartypes|<tuple|12|55>>
    <associate|bib-scalastructural|<tuple|4|55>>
    <associate|bib-subconst|<tuple|16|55>>
    <associate|bib-subrec|<tuple|2|55>>
    <associate|bib-subrecfast|<tuple|8|55>>
    <associate|bib-toftepoly|<tuple|15|55>>
    <associate|bib-unitynomstruct|<tuple|11|55>>
    <associate|bib-valuerestriction|<tuple|17|55>>
    <associate|bib-valuerestriction2|<tuple|18|55>>
    <associate|bib-whiteoak|<tuple|6|55>>
    <associate|footnote-1|<tuple|1|?>>
    <associate|footnote-1.1|<tuple|1.1|?>>
    <associate|footnote-1.2|<tuple|1.2|?>>
    <associate|footnote-1.3|<tuple|1.3|?>>
    <associate|footnote-1.4|<tuple|1.4|?>>
    <associate|footnote-1.5|<tuple|1.5|?>>
    <associate|footnote-1.6|<tuple|1.6|?>>
    <associate|footnote-10.1|<tuple|10.1|?>>
    <associate|footnote-10.2|<tuple|10.2|?>>
    <associate|footnote-10.3|<tuple|10.3|?>>
    <associate|footnote-2|<tuple|2|?>>
    <associate|footnote-2.1|<tuple|2.1|?>>
    <associate|footnote-2.2|<tuple|2.2|?>>
    <associate|footnote-2.3|<tuple|2.3|?>>
    <associate|footnote-2.4|<tuple|2.4|?>>
    <associate|footnote-3|<tuple|3|?>>
    <associate|footnote-3.1|<tuple|3.1|11>>
    <associate|footnote-3.2|<tuple|3.2|14>>
    <associate|footnote-3.3|<tuple|3.3|?>>
    <associate|footnote-3.4|<tuple|3.4|?>>
    <associate|footnote-4|<tuple|4|?>>
    <associate|footnote-4.1|<tuple|4.1|17>>
    <associate|footnote-4.2|<tuple|4.2|?>>
    <associate|footnote-4.3|<tuple|4.3|?>>
    <associate|footnote-4.4|<tuple|4.4|?>>
    <associate|footnote-5|<tuple|5|?>>
    <associate|footnote-5.1|<tuple|5.1|25>>
    <associate|footnote-5.2|<tuple|5.2|25>>
    <associate|footnote-5.3|<tuple|5.3|26>>
    <associate|footnote-5.4|<tuple|5.4|29>>
    <associate|footnote-5.5|<tuple|5.5|30>>
    <associate|footnote-5.6|<tuple|5.6|30>>
    <associate|footnote-6|<tuple|6|?>>
    <associate|footnote-6.1|<tuple|6.1|33>>
    <associate|footnote-6.2|<tuple|6.2|33>>
    <associate|footnote-7.1|<tuple|7.1|37>>
    <associate|footnote-7.2|<tuple|7.2|38>>
    <associate|footnote-8.1|<tuple|8.1|42>>
    <associate|footnote-8.2|<tuple|8.2|44>>
    <associate|footnote-8.3|<tuple|8.3|44>>
    <associate|footnr-1|<tuple|1|?>>
    <associate|footnr-1.1|<tuple|1.1|?>>
    <associate|footnr-1.2|<tuple|1.2|?>>
    <associate|footnr-1.3|<tuple|1.3|?>>
    <associate|footnr-1.4|<tuple|1.4|?>>
    <associate|footnr-1.5|<tuple|1.5|?>>
    <associate|footnr-1.6|<tuple|1.6|?>>
    <associate|footnr-10.1|<tuple|10.1|?>>
    <associate|footnr-10.2|<tuple|10.2|?>>
    <associate|footnr-10.3|<tuple|10.3|?>>
    <associate|footnr-2|<tuple|2|?>>
    <associate|footnr-2.1|<tuple|2.1|?>>
    <associate|footnr-2.2|<tuple|2.2|?>>
    <associate|footnr-2.3|<tuple|2.3|?>>
    <associate|footnr-2.4|<tuple|2.4|?>>
    <associate|footnr-3|<tuple|3|?>>
    <associate|footnr-3.1|<tuple|3.1|11>>
    <associate|footnr-3.2|<tuple|3.2|14>>
    <associate|footnr-3.3|<tuple|3.3|?>>
    <associate|footnr-3.4|<tuple|3.4|?>>
    <associate|footnr-4|<tuple|4|?>>
    <associate|footnr-4.1|<tuple|4.1|17>>
    <associate|footnr-4.2|<tuple|4.2|?>>
    <associate|footnr-4.3|<tuple|4.3|?>>
    <associate|footnr-4.4|<tuple|4.4|?>>
    <associate|footnr-5|<tuple|5|?>>
    <associate|footnr-5.1|<tuple|5.1|25>>
    <associate|footnr-5.2|<tuple|5.2|25>>
    <associate|footnr-5.3|<tuple|5.3|26>>
    <associate|footnr-5.4|<tuple|5.4|29>>
    <associate|footnr-5.5|<tuple|5.5|30>>
    <associate|footnr-5.6|<tuple|5.6|30>>
    <associate|footnr-6|<tuple|6|?>>
    <associate|footnr-6.1|<tuple|6.1|33>>
    <associate|footnr-6.2|<tuple|6.2|33>>
    <associate|footnr-7.1|<tuple|7.1|37>>
    <associate|footnr-7.2|<tuple|7.2|38>>
    <associate|footnr-8.1|<tuple|8.1|42>>
    <associate|footnr-8.2|<tuple|8.2|44>>
    <associate|footnr-8.3|<tuple|8.3|44>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      subrec

      subrec

      subrecfast

      regulartypes

      pottierphd

      pottierphd

      subrec

      subrecfast

      pottierphd

      ooprectypes

      pottierphd

      pottierframework

      hopcroftmin

      subconst

      pottierphd

      pottierphd

      pottierphd

      pottierphd

      ranknml

      ranknhaskell

      valuerestriction

      valurestriction2

      toftepoly

      leroypoly

      valuerestriction

      valuerestriction2

      whiteoak

      scalastructural

      unitynomstruct

      happy

      alex

      llvm

      abstracttypes

      ranknml
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Abstract>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Background
      and related work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Type
      inference as constraint solving> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      3.1<space|2spc>Constructors and Variance
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      <with|par-left|<quote|1.5fn>|3.1.1<space|2spc><with|mode|<quote|math>|\<top\>>
      and <with|mode|<quote|math>|\<bot\>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      3.2<space|2spc>Ground types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      <with|par-left|<quote|1.5fn>|3.2.1<space|2spc>Equirecursive and
      isorecursive data types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1.5fn>|3.2.2<space|2spc>Subtyping between ground
      types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      3.3<space|2spc>rc types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      <with|par-left|<quote|1.5fn>|3.3.1<space|2spc>Denotation of an rc type
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1.5fn>|3.3.2<space|2spc>Subsumption
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      3.4<space|2spc>Constraints and well-typedness
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>

      3.5<space|2spc>Structural decomposition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>

      <with|par-left|<quote|1.5fn>|3.5.1<space|2spc>Formal definition of
      constructor lattice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      3.6<space|2spc>Closure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      type inference engine> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      4.1<space|2spc>The small terms invariant
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>

      4.2<space|2spc>Merging constraints <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>

      4.3<space|2spc>The mono-polarity invariant
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>

      4.4<space|2spc>Garbage collection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>

      4.5<space|2spc>Representing the constraint set
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>

      4.6<space|2spc>The incremental closure algorithm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>

      4.7<space|2spc>Type simplification and optimisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>

      <with|par-left|<quote|1.5fn>|4.7.1<space|2spc>Canonisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <with|par-left|<quote|1.5fn>|4.7.2<space|2spc>Minimisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      4.8<space|2spc>rc type subsumption <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      <with|par-left|<quote|1.5fn>|4.8.1<space|2spc>Entailment
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|1.5fn>|4.8.2<space|2spc>Subsumption
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>>

      4.9<space|2spc>Display <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>...
      (objects, nom/struct, constraintgen)>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31><vspace|0.5fn>

      5.1<space|2spc>Generalised and ungeneralised bindings
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>

      <with|par-left|<quote|1.5fn>|5.1.1<space|2spc>The value restriction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      5.2<space|2spc>Optional type annotations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>

      <with|par-left|<quote|1.5fn>|5.2.1<space|2spc>Checking type annotations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>>

      <with|par-left|<quote|1.5fn>|5.2.2<space|2spc>A potential problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <with|par-left|<quote|1.5fn>|5.2.3<space|2spc>Classes (partial
      description) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>>

      <with|par-left|<quote|1.5fn>|5.2.4<space|2spc>The object constructor
      lattice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>>

      <with|par-left|<quote|3fn>|5.2.4.1<space|2spc>Mutability
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>>

      <with|par-left|<quote|3fn>|5.2.4.2<space|2spc>``Polymorphism''
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Implementation
      tools> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41><vspace|0.5fn>

      6.1<space|2spc>Haskell <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>

      <with|par-left|<quote|1.5fn>|6.1.1<space|2spc>Laziness
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>>

      <with|par-left|<quote|1.5fn>|6.1.2<space|2spc>Monads
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>>

      6.2<space|2spc>Happy and Alex <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>

      6.3<space|2spc>LLVM <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>

      <with|par-left|<quote|1.5fn>|6.3.1<space|2spc>LLVM IR
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Extending
      an interpreter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48><vspace|0.5fn>

      7.1<space|2spc>Meta-circular interpreters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49>

      7.2<space|2spc>Monadic interpreters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>

      7.3<space|2spc>Generalising <with|font-family|<quote|tt>|math-font-family|<quote|ttt>|eval>
      further <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-51>

      7.4<space|2spc>Generalising <with|font-family|<quote|tt>|math-font-family|<quote|ttt>|eval>
      even further <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-52>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>A
      compiler from an interpreter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53><vspace|0.5fn>

      8.1<space|2spc>A code generation monad
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54>

      8.2<space|2spc>Representing flow control
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>

      <with|par-left|<quote|1.5fn>|8.2.1<space|2spc>Coalescing
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>>

      <with|par-left|<quote|1.5fn>|8.2.2<space|2spc>Iteration
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>>

      8.3<space|2spc>Implementation of structures
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58>

      8.4<space|2spc>Implementation of closures
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59>

      8.5<space|2spc>A typechecker from an interpreter
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-60>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Future
      work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-61><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Conclusions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-62><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix
      A<space|2spc>BNF grammar for the syntax of <error|compound brick>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-63><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix
      B<space|2spc>Detailed typing rules for <error|compound brick>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-64><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-65><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
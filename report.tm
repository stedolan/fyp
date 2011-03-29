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

    3.6<space|2spc>Closure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    type inference engine> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16><vspace|0.5fn>

    4.1<space|2spc>The small terms invariant
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>

    4.2<space|2spc>Merging constraints <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>

    4.3<space|2spc>The mono-polarity invariant
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>

    4.4<space|2spc>Garbage collection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>

    4.5<space|2spc>Representing the constraint set
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21>

    4.6<space|2spc>The incremental closure algorithm
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>

    4.7<space|2spc>Type simplification and optimisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>

    <with|par-left|1.5fn|4.7.1<space|2spc>Canonisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    <with|par-left|1.5fn|4.7.2<space|2spc>Minimisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    4.8<space|2spc>rc type subsumption <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>

    <with|par-left|1.5fn|4.8.1<space|2spc>Entailment
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|1.5fn|4.8.2<space|2spc>Subsumption
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>>

    4.9<space|2spc>Display <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>...
    (objects, nom/struct, constraintgen)>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30><vspace|0.5fn>

    5.1<space|2spc>Generalised and ungeneralised bindings
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31>

    5.2<space|2spc>Optional type annotations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-32>

    <with|par-left|3fn|5.2.0.1<space|2spc>Entailment
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-33>>

    <with|par-left|3fn|5.2.0.2<space|2spc>Subsumption
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-34>>

    <with|par-left|3fn|5.2.0.3<space|2spc>Mutability
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-35>>

    <with|par-left|3fn|5.2.0.4<space|2spc>The value restriction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36>>

    <with|par-left|3fn|5.2.0.5<space|2spc>``Polymorphism''
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Implementation
    tools> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Appendix
    A<space|2spc>Detailed typing rules for <error|compound brick>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40><vspace|0.5fn>
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

    <item>rc types as sets of ground types

    <item>vars

    <item>rc types vague desc

    <item><math|n<rsup|3>>, PSPACE

    <item>nom / struct

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

  \;

  \;

  ### constraints on ground signature: variances are per-param and convexity
  of arity

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
  ground types (see ###) and the unification representation allows us to show
  certain constraint graphs are satisfiable in the space of regular trees by
  reducing them to equality constraints (see ###).

  The proofs of the various salient properties of regular trees are omitted.
  For detailed descriptions, including the equivalence of the above
  representations, see ###reg, subrec, subrecfast etc.###

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
  <math|c<rsub|2>> and <math|c<rsub|3>> with label sets <math|L<rsub|1>>,
  <math|L<rsub|2>> and <math|L<rsub|3>> such that
  <math|c<rsub|1>\<leqslant\>c<rsub|2>\<leqslant\>c<rsub|3>>, it must be the
  case that <math|L<rsub|1>\<cap\>L<rsub|3>\<subseteq\>L<rsub|2>>. ###explain

  \;

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

  Somewhat more formally, we define a <dfn|small constructed type> as one
  that is of the form <math|c<around*|(|p,q,r,\<ldots\>|)>> where <math|c> is
  a type constructor and its parameters <math|p,q,r,\<ldots\>> are type
  variables. Any constraint set is equivalent to a constraint set where both
  sides of each constraint are either variables or small constructed types.
  The latter constraint set can be built from the former by breaking down
  each non-small constructed type into a small constructed type and a set of
  constraints.

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
  subexpressions are more effective (see ###)

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
  <math|\<sqcap\>> and <math|\<sqcup\>> are quite simply defined. First,
  however, we need to extend the definition of a small constructed term to
  allow <math|\<sqcap\>> and <math|\<sqcup\>> to appear inside constructors.
  ### small terms + latticeops

  \;

  ### for a fuller presentation of <math|\<sqcap\>> and <math|\<sqcup\>>, see
  pottier

  <section|The mono-polarity invariant>

  \;

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
  is reachable if it is present in the type part of the rc type, or if it is
  present in a constraint with one or more reachable variables. This notion,
  similar to the standard notion of garbage collection of data structures,
  allows us to delete the variables <math|c>, <math|d> and <math|e> and the
  constraints in which they appear.

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

  <section|Representing the constraint set>

  \;

  <section|The incremental closure algorithm>

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
  form will be referred to as ``canonical''.

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

  The canonisation algorithm is as follows. Let <math|V> be the set of
  variables in the constraint graph. ###

  \;

  Of course, the actual implementation canonisation algorithm does not create
  all of the variables in ###. Instead, the new variables are created lazily
  as a ### is found which requires them.

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
  when given this function. The actual type generated, before minimisation is
  run, is:

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
  into the <tt|increment> field of the argument type. Also, the variable
  <math|e<rsup|->> is not constrained at all (since the result of
  <tt|x.increment> is never used, the programmer doesn't care about the
  variable used to represent its type).

  The graph of <tt|f2> has a slightly different problem: to comply with the
  mono-polarity invariant, we must use different type variables to describe
  the argument and the result of the function. The programmer has no such
  qualms, and would prefer to see the type as the more natural
  <rigid|<math|a\<rightarrow\>a>.>\ 

  Both of these type graphs can be made readable by applying a simple
  substitution: replacing type variables with their unique bounds. ### def in
  terms of graph, cite, safety, varvar case

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

  <section|Optional type annotations>

  \;

  We can state the type system as a system of constraints which well-typed
  programs must satisify. ###

  In order to show that a program is correctly typed, we must show that its
  corresponding constraint system is <em|satisfiable>. ###

  \;

  Closure

  A constraint system <math|C> is said to be
  <with|font-shape|italic|closed><\footnote>
    refrefref (various defs of ``closed'') ###
  </footnote> if:

  <\itemize>
    <item>It is closed under transitivity: if <math|a\<leqslant\><rsub|C>b>
    and <math|b\<leqslant\><rsub|C>c> then <math|a\<leqslant\><rsub|C>c>.

    <item>It is closed under structural decomposition: if
    <math|a\<rightarrow\>b\<leqslant\><rsub|C>c\<rightarrow\>d> then
    <math|c\<leqslant\><rsub|C>a> and <math|b\<leqslant\><rsub|C>d>.
  </itemize>

  The structural decomposition rule generalises to any type constructor, not
  just the function constructor <math|\<rightarrow\>>. The details will be
  provided when the closure algorithm is described in ###

  Every solvable constraint system (and only solvable ones) is equivalent to
  a closed constraint system. So, the core of the type-checking algorithm is
  to compute the closure of the constraint system: this will succeed if and
  only if the program is type-correct. ### ref

  \;

  \;

  \;

  \;

  <subsubsection|Entailment>

  \;

  \;

  \;

  \;

  <subsubsection|Subsumption>

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

  \;

  \;

  For reasons outlined in the introduction###, it was a design goal to
  support both structural and nominative typing.

  ### bunch of previous work: whiteoak<cite|whiteoak> and
  unity<cite|unitynomstruct> for starters###

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
  draw(x) do>|<cell|def render(x: Shape) do>|<cell|def brandish(x: Cowboy)
  do>>|<row|<cell| \ x.draw()>|<cell| \ x.draw()>|<cell|
  \ x.draw()>>|<row|<cell|end>|<cell|end>|<cell|end>>>>>>>

  We also have three variables <with|font-family|tt|a>,
  <with|font-family|tt|b>, and <with|font-family|tt|c>, of types
  <with|font-family|tt|Cowboy>, <with|font-family|tt|Shape>, and
  <with|font-family|tt|Square> respectively. We'd like them to be compatible
  with the functions defined above according to this matrix:

  <center|<tabular*|<tformat|<table|<row|<cell|>|<cell|<with|font-family|tt|a:
  Cowboy>>|<cell|<with|font-family|tt|b: Shape>>|<cell|<with|font-family|tt|c:
  Square>>>|<row|<cell|<with|font-family|tt|draw>>|<cell|<math|\<checked\>>>|<cell|<math|\<checked\>>>|<cell|<math|\<checked\>>>>|<row|<cell|<with|font-family|tt|render>>|<cell|>|<cell|<math|\<checked\>>>|<cell|<math|\<checked\>>>>|<row|<cell|<with|font-family|tt|brandish>>|<cell|<math|\<checked\>>>|<cell|>|<cell|>>>>>>

  That is, the functions that required their arguments to be of specific
  class types only accept those types, while the function that required
  merely that its argument have a method called ``draw'' accepts the
  structural type ``anything that has a draw field''.

  To fit this into the type inference system we need to define the subtyping
  relation between object types. It is clear from the above that we should
  have <with|font-family|tt|Shape> and <with|font-family|tt|Cowboy> be
  subtypes of <with|font-family|tt|{draw}> (i.e. the structural type
  ``containing a draw field''), but unrelated to each other.

  ### lattice ###

  ### interface intersection types ###

  \;

  \;

  \;

  An object type constructor consists of a set of field names and a set of
  classes. The set of classes must be upwards-closed (that is, if it contains
  a class <math|C> it also contains all superclasses of <math|C>) and contain
  no conflicting classes. A type is a subtype of another if it has a superset
  of the fields and a superset of the classes.

  It remains to show that this structure forms a lattice. Rather than prove
  this directly (which would be somewhat messy), we prove it by showing that
  it is constructed from lattices using only operations which map lattices to
  lattices.

  First, a few well-known properties of lattices:

  <\itemize>
    <item>If <math|S> is a set ordered by subset inclusion, then
    <math|S,\<subseteq\>>forms a lattice (with
    <math|\<sqcap\>=\<cap\>,\<sqcup\>=\<cup\>>)

    <item>If <math|S> is a partially ordered set, then the upwards-closed
    subsets of <math|S> form a lattice (again under subset inclusion)

    <item><math|If L<rsub|1>,L<rsub|2> >are lattices, then <math|L<rsub|1>
    \<times\>L<rsub|2>> forms a lattice where
    <math|<around|(|x,y|)>\<leqslant\><around|(|x<rprime|'>,y<rprime|'>|)>
    \<Leftrightarrow\>x\<leqslant\>x<rprime|'> and y\<leqslant\>y<rprime|'>>
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
    <math|erase<rsub|s>> that <math|x\<nleqslant\>s> and <math|y\<gtr\>s>.

    Let <math|a\<in\>L=x \<sqcup\><rsub|L> y> and <math|b\<in\>L=x
    \<sqcap\><rsub|L> y>. Since <math|x\<nleqslant\>s> and
    <math|y\<nleqslant\>s>, <math|a\<nleqslant\>s> and so
    <math|a\<in\>L<rprime|'>>. Thus, <math|\<sqcup\>> is well-defined on
    <math|L<rprime|'>>.\ 
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

  <subsubsection|The value restriction>

  Another problem with mutability arises with generalised bindings<\footnote>
    Also known as <with|font-family|tt|let>-bindings in functional languages
  </footnote>. A binding of a name may be
  <with|font-shape|italic|generalised>. This allows it to be used with
  multiple different incompatible types at different points in the program.
  ### xref ### For instance, consider this function:

  <center|<\verbatim>
    <tabular|<tformat|<table|<row|<cell|def id(x) do>>|<row|<cell| \ return
    x>>|<row|<cell|end>>>>>
  </verbatim>>

  This function has type <math|\<forall\>a. a\<rightarrow\>a###syntax###>. It
  may be used with different instantiations of this type scheme at different
  points in the program: in one instance it may be passed a string and return
  a string, and in another it may be passed an integer and return an integer.

  Generalisation essentially means that the type of the term is inferred
  based on its definition but not on its uses. Each use must be compatible
  with the definition, but the uses need not be compatible with each other.

  In languages like Haskell, every <with|font-family|tt|let>-bound and all
  toplevel bindings are generalised. This poses a well-known problem
  ###ref### in the presence of mutable references and side-effects. Consider
  this example:

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
  different instantiations of a generalised binding. Thus, the uses of
  objects containing mutable fields must be compatible, and hence the binding
  can't be generalised.

  There are a number of standard techniques used to mitigate this problem.
  ### ImpTyVar (unsuitable because of pervasiveness), extensions of Tofte's
  (incomprehensible), Value restriction (used)### Brick adopts a version of
  the value restriction: only certain syntactic forms (function and class
  definitions) are generalised.

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

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  In this chapter, we will address the problem of providing an efficient
  runtime representation for the constructs described previously. The
  fundamental data type used is the ``struct'': this is a mapping of string
  keys to string values, where the set of string keys is known at struct
  creation time and never changes.

  \;

  Due to the nature of the type system, the amount of information we have
  when compiling a structure access operation varies. In some cases, we know
  exactly the set of keys contained in the struct (when the structure is a
  global constant or when we've just created it). In other cases, we know
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

  \;

  \;

  \;

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

  \;

  \;

  \;

  <appendix|Detailed typing rules for <brick>>

  Subjred as abstract interpretation a la Cousot, fits with compiler
  implementation, easy to verify, don't have to throw it away each change

  <\bibliography|bib|plain|/home/stephen/papers/papers.bib>
    <\bib-list|1>
      <bibitem*|1><label|bib-hopcroftmin>A.<nbsp>V. Aho, J.<nbsp>E. Hopcroft,
      and J.<nbsp>D. Ullman. <newblock><with|font-shape|italic|The Design and
      Analysis of Computer Algorithms>. <newblock>Addison-Wesley Publishing
      Company, 1974.

      <bibitem*|2><label|bib-subrec>Roberto<nbsp>M. Amadio and Luca Cardelli.
      <newblock>Subtyping recursive types.
      <newblock><with|font-shape|italic|ACM Trans. Program. Lang. Syst.>,
      15(4):575--631, 1993.

      <bibitem*|3><label|bib-ooprectypes>Jonathan Eifrig, Scott Smith, and
      Valery Trifonov. <newblock>Type inference for recursively constrained
      types and its application to oop. <newblock><with|font-shape|italic|Electronic
      Notes in Theoretical Computer Science>, 1:132 -- 153, 1995.
      <newblock>MFPS XI, Mathematical Foundations of Programming Semantics,
      Eleventh Annual Conference.

      <bibitem*|4><label|bib-whiteoak>J.<nbsp>Gil and I.<nbsp>Maman.
      <newblock>Whiteoak: introducing structural typing into java.
      <newblock><with|font-shape|italic|ACM SIGPLAN Notices>, 43(10):73--90,
      2008.

      <bibitem*|5><label|bib-subrecfast>Dexter Kozen, Jens Palsberg, and
      Michael<nbsp>I. Schwartzbach. <newblock>Efficient recursive subtyping.
      <newblock>pages 419--428, 1993.

      <bibitem*|6><label|bib-unitynomstruct>D.<nbsp>Malayeri and
      J.<nbsp>Aldrich. <newblock>Integrating nominal and structural
      subtyping. <newblock><with|font-shape|italic|ECOOP
      2008--Object-Oriented Programming>, pages 260--284, 2008.

      <bibitem*|7><label|bib-pottierframework>François Pottier. <newblock>A
      framework for type inference with subtyping.
      <newblock><with|font-shape|italic|SIGPLAN Not.>, 34(1):228--238, 1999.

      <bibitem*|8><label|bib-pottierphd>FranÃ§ois Pottier. <newblock>Type
      inference in the presence of subtyping: from theory to practice.
      <newblock>Research Report RR-3483, INRIA, 1998.

      <bibitem*|9><label|bib-subconst>Valery Trifonov and Scott Smith.
      <newblock>Subtyping constrained types. <newblock>1145:349--365, 1996.
      <newblock>10.1007/3-540-61739-6<rsub|5>2.
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
    <associate|auto-14|<tuple|3.5|14>>
    <associate|auto-15|<tuple|3.6|15>>
    <associate|auto-16|<tuple|4|15>>
    <associate|auto-17|<tuple|4.1|15>>
    <associate|auto-18|<tuple|4.2|16>>
    <associate|auto-19|<tuple|4.3|16>>
    <associate|auto-2|<tuple|1|5>>
    <associate|auto-20|<tuple|4.4|17>>
    <associate|auto-21|<tuple|4.5|17>>
    <associate|auto-22|<tuple|4.6|17>>
    <associate|auto-23|<tuple|4.7|17>>
    <associate|auto-24|<tuple|4.7.1|17>>
    <associate|auto-25|<tuple|4.7.2|17>>
    <associate|auto-26|<tuple|4.8|17>>
    <associate|auto-27|<tuple|4.8.1|19>>
    <associate|auto-28|<tuple|4.8.2|19>>
    <associate|auto-29|<tuple|4.9|19>>
    <associate|auto-3|<tuple|2|7>>
    <associate|auto-30|<tuple|5|19>>
    <associate|auto-31|<tuple|5.1|19>>
    <associate|auto-32|<tuple|5.2|21>>
    <associate|auto-33|<tuple|5.2.0.1|22>>
    <associate|auto-34|<tuple|5.2.0.2|23>>
    <associate|auto-35|<tuple|5.2.0.3|25>>
    <associate|auto-36|<tuple|5.2.0.4|27>>
    <associate|auto-37|<tuple|5.2.0.5|?>>
    <associate|auto-38|<tuple|6|?>>
    <associate|auto-39|<tuple|A|?>>
    <associate|auto-4|<tuple|3|9>>
    <associate|auto-40|<tuple|A|?>>
    <associate|auto-41|<tuple|A|?>>
    <associate|auto-5|<tuple|3.1|9>>
    <associate|auto-6|<tuple|3.1.1|10>>
    <associate|auto-7|<tuple|3.2|10>>
    <associate|auto-8|<tuple|3.2.1|11>>
    <associate|auto-9|<tuple|3.2.2|12>>
    <associate|bib-hopcroftmin|<tuple|1|?>>
    <associate|bib-objectcalculus|<tuple|1|?>>
    <associate|bib-ooprectypes|<tuple|3|27>>
    <associate|bib-pottierframework|<tuple|7|27>>
    <associate|bib-pottierphd|<tuple|8|27>>
    <associate|bib-subconst|<tuple|9|?>>
    <associate|bib-subrec|<tuple|2|27>>
    <associate|bib-subrecfast|<tuple|5|27>>
    <associate|bib-unitynomstruct|<tuple|6|27>>
    <associate|bib-whiteoak|<tuple|4|27>>
    <associate|footnote-1|<tuple|1|?>>
    <associate|footnote-1.1|<tuple|1.1|?>>
    <associate|footnote-1.2|<tuple|1.2|?>>
    <associate|footnote-1.3|<tuple|1.3|?>>
    <associate|footnote-1.4|<tuple|1.4|?>>
    <associate|footnote-1.5|<tuple|1.5|?>>
    <associate|footnote-1.6|<tuple|1.6|?>>
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
    <associate|footnote-4.1|<tuple|4.1|?>>
    <associate|footnote-4.2|<tuple|4.2|?>>
    <associate|footnote-4.3|<tuple|4.3|?>>
    <associate|footnote-4.4|<tuple|4.4|?>>
    <associate|footnote-5|<tuple|5|?>>
    <associate|footnote-5.1|<tuple|5.1|19>>
    <associate|footnote-5.2|<tuple|5.2|21>>
    <associate|footnote-5.3|<tuple|5.3|21>>
    <associate|footnote-5.4|<tuple|5.4|22>>
    <associate|footnote-6|<tuple|6|?>>
    <associate|footnote-6.1|<tuple|6.1|25>>
    <associate|footnote-6.2|<tuple|6.2|26>>
    <associate|footnr-1|<tuple|1|?>>
    <associate|footnr-1.1|<tuple|1.1|?>>
    <associate|footnr-1.2|<tuple|1.2|?>>
    <associate|footnr-1.3|<tuple|1.3|?>>
    <associate|footnr-1.4|<tuple|1.4|?>>
    <associate|footnr-1.5|<tuple|1.5|?>>
    <associate|footnr-1.6|<tuple|1.6|?>>
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
    <associate|footnr-4.1|<tuple|4.1|?>>
    <associate|footnr-4.2|<tuple|4.2|?>>
    <associate|footnr-4.3|<tuple|4.3|?>>
    <associate|footnr-4.4|<tuple|4.4|?>>
    <associate|footnr-5|<tuple|5|?>>
    <associate|footnr-5.1|<tuple|5.1|19>>
    <associate|footnr-5.2|<tuple|5.2|21>>
    <associate|footnr-5.3|<tuple|5.3|21>>
    <associate|footnr-5.4|<tuple|5.4|22>>
    <associate|footnr-6|<tuple|6|?>>
    <associate|footnr-6.1|<tuple|6.1|25>>
    <associate|footnr-6.2|<tuple|6.2|26>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      subrec

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

      whiteoak

      unitynomstruct
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

      3.6<space|2spc>Closure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      type inference engine> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>

      4.1<space|2spc>The small terms invariant
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      4.2<space|2spc>Merging constraints <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>

      4.3<space|2spc>The mono-polarity invariant
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>

      4.4<space|2spc>Garbage collection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>

      4.5<space|2spc>Representing the constraint set
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>

      4.6<space|2spc>The incremental closure algorithm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>

      4.7<space|2spc>Type simplification and optimisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>

      <with|par-left|<quote|1.5fn>|4.7.1<space|2spc>Canonisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1.5fn>|4.7.2<space|2spc>Minimisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      4.8<space|2spc>rc type subsumption <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>

      <with|par-left|<quote|1.5fn>|4.8.1<space|2spc>Entailment
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <with|par-left|<quote|1.5fn>|4.8.2<space|2spc>Subsumption
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      4.9<space|2spc>Display <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>...
      (objects, nom/struct, constraintgen)>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30><vspace|0.5fn>

      5.1<space|2spc>Generalised and ungeneralised bindings
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>

      5.2<space|2spc>Optional type annotations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>

      <with|par-left|<quote|3fn>|5.2.0.1<space|2spc>Entailment
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      <with|par-left|<quote|3fn>|5.2.0.2<space|2spc>Subsumption
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <with|par-left|<quote|3fn>|5.2.0.3<space|2spc>Mutability
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>>

      <with|par-left|<quote|3fn>|5.2.0.4<space|2spc>The value restriction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <with|par-left|<quote|3fn>|5.2.0.5<space|2spc>``Polymorphism''
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Implementation
      tools> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix
      A<space|2spc>Detailed typing rules for <error|compound brick>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
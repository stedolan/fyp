<TeXmacs|1.0.7.10>

<style|<tuple|book|section-book>>

<\body>
  <new-page*><set-this-page-footer|><set-this-page-header|><strong|<with|font-base-size|24|<with|font-base-size|20|Declaration>>>

  \;

  \;

  \;

  \;

  \;

  I hereby declare that this thesis is entirely my own work and that it has
  not been submitted as an exercise for a degree at any other university.

  <vspace|2in>

  <\center>
    <underline|<space|3in>> April 11, 2011

    Stephen Dolan
  </center>

  \;

  <new-page*><set-this-page-footer|><set-this-page-header|><strong|<with|font-base-size|24|<with|font-base-size|20|Permission
  to Lend>>>

  \;

  \;

  \;

  \;

  \;

  I agree that the Library and other agents of the College may lend or copy
  this thesis upon request.

  <vspace|2in>

  <\center>
    <underline|<space|3in>> April 11, 2011

    Stephen Dolan
  </center>

  \;

  \;

  <new-page*><set-this-page-footer|><set-this-page-header|><strong|<with|font-base-size|24|<with|font-base-size|20|Acknowledgements>>>

  \;

  \;

  <\with|par-par-sep|1cm>
    I'd like to thank my supervisor Glenn Strong for his help and advice
    throughout this project, and for keeping me roughly on-track despite my
    constant attempts to veer into side-projects.

    I'd also like to thank David Gregg for some enlightening discussions on
    some language implementation issues.

    I thank my family for their continued support while I was working on
    this.

    Finally, I thank Louise for keeping me vaguely sane.
  </with>

  <new-page*>

  <set-this-page-header|><assign|brick|<macro|<name|Brick>>>

  <assign|chapquote|<\macro|quote|person>
    \;

    <\with|par-mode|right>
      <\em>
        <with|font-base-size|12|par-right|0.5cm|<arg|quote>>

        <\with|par-right|2cm>
          <\strong>
            <arg|person>
          </strong>
        </with>
      </em>

      <vspace|0.2cm>
    </with>
  </macro>>

  <center|<name|<strong|Abstract>>>

  <\with|par-right|3cm>
    <\with|par-left|4cm>
      <\with|par-left|3cm>
        We present <brick>, a new imperative programming language. <brick>
        features static typing with subtyping and object-oriented features.
        The language has full type inference, a feature rarely successfully
        combined with imperative constructs. The type inference engine is
        based heavily on previous work, but we present some new
        implementation techniques and a novel method of integrating
        nominative classes with inference.

        <brick> also has an interesting modular implementation which
        abstracts over concepts like control flow and naming, removing
        redundancy present in traditional langauge implementations. This
        enables a single implementation to be re-used for interpretation,
        compilation and type checking.
      </with>
    </with>
  </with>

  \;

  \;

  \;

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    1.1<space|2spc>Background <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>

    <with|par-left|1.5fn|1.1.1<space|2spc>Type systems
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1.5fn|1.1.2<space|2spc>Subtyping and object-orientation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1.5fn|1.1.3<space|2spc>Nominative and structural types
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1.5fn|1.1.4<space|2spc>``Polymorphism''
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    1.2<space|2spc>Outline of syntax and semantics
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>

    1.3<space|2spc><with|font-shape|small-caps|Brick>'s type system
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>

    <with|par-left|1.5fn|1.3.1<space|2spc>Constructing types
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1.5fn|1.3.2<space|2spc>Constraints and subtyping
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1.5fn|1.3.3<space|2spc>Integrating nominative and
    structural typing <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1.5fn|1.3.4<space|2spc>The type system and inference
    engine <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    1.4<space|2spc>Language implementation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>

    <with|par-left|1.5fn|1.4.1<space|2spc>Traditional language
    implementations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1.5fn|1.4.2<space|2spc><with|font-shape|small-caps|Brick>'s
    implementation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <vspace*|2fn><\with|font-series|bold|math-font-series|bold|font-size|1.19>
      <\with|par-mode|center>
        Part I:

        Language Design
      </with>
    </with> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16><vspace|1fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Type
    inference as constraint solving> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>

    2.1<space|2spc>Constructors and Variance
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>

    <with|par-left|1.5fn|2.1.1<space|2spc><with|mode|math|\<top\>> and
    <with|mode|math|\<bot\>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    2.2<space|2spc>Ground types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>

    <with|par-left|1.5fn|2.2.1<space|2spc>Equirecursive and isorecursive data
    types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21>>

    <with|par-left|1.5fn|2.2.2<space|2spc>Subtyping between ground types
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>>

    2.3<space|2spc>rc types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>

    <with|par-left|1.5fn|2.3.1<space|2spc>Denotation of an rc type
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    2.4<space|2spc>Constraints and well-typedness
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>

    2.5<space|2spc>Structural decomposition
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>

    <with|par-left|1.5fn|2.5.1<space|2spc>Formal definition of constructor
    lattice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    2.6<space|2spc>Closure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    type inference engine> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29><vspace|0.5fn>

    3.1<space|2spc>The small terms invariant
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30>

    3.2<space|2spc>Merging constraints <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31>

    3.3<space|2spc>The mono-polarity invariant and garbage collection
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-32>

    <with|par-left|1.5fn|3.3.1<space|2spc>Small constructed types
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-33>>

    <with|par-left|1.5fn|3.3.2<space|2spc>Garbage collection of constraint
    sets <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-34>>

    3.4<space|2spc>Representing the constraint set
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-35>

    <with|par-left|1.5fn|3.4.1<space|2spc>Implementation detail
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36>>

    3.5<space|2spc>The incremental closure algorithm
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37>

    3.6<space|2spc>Type simplification and optimisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38>

    <with|par-left|1.5fn|3.6.1<space|2spc>Canonisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39>>

    <with|par-left|1.5fn|3.6.2<space|2spc>Minimisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40>>

    3.7<space|2spc>rc type subsumption <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-41>

    <with|par-left|1.5fn|3.7.1<space|2spc>Subsumption
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-42>>

    <with|par-left|1.5fn|3.7.2<space|2spc>Entailment
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-43>>

    3.8<space|2spc>Display <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-44>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Semantics
    and object model> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-45><vspace|0.5fn>

    4.1<space|2spc>Structures <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-46>

    <with|par-left|1.5fn|4.1.1<space|2spc>Mutability and typing
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-47>>

    4.2<space|2spc>Optional type annotations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-48>

    <with|par-left|1.5fn|4.2.1<space|2spc>Checking type annotations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-49>>

    4.3<space|2spc>Classes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-50>

    <with|par-left|1.5fn|4.3.1<space|2spc>Class members
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-51>>

    <with|par-left|1.5fn|4.3.2<space|2spc>Constructors
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-52>>

    4.4<space|2spc>Generalised and ungeneralised bindings
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-53>

    <with|par-left|1.5fn|4.4.1<space|2spc>The value restriction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-54>>

    4.5<space|2spc>Integration of nominative and structural typing
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-55>

    <with|par-left|1.5fn|4.5.1<space|2spc>A potential problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-56>>

    <with|par-left|1.5fn|4.5.2<space|2spc>Formal model of classes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-57>>

    <with|par-left|1.5fn|4.5.3<space|2spc>The object constructor lattice
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-58>>

    <with|par-left|1.5fn|4.5.4<space|2spc>Interface intersection types
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-59>>

    <vspace*|2fn><\with|font-series|bold|math-font-series|bold|font-size|1.19>
      <\with|par-mode|center>
        Part II:

        Language Implementation
      </with>
    </with> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-60><vspace|1fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Implementation
    tools> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-61><vspace|0.5fn>

    5.1<space|2spc>Haskell <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-62>

    <with|par-left|1.5fn|5.1.1<space|2spc>Laziness
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-63>>

    <with|par-left|1.5fn|5.1.2<space|2spc>Monads
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-64>>

    5.2<space|2spc>Happy and Alex <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-65>

    5.3<space|2spc>LLVM <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-66>

    <with|par-left|1.5fn|5.3.1<space|2spc>LLVM IR
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-67>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Extending
    an interpreter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-68><vspace|0.5fn>

    6.1<space|2spc>Meta-circular interpreters
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-69>

    6.2<space|2spc>Monadic interpreters <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-70>

    6.3<space|2spc>Generalising <with|font-family|tt|math-font-family|ttt|eval>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-71>

    6.4<space|2spc>Generalising <with|font-family|tt|math-font-family|ttt|eval>
    further <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-72>

    6.5<space|2spc>Generalising <with|font-family|tt|math-font-family|ttt|eval>
    even further <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-73>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>A
    compiler from an interpreter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-74><vspace|0.5fn>

    7.1<space|2spc>A code generation monad
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-75>

    7.2<space|2spc>Representing flow control
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-76>

    <with|par-left|1.5fn|7.2.1<space|2spc>Coalescing
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-77>>

    <with|par-left|1.5fn|7.2.2<space|2spc>Iteration
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-78>>

    <with|par-left|1.5fn|7.2.3<space|2spc>Aside: Arrows
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-79>>

    7.3<space|2spc>Implementation of structures
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-80>

    7.4<space|2spc>Implementation of closures
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-81>

    7.5<space|2spc>A typechecker from an interpreter
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-82>

    7.6<space|2spc>Primitive operations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-83>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Conclusions
    and future work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-84><vspace|0.5fn>

    8.1<space|2spc>Current state of the implementation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-85>

    8.2<space|2spc>Future work <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-86>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Appendix
    A<space|2spc>BNF grammar for the syntax of
    <with|font-shape|small-caps|Brick>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-87><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Appendix
    B<space|2spc>Detailed typing rules for
    <with|font-shape|small-caps|Brick>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-88><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-89><vspace|0.5fn>
  </table-of-contents>

  \;

  <chapter|Introduction>

  <\chapquote|They have been at a great feast of languages, and stolen the
  scraps.>
    William Shakespeare,

    ``Love's Labour's Lost'
  </chapquote>

  This report describes the design and implementation of the object-oriented
  imperative language <brick>. <brick> has a sophisticated type system,
  supporting global type inference, subtyping and seamless integration of
  nominative and structural typing. <brick>'s prototype implementation has an
  unusual and interesting compiler architecture, combining and abstracting
  several previously separate parts of a language implementation.

  The language itself is quite a straightforward one, in the vein of dynamic
  scripting languages like Lua, Python or Ruby. The innovation of <brick> is
  to support the easy prototyping and fast development cycle of dynamic
  scripting languages while still providing a static guarantee of type
  safety. The type inference system will statically prove the absence of
  identifier misspellings or type errors, while allowing a lightweight coding
  style which requires no explicit type annotations.

  It combines the clarity and ease of development characteristic of scripting
  languages with the software engineering advantages of static type safety,
  without needing the intrusive type declarations found in other imperative
  languages like Java or C++.

  <section|Background>

  The design of the language sought to improve upon most imperative,
  object-oriented languages by importing a number of advanced features from
  functional programming languages. Features like type inference and
  structural typing are common in statically-typed functional languages, and
  seemed worth trying out in an object-oriented imperative setting.

  <subsection|Type systems>

  The type systems of contemporary programming languages may be classified
  along a number of axes:

  <\description>
    <item*|Static versus Dynamic>Static type systems perform their type
    analysis and determine whether a program is type-correct before the
    program runs at all, while dynamic type systems check for errors during
    execution. The important distinction is that a static type system can
    guarantee the absence of type errors from any possible run of a program;
    a dynamic type system can only check for the absence of type errors in a
    given execution of a program.

    <item*|Manifest versus Inferred>In the case of static typing, how many
    type annotations must be provided by the programmer? Manifest type
    systems are easier to implement, since the problem of verifying existing
    type annotations is easier than the problem of producing them. Type
    inference places less of a burden on the programmer, and often increases
    the signal-to-noise ratio of the program text by removing irrelevant
    annotations.

    <item*|Strong versus Weak>These terms have fuzzy definitions, largely
    because ``weak'' is considered perjorative and every language designer
    wants to call their system ``strongly typed''. To a first approximation,
    these terms indicate how the system responds to seemingly ill-typed
    expressions: will an attempt to add a string to an integer be an error
    (``strong typing'', as in Java, C#, Python, etc.) or will it cause a
    silent conversion (``weak typing'', as in PHP, Perl, etc.).

    <item*|Nominative versus Structural>Are types considered compatible based
    on whether they support the same set of operations, or based on whether
    they declare the same type? Are two differently-named types
    interchangeable if they have the same definition? Many ``scripting''
    languages (Python, PHP, Ruby) prefer structural typing, whereas others
    (Java, C#) use only nominative types.
  </description>

  By these metrics, <brick> is strongly and statically typed, with inference:
  typechecking is performed without reference to a particular set of inputs,
  there are no implicit conversions between unrelated types and types need
  not be explicitly spelled out. Where <brick> falls on the
  nominative-structural scale is a more interesting question, which will be
  answered thoroughly in section <reference|nomstruct>.

  <subsection|Subtyping and object-orientation>

  Subtyping allows an object with a specific interface to be used when a
  general one is expected.

  Subtyping is one of the primary mechanisms for producing modularity in
  object-oriented programs: if a method takes a parameter with certain
  interface, then any object which provides that interface may be passed. The
  method doesn't care about which other operations the parameter object may
  support; it uses only a specific subset of them. More modular programs can
  be written as the method need not know about the exact details of what else
  the object can do.

  Subtyping allows information to flow freely from specific to general. No
  tedious ``wrapping'' or ``unwrapping'' is required to pass the object with
  a detailed interface to the method that required only part of the
  interface, since subtyping allows one to transparently ``forget'' about
  parts of an interface.

  Treatments of subtyping require careful thought about the direction of
  data-flow: information is only allowed to flow from a specific type to a
  general type. So, when providing input to a module we may give it an object
  of a more specific type than required, but when receiving output we may
  treat the output as a more <with|font-shape|italic|general> type than
  provided.

  Subtyping presents interesting problems for type inference, as a system of
  subtyping constraints is more difficult to solve than a system of term
  equations. However, the typings produced by an inference system with
  subtyping are more precise as they take into account the direction of data
  flow.

  <subsection|Nominative and structural types>

  Subtyping systems can be divided into ``nominative'' and ``structural''.
  Nominative systems consider types to compatible only if they are explicitly
  declared so, while structural systems consider compatible any types having
  a similar interface.

  For instance,

  <center|<verbatim|<tabular|<tformat|<cwith|2|7|2|2|cell-lborder|0.2pt>|<cwith|1|1|1|2|cell-halign|c>|<table|<row|<cell|<math|Java>>|<cell|<math|Python>>>|<row|<cell|void
  writelist\<less\>T\<gtr\>(Iterable\<less\>T\<gtr\> list,>|<cell|def
  writelist(list, file):>>|<row|<cell| \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Writer
  file) {>|<cell| \ for i in list:>>|<row|<cell| \ foreach (T i: list)
  {>|<cell| \ \ \ file.write(str(i))>>|<row|<cell|
  \ \ \ file.write(i.toString());>|<cell|>>|<row|<cell|
  \ }>|<cell|>>|<row|<cell|}>|<cell|>>>>>>>

  The two examples implement the same function, once in Java and once in
  Python. The Java version requires that its first argument is declared as
  implementing the interface <tt|Iterable\<less\>T\<gtr\>>, while the Python
  version will accept any list-like object which has certain methods.

  Nominative subtyping has historically been standard in mainsteam
  statically-typed OO languages like Java or C++, where all relationships
  between types are explicitly<\footnote>
    and verbosely!
  </footnote> indicated. Structural typing is more common in research
  languages, as structural type systems can be defined which accept precisely
  the set of programs whose execution would not cause an error.

  Both systems have advantages: nominative typing recognises only those
  relationships defined by the programmer, and hence has a smaller chance of
  accepting programs which are semantically wrong but do not cause an
  execution error. Structural subtyping sees all possible compatibilities,
  and so requires less boilerplate annotations to reuse common code.

  <subsection|``Polymorphism''>

  ``Polymorphism'' in general means using the same code with different types.
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

  <section|Outline of syntax and semantics>

  <brick>'s syntax is broadly similar to that of Lua or to a lesser extent
  Ruby. A function definition might look like:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|def
  myfunction(argument) do>>|<row|<cell| \ # Comments are introduced with the
  '#' symbol>>|<row|<cell| \ var x = 42, y = 16 \ \ # Variables are declared
  with ``var''>>|<row|<cell| \ def pi = 3.14159 \ \ \ \ # ``def'' is like
  ``var'', but for constants>>|<row|<cell| \ if x \<gtr\> 0 then do \ \ \ \ #
  if-then-else for conditionals>>|<row|<cell| \ \ \ something()
  \ \ \ \ \ \ \ # function call>>|<row|<cell| \ else do>>|<row|<cell|
  \ \ \ while x \<less\>= 0 do \ \ \ # while loops>>|<row|<cell|
  \ \ \ \ \ something( \ \ \ \ \ \ # first class functions and
  closures>>|<row|<cell| \ \ \ \ \ \ \ function (z) do>>|<row|<cell|
  \ \ \ \ \ \ \ \ \ print(z) \ \ \ \ # prints the argument>>|<row|<cell|
  \ \ \ \ \ \ \ \ \ print(x) \ \ \ \ # prints ``42'', as defined
  above>>|<row|<cell| \ \ \ \ \ \ \ end)>>|<row|<cell|
  \ \ \ end>>|<row|<cell| \ end>>|<row|<cell| \ var pt = {x=10, \ \ \ \ \ #
  structure types>>|<row|<cell| \ \ \ \ \ \ \ \ \ \ \ y=20}>>|<row|<cell|
  \ var ptx:int = pt.x \ \ # type annotations and structure
  access>>|<row|<cell| \ return pt.y \ \ \ \ \ \ \ \ \ # return
  values>>|<row|<cell|end>>>>>>>

  Specific features of <brick> will be described in the following chapters,
  and a BNF grammar is given in appendix <reference|grammar>.

  The semantics of <brick> are fairly standard: it supports the usual
  imperative flow control features (<tt|if>, <tt|while>, <tt|break>,
  <tt|return> and the like), definition of functions, variables, constants
  and classes (see section <reference|classes>), and access to fields and
  methods of structures. Functions in <brick> are first-class and have full
  lexical scoping, and support the construction of closures (functions which
  refer to their environment, as in the call to <tt|print(x)> in the example
  above).

  Structures in <brick> are mappings from a fixed set of string field names
  to arbitrary values, including functions and other structures. The set of
  fields of a structure is fixed at creation-time, although the values can
  change.

  The interesting parts of <brick> are not in the semantics of the language:
  these are quite standard and strongly resemble other imperative languages
  like Lua or Python. The innovation of <brick> is to define a full static
  type-system for such a language, which supports static analysis and type
  inference even within a very lightweight, scripting-style language.

  \ <section|<brick>'s type system>

  <brick> has a rich type system, supporting structures, objects, first-class
  functions and classes. It also supports global type inference, so type
  annotations are not necessary (although may be included as a form of
  machine-checked documentation).

  <subsection|Constructing types>

  <brick> supports a number of primitive types, such as <tt|bool> which
  represents Boolean values and <tt|int> which represents integers. There are
  also more complex types, such as <math|<tt|int\<rightarrow\>int>>, which
  represents the type of functions taking an integer and returning an
  integer, and <math|<around*|{|<tt|x>:<tt|int>,<tt|y>:<tt|int>|}>>, which
  represents the type of structures having an <tt|x> field and a <tt|y>
  field, both of integer type.

  These basic types are treated uniformly as <dfn|type constructors>. Each
  type constructor takes a number of types as parameters, and constructs a
  more complex type out of them. For instance, <tt|int> and <tt|bool> are
  type constructors taking no parameters, while <math|\<rightarrow\>> is a
  type constructor taking two parameters: the argument and result types.
  Similarly, <math|<around*|{|<tt|x>,<tt|y>|}>> is a type constructor taking
  two parameters: the types of the <tt|x> and <tt|y> fields.

  <subsection|Constraints and subtyping>

  A program is typechecked by constructing a series of subtyping constraints
  on its type. For instance, this simple function is of type <math|f>:

  <center|<verbatim|<tabular|<tformat|<cwith|1|3|2|2|cell-halign|r>|<table|<row|<cell|def
  f(x) do>|<cell|<math|a\<rightarrow\>b>>|<cell|<math|\<leqslant\>>>|<cell|<math|f>>>|<row|<cell|
  \ var y = x.part>|<cell|<math|a>>|<cell|<math|\<leqslant\>>>|<cell|<math|<around*|{|<tt|part>:c|}>>>>|<row|<cell|
  \ return y.subpart>|<cell|<math|c>>|<cell|<math|\<leqslant\>>>|<cell|<math|<around*|{|<tt|subpart>:b|}>>>>|<row|<cell|end>|<cell|>|<cell|>|<cell|>>>>>>>

  The program will run without type errors if the constraints on the right
  are satisfied. The constraints are resolved by the type inference engine,
  which eventually pronounces the program type-correct or gives an error.

  These subtyping constraints require a notion of subtyping between types. As
  described previously, subtyping works in a different direction for inputs
  and for outputs. A component providing an output may be considered
  <with|font-shape|italic|a fortiori> to provide any less specific type of
  output; thus the output type becomes more specific as the component type
  becomes more specific. An input to the component, on the other hand, may be
  given any more specific type of input; thus the input type becomes more
  specific as the component type becomes more
  <with|font-shape|italic|general>.\ 

  For instance, a process taking as input any box and producing a wrapped box
  can be safely considered as a process taking blue boxes and producing
  wrapped boxes. Thus,

  <\equation*>
    box \<rightarrow\> wrapped box\<leqslant\>blue box\<rightarrow\>wrapped
    box
  </equation*>

  It may not, however, be considered to be a process producing blue boxes, as
  not all wrapped boxes need be blue. But, it may be considered to produce
  boxes in general, as all wrapped boxes are boxes. Thus,

  <\equation*>
    box\<rightarrow\>wrapped box\<leqslant\>box \<rightarrow\>box
  </equation*>

  This ``direction of subtyping'' is a property of each parameter of the type
  constructor. Those parameters which work like outputs are said to be
  <with|font-shape|italic|covariant>: the type gets narrower as the parameter
  gets narrower. Conversely, input-like parameters are said to be
  <with|font-shape|italic|contravariant>.

  A subtlety arises with parameters can which can be used as both inputs and
  outputs, such as the fields of a structure (which can be read or modified).
  To see how this is resolved, see section <reference|mutability>.

  <subsection|Integrating nominative and structural typing>

  The language seeks to combine nominative and structural typing seamlessly,
  and allow a programmer to mix-and-match the two styles.

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
  multi-methods) and a full proof of soundness.

  Unlike <brick>, none of these languages attempt to tackle the problem of
  integrating type inference with this system.

  <subsection|The type system and inference engine>

  The description of the type system and inference engine will be split into
  two sections. The next two chapters will describe the inference engine
  abstractly, without reference to a specific set of type constructors
  (although <math|\<rightarrow\>> and structure types will be used to
  illustrate examples). The abstract inference engine will work for any
  system of type constructors which satisfies certain properties, formalised
  in <reference|constructorlattice>. The following chapter will describe
  <brick>'s parameterisation of this generic system, and how it encodes
  functions, classes and objects, and how it combines the notions of
  structural and nominative types.

  The system is based originally on work defining a type system with
  subtyping and recursive types for the <math|\<lambda\>>-calculus by Amadio
  and Cardelli<cite|subrec>, with further exploration in
  <cite|subrecfast|regulartypes>. The notion of a ``constrained type'', to
  represent the type of a complex polymorphic function, was explored by
  Palsberg et al. in <cite|constrainedtypes|flowtypes|acinferenceclosure> and
  its subtyping problem by Smith and Trifonov in <cite|subconst>. The
  application of these ideas to object-oriented programming appeared in
  Eifrig et al. in <cite|isoopinference|ooprectypes>. The type inference
  engine and constraint solver described here is heavily based upon the one
  described by Pottier in <cite|pottierframework|pottierphd|pottiersimplifying>.

  Most of the statements about these type systems are presented here without
  proof. The interested reader may check those references for a more in-depth
  discussion.

  <section|Language implementation>

  The implementation sought to reduce the workload associated with the
  development of a compiler through modularity. In most language
  implementations, a compiler, interpreter and typechecker are largely
  separate bodies of code. Many algorithms which on the surface appear
  similar (such as analysing data flow through the program) must be
  implemented separately for each component.

  <subsection|Traditional language implementations>

  Consider a fairly standard language implementation consisting of just a
  compiler (code-generator, no optimisation) and a type checker. They share
  certain data structures and algorithms: For instance, both must understand
  the control flow constructs of the language, and both must be able to
  access the symbol table. The flow of data through the program (for
  instance, matching up definitions with uses) must be reimplemented by both:
  the compiler must map each symbol to a storage location, while the
  typechecker must redo this, mapping each symbol to a type variable.

  Also, when compiling higher-level flow control constructs like loops with
  early exits, the compiler must be careful to generate the correct sequence
  of labels and jumps in order to match up all of the paths through the
  program. Writing an interpreter for such a construct is straightforward,
  yet extra effort must go in to writing a correct compiler.

  <subsection|<brick>'s implementation>

  Using functional programming techniques, <brick>'s implementation abstracts
  away the common parts of the language's semantics into a single
  ``evaluator''. This is used by all phases of the compiler, and contains a
  single definition of the common semantics (e.g. control flow, symbol
  resolution, bindings, matching operands to operators) while each of the
  phases need only implement a small set of primitive operations (e.g. loads,
  stores and functions).

  Thus, we gain a compiler and a type-checker, without having to write them!
  We write a very simple interpreter, and re-use its definition of the
  language in the two other phases.

  In particular, this reduces the amount of work necessary to experiment with
  a new language feature: it is much easier to add a feature to this system
  than to a traditional compiler, which is very valuable in an exploratory
  project such as this one. When a language feature requiring a new primitive
  operation is added, it can first be implemented in the interpreter and then
  most of that implementation can be re-used if it is decided to add support
  to the compiler.

  For instance, those parts of the implementation which deal with issues such
  as high-level control flow constructs or resolving symbol names are only
  implemented once, in an abstract fashion. This abstract implementation can
  be transparently re-used by the various components of the implementation.

  <\part*>
    <\with|par-mode|center>
      Part I:

      Language Design
    </with>
  </part*>

  <chapter|Type inference as constraint solving>

  <\chapquote|The more constraints one imposes, the more one frees oneself of
  the chains that shackle the spirit ... the arbitrariness of the constraint
  only serves to obtain precision of execution.>
    Igor Stravinsky,

    ``The Poetics of Music''
  </chapquote>

  We will now outline the structure of <brick>'s type inference system in an
  abstract fashion, without reference to the specific set of type
  constructors. The inference system is thus generic, and can be applied to
  an almost arbitrary set of actual types. The parameterisation chosen by
  <brick> and how it is applied to the language's features will be outlined
  in chapter 4.

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
    <item>Primitive types such as <tt|int> and <tt|bool>

    <item>Structure types such as <math|<around*|{|<tt|foo>:a,<tt|bar>:b|}>>,
    which is the type of structures having a field <tt|foo> of type <math|a>
    and a field <tt|bar> of type <math|b>.

    <item>The unit type (written <math|<around*|(||)>> in descriptions of the
    type system and <tt|void> in <brick> source)

    <item>User-defined classes (see section <reference|classes>)

    <item>The special types <math|\<top\>> and <math|\<bot\>> (<tt|any> and
    <tt|none> in source code)
  </itemize>

  The type inference engine doesn't depend on the exact set of constructors.
  We leave the exact description of which type constructors are available and
  what their semantics are for chapter <reference|chapsemantics>, and
  describe the type inference engine generically.

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
  <with|font-shape|italic|weakening> what we say about its parameter.

  The space of type constructors is equipped with a subtype ordering which
  we'll denote <math|\<leqslant\><rsub|\<bbb-c\>>> to distinguish it from the
  subtype ordering <math|\<leqslant\>> on fully constructed types. This
  ordering forms a lattice. That is, for any two type constructors <math|a>
  and <math|b> we can form their greatest lower bound (that type constructor
  which is a supertype of any type constructor which is a subtype of both
  <math|a> and <math|b>), and their least upper bound (that type constructor
  which is a subtype of any type constructor which is a supertype of both
  <math|a> and <math|b>).

  With just the type constructors <with|mode|math|\<top\>\<nocomma\>\<nocomma\>\<nocomma\>>,
  <math|\<nocomma\>\<rightarrow\> and \<bot\>>, the ordering is simply
  <math|\<bot\>\<leqslant\><rsub|\<bbb-c\>>\<rightarrow\>
  \<leqslant\><rsub|\<bbb-c\>>\<top\>>. The ordering for the full set of type
  constructors is somewhat more complex (see chapter
  <reference|chapsemantics>, particularly section <reference|objectlattice>).

  As well as forming a lattice, there is one extra condition attached to the
  space of type constructors called <with|font-shape|italic|convexity of
  arity>. It is explained fully in section <reference|constructorlattice>.

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
  <math|\<bot\>>,<math|\<top\>> or <tt|int>), and the branch nodes of the
  tree are non-nullary type constructors (such as <math|\<rightarrow\>> or
  <math|<around*|{|<tt|field1>,<tt|field2>|}>>) where the children of a
  branch node correspond to the parameters to the type constructor.

  A regular tree is essentially an infinite tree with regular structure,
  which allows us to encode the recursive data types necessary for
  object-oriented programming. For instance, an object-oriented
  singly-linked-list data type may have methods <tt|insert>, <tt|delete>,
  <tt|find> (all having some function type) and a field <tt|next>, having the
  same type as the list itself. Thus, we cannot represent the type of the
  list as a finite tree, since one subtree may refer recursively to the whole
  tree.

  Regular trees have many equivalent definitions and representations, some of
  which are:

  <\description>
    <item*|An infinite sequence of finite trees>The infinite regular tree can
    be approximated by a sequence of finite trees of increasing depth. Also,
    the regular tree can be considered to be an infinite tree with only
    finitely many distinct subtrees.

    <item*|Directed graphs>A directed acyclic graph structure is used by many
    typecheckers to efficiently describe finite trees which may share
    subtrees. If we allow cycles in the graph, the set of trees described is
    extended to include the regular trees.

    <item*|A term automaton>A finite state machine where the transitions move
    from a type to a part of that type (a constructor parameter) can be used
    to represent types in much the same way as a directed graph does.

    <item*|A solution to a series of unification equations>The solution to a
    system of equations to be solved by term unification is a regular tree in
    the general case. Many systems relying on unification (Prolog, ML
    typecheckers) restrict this to finite trees by the addition of the
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
  <math|\<lambda\>x.x x>) is almost never a useful operation. As future work,
  it may be interesting to investigate extensions of the type system which
  allow equirecursive structure types (thus allowing lists, trees and so on
  to be used with little effort) while banning equirecursive function types
  (as these are more often than not entirely incomprehensible).

  The reason for allowing equirecursive types was in the end a practical one.
  As will be seen when the concept of closure of a constraint set is defined,
  it is relatively easy to determine whether a constraint set is satisfiable
  in the space of regular trees. However, there does not seem to be any easy
  way to check whether a constraint set is satisfiable using only finite
  trees: there is no simple analogue of the ``occurs check'' when dealing
  with inequality rather than equality constraints<cite|pottierphd>.

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
  <math|c\<leqslant\><rsub|\<bbb-c\>>c<rprime|'>> and whether
  <math|t\<leqslant\>t<rprime|'>> (or <math|t<rprime|'>\<leqslant\>t>, when
  contravariant) for all types associated to a label that <math|c> and
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
  each point in the program. Ground types correspond roughly to the
  monomorphic types of functional programming languages such as ML and
  Haskell.

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
  constraints on the variables defined in the type. In general, we'll write
  rc types as <math|a\\C> where <math|a> is a type or type variable and
  <math|C> is a set of constraints.

  <subsection|Denotation of an rc type><label|rcdenotation>

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

  The set of ground types denoted by an rc type <math|a\\C> is the set of
  ground types that can be formed by substituting the free variables of
  <math|a\\C> with ground types, as long as the constraints in <math|C> still
  hold. This set is upwards-closed: the denotation of an rc type also
  includes all supertypes, as a term of a subtype can transparently be
  considered to conform to the supertype as well.

  <section|Constraints and well-typedness>

  The process of type inference is reduced to the process of building an rc
  type from the program source. For each operation in the program, a
  constraint is generated to assert that the operands support the requested
  operation. So, the rc type of a term includes all of the constraints
  necessary to ensure that the term has a valid meaning (is type-correct).

  Hence, our criterion for whether a program fragment is well-typed is to
  consider whether its constraint set is <with|font-shape|italic|satisifiable>
  (or equivalently, whether its denotation as defined above is non-empty).
  Each solution of the constraint set corresponds to a valid run of the
  program, and typechecking simply seeks to ensure that at least one exists.
  We don't solve the constraint set and pick out solutions, we merely need to
  prove that at least one solution exists, and then compile the program in
  such a way that it will work for any solution to the constraints.

  <section|Structural decomposition><label|subc>

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
  where <math|c\<leqslant\><rsub|\<bbb-c\>>c<rprime|'>> according to the
  subtype ordering on constructors. <math|c> takes parameters with labels
  draw from <math|L>, and <math|c<rprime|'>> takes parameters with labels
  from <math|L<rprime|'>>. Let <math|l<rsub|1>>, <math|l<rsub|2>>,
  <math|\<ldots\>> denote arbitrary elements of <math|L> (and
  <math|l<rprime|'><rsub|1>>,<math|l<rprime|'><rsub|2>,\<ldots\>> denote
  elements of <math|L<rprime|'>>)

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
  is <tt|field1> which is covariant, and so decomposition results in the
  single constraint <math|a\<leqslant\>c>.

  <tt|field2> is essentially ignored in the decomposition and does not appear
  in the decomposed set. This is the correct behaviour, as the given
  constraint does not in fact place any constraints upon the type <math|b>.

  This decomposition operation will be written
  <math|subc<around*|(|\<tau\>\<leqslant\>\<tau\><rprime|'>|)>>. It is only
  well defined when <math|c\<leqslant\><rsub|\<bbb-c\>>c<rprime|'>>, where
  <math|c> and <math|c<rprime|'>> are the constructors of <math|\<tau\>> and
  <math|\<tau\><rprime|'>> respectively.

  <subsection|Formal definition of constructor
  lattice><label|constructorlattice>

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
  <math|+> and <math|-> respectively.

  A <dfn|constructor lattice> consists of:

  <\itemize>
    <item>A set of constructors, <math|\<bbb-C\>> (whose elements are
    <math|c<rsub|1>>, <math|c<rsub|2>>, etc.)

    <item>A set of labels, <math|\<bbb-L\>> (whose elements are
    <math|l<rsub|1>>, <math|l<rsub|2>\<nocomma\>>, etc.)

    <item>A mapping <math|\<bbb-C\>\<rightarrow\>\<cal-P\><around*|(|\<bbb-L\>|)>>,
    called the arity of a constructor

    <item>A mapping <math|\<bbb-L\>\<rightarrow\><around*|{|+,-|}>>, called
    the variance of a label

    <item>An ordering <math|\<leqslant\><rsub|\<bbb-c\>>> defined on
    <math|\<bbb-C\>>, known as constructor subtyping
  </itemize>

  It must satisfy the following conditions:

  <\itemize>
    <item><math|\<leqslant\><rsub|\<bbb-c\>>> forms a lattice

    <item>For all <math|c<rsub|1>,c<rsub|2>,c<rsub|3>\<in\>\<bbb-C\>> such
    that <math|c<rsub|1>\<leqslant\><rsub|\<bbb-c\>>c<rsub|2>\<leqslant\><rsub|\<bbb-c\>>c<rsub|3>>,
    <math|arity<around*|(|c<rsub|1>|)>\<cap\>arity<around*|(|c<rsub|3>|)>\<subseteq\>arity<around*|(|c<rsub|2>|)>>
  </itemize>

  The second condition here is known as <dfn|convexity of arity>, and is
  important to the workings of ``<math|subc>'' above. ``subc'' operates only
  on the common parameters of the two constructors, and so this condition
  means that it is impossible to ignore parameters which will later be
  constrained: as the bound of a constraint moves up the constructor lattice,
  labels will never disappear and then reappear.

  Also note that since variance is a property of labels rather than of
  constructors, a label must have the same variance for each constructor in
  which it appears.\ 

  One more note on variances: the set <math|<around*|{|+,-|}>> forms a
  monoid: the monoid of two elements, with <rigid|identity <rigid|<math|+>.>>
  Thus, we have an operation for combining variances:

  <\eqnarray>
    <tformat|<table|<row|<cell|+\<cdot\>+>|<cell|=>|<cell|+>>|<row|<cell|+\<cdot\>->|<cell|=>|<cell|->>|<row|<cell|-\<cdot\>+>|<cell|=>|<cell|->>|<row|<cell|-\<cdot\>->|<cell|=>|<cell|+>>>>
  </eqnarray>

  This expresses the notion that appearing contravariantly in a contravariant
  position causes a term to appear covariantly in the whole type, and will be
  useful for some definitions of the operations on constraint sets in the
  next sections, including the polarity of a variable.

  Generally, a positive variance indicates an output, while a negative
  variance indicates an input. Terms that can be used as both outputs and
  inputs (e.g. mutable variables) require special treatment (see
  <reference|mutability>).

  <section|Closure><label|closure>

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

  Any closed graph is satisfiable, and any satisfiable constraint set can be
  closed<cite|pottierphd|isoopinference>. So, satisfiability can be checked
  by attempting to compute the closure of the constraint set.

  Closure computations form the core activity of the type inference engine.
  We maintain the constraint set in a compact form known as a constraint
  graph, and ensure that at all times the constraint graph is closed. Typing
  errors then manifest themselves by a failure to decompose a constraint, or
  equivalently by adding a constraint between constructed types where the
  left-hand side's constructor is not in fact a subtype of the right-hand
  side's constructor.

  <chapter|The type inference engine>

  <\chapquote|It is not really difficult to construct a series of inferences,
  each dependent upon its predecessor and each simple in itself. If, after
  doing so, one simply knocks out all the central inferences and presents
  one's audience with the starting-point and the conclusion, one may produce
  a startling, though perhaps a meretricious, effect.>
    Sir Arthur Conan Doyle,

    ``The Dancing Men''
  </chapquote>

  In this chapter, we'll describe how the constraints representing a program
  are resolved to yield a type or a type error. We also describe how the
  constraint set is <with|font-shape|italic|optimised>: a constraint set
  describing an entire program can quickly become unwieldy, and techniques
  are needed to reduce it to a manageable size.

  Two invariants are proposed, both from Pottier<cite|pottierphd|pottierframework>:
  the small terms invariant, which requires that each constraint have only a
  single level of structure (similar to three-address code in a compiler),
  and the mono-polarity invariant, which allows us to distinguish between
  variables used as upper and lower bounds.

  <section|The small terms invariant>

  When representing types inside the inference engine, we use Pottier's
  ``small-terms invariant''. That is, we avoid representing complex nested
  types with multiple layers of constructors and instead ensure that each
  type is either a variable or has only a single layer of constructors.
  Complex types can be reduced to this form by introducing fresh variables to
  link the sub-parts of a type.

  For instance, if we have the type <math|<around*|(|a\<rightarrow\>b|)>\<rightarrow\><around*|(|c\<rightarrow\>d|)>>
  we would not represent it as a nested series of constructed types. Instead,
  we would introduce two new type variables <math|x> and <math|y>, and
  represent the type as <math|x\<rightarrow\>y> with the constraints that
  <math|x=a\<rightarrow\>b> and <math|y=c\<rightarrow\>d>.

  We<\footnote>
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
  As it happens, thanks to the garbage collection algorithm described below,
  we can in fact always drop one of these.

  This invariant is roughly equivalent to the standard compiler trick of
  representing all code in three-address form: by introducing lots of fresh
  temporaries, complex expression trees can be reduced to a series of
  statements whose expression part is of height at most one. It serves much
  the same purpose here as it does in an imperative language's compiler:
  implementation is simpler and optimisations based on finding common
  subexpressions are more effective (section <reference|minimisation>).

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

  We require a means of combining bounds which would allow us to combine
  these three constraints into one.

  These operations for combining bounds are the lattice-theoretic greatest
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

  <section|The mono-polarity invariant and garbage collection>

  Before we can describe the optimised representation of constraint sets, we
  must draw a distinction between <dfn|positive> and <dfn|negative> type
  variables and constructed types.\ 

  The type inferred for a particular term is a lower bound: the term may be
  used with any supertype of the inferred type. We say that the type
  ``appears positively''. If a constructed type appears positively, then its
  parameters appear positively when covariant and negatively when
  contravariant (and vice versa for negative appearances). If a variable
  appears positively, then the left-hand side of any constraint whose
  right-hand side consists of that variable appears positively, and similarly
  for negative appearances. For example, if the type of a term is <math|a>,
  with the constraint graph:

  <\eqnarray>
    <tformat|<table|<row|<cell|b\<rightarrow\>c>|<cell|\<leqslant\>>|<cell|a>>|<row|<cell|d\<rightarrow\>e>|<cell|\<leqslant\>>|<cell|b>>|<row|<cell|c>|<cell|\<leqslant\>>|<cell|f>>>>
  </eqnarray>

  <math|b\<rightarrow\>c> appears positively, as a lower bound of <math|a>
  (assumed positive, as it is the root of the type). Then, decomposing this
  constructed type, <math|c> appears positively and <math|b> appears
  negatively. Following on, <math|e> appears positively and <math|d> appears
  negatively, while <math|f> appears negatively.

  The mono-polarity invariant is this:<em| no variable appears both
  positively and negatively>.

  This is quite simply enforced: if we have a constraint set in which we
  would like to have a variable appear with both polarities, we can simply
  remove the offending variable and replace it with a pair of variables, one
  positive and one negative, with a constraint between them.

  <subsection|Small constructed types>

  Having established that no variable may be both positive and negative, we
  may now give a proper definition of variables and small constructed types.
  The variables are divided into two infinite disjoint sets
  <math|\<cal-V\><rsup|+>> (positive variables, denoted
  <math|a<rsup|+>,b<rsup|+>,\<ldots\>>) and <math|\<cal-V\><rsup|->>
  (negative variables, denoted <math|<around*|(|a<rsup|->, b<rsup|->,
  \<ldots\>|)>><\footnote>
    The polarity signs are considered part of the name, there is no implied
    relationship between <math|a<rsup|+>> and <math|a<rsup|->>.
  </footnote>.\ 

  Likewise, the <dfn|small constructed terms> are divided into two classes.
  Positive small constructed terms will be written
  <math|\<tau\><rsup|+><rsub|1>,\<tau\><rsup|+><rsub|2>,\<ldots\>> while
  negative ones are <math|\<tau\><rsub|1><rsup|->,\<tau\><rsup|-><rsub|2>>.
  We will occasionally abstract over the polarity of a term or variable and
  write <math|a<rsup|v>> or <math|\<tau\><rsup|v>> to mean a term of polarity
  <math|v\<in\><around*|{|+,-|}>>. Similarly, <math|\<box\><rsup|v>> will be
  used to abstract over <math|\<sqcup\>> and <math|\<sqcap\>>, where
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

  These rules allow any set of positive small constructed types to merged via
  <math|\<sqcup\>> into a single small constructed term, while any set of
  negative small constructed types can be merged via <math|\<sqcap\>>.

  <subsection|Garbage collection of constraint sets>

  If a variable appears neither positively or negatively in the constraint
  graph, it may be removed. This is the principle of
  <with|font-shape|italic|garbage collection>, described fully in
  <cite|subconst|pottierphd>. This is only tangentially related to garbage
  collection of heap values in a running program: it refers to the removal of
  redundant parts of a constraint set.

  For instance, suppose we have the rc type:

  <\equation*>
    a\<rightarrow\>b\\a\<leqslant\>b,b\<leqslant\>d\<rightarrow\>e
  </equation*>

  Since the type <math|a\<rightarrow\>b> appears positively, <math|b> is
  positive. <math|d\<rightarrow\>e> appears only as an upper bound for a
  positive variable, and hence <math|d> and <math|e> appear neither
  positively nor negatively. As shown by Smith and Trifonov in
  <cite|subconst> and Pottier in <cite|pottierphd>, we can safely remove this
  constraint.

  As well as this, we can safely remove any constraints between variables if
  one is not reachable. In general, the only constraints which we need to
  actually keep in our constraint graph are ones of the form:

  <\eqnarray>
    <tformat|<table|<row|<cell|positive constructed type
    >|<cell|\<leqslant\>>|<cell|positive variable>>|<row|<cell|negative
    variable>|<cell|\<leqslant\>>|<cell|negative constructed
    type>>|<row|<cell|negative variable>|<cell|\<leqslant\>>|<cell|positive
    variable>>>>
  </eqnarray>

  This allows us to define an optimised constraint graph representation and
  incremental closure algorithm which avoid storing the data which would be
  removed by the garbage collection algorithm.

  <section|Representing the constraint set>

  <math|>Thanks to the garbage collection algorithm, we can vastly limit the
  amount of information we need to store for each variable. In particular,
  for any positive variable <math|a<rsup|+>> we need only store constraints
  of the form <math|\<tau\><rsup|+>\<leqslant\>a<rsup|+>> and
  <math|a<rsup|->\<leqslant\>a<rsup|+>>. Since all of the constraints of the
  first form can be merged via <math|\<sqcup\>>, all we need to store is a
  single positive small constructed term (written
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
  The advantage of our representation is that we can store half as many
  bounds by entirely ignoring <math|C<rsup|\<downarrow\>><around*|(|a<rsup|+>|)>>,
  since the mono-polarity invariant ensures that it contains no information
  that would not be immediately removed by garbage collection. Thus, we only
  store lower bounds for positive variables, and only upper bounds for
  negative variables, thus reducing the storage requirements of type
  inferencing over previous work in this area.

  <subsection|Implementation detail>

  We now present an interesting trick for performing the garbage collection
  algorithm. Since the polarity of each variable is known, GC is only
  concerned with calculating reachability. Reachability must propagate
  through constructed bounds (<math|\<Omega\><rsup|\<tau\>><around*|(|a<rsup|v>|)>>)
  but not through variable bounds (<math|\<Omega\><rsup|\<cal-V\>><around*|(|a<rsup|v>|)>>).

  In an implementation language supporting <dfn|weak references>, such as
  Haskell<cite|haskellweak>, we can implement this by using weak references
  to store the elements of <math|\<Omega\><rsup|\<cal-V\>><around*|(|a<rsup|v>|)>>.
  This causes the Haskell garbage collector to collect a variable and destroy
  weak references to it when it becomes unreachable except through weak
  references. So, this type simplification is performed automatically by the
  system's garbage collector.

  <section|The incremental closure algorithm>

  When we want to add a constraint on existing variables to the constraint
  graph, we need to ensure that the resulting constraint graph is closed (as
  defined in section <reference|closure>). Since our garbage collection
  techniques and the simplification algorithms described later depend on the
  graph being closed, we must compute the closure of the graph incrementally.

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
  <cite|pottierphd> and <cite|isoopinference>, adapted to our constraint
  graph representation.

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

  The invocation of ``subc'' above is not well-defined when the constructor
  of <with|mode|math|\<Omega\><rsup|\<tau\>><around*|(|a<rsup|+>|)>> is not a
  subtype of the constructor of <with|mode|math|\<Omega\><rsup|\<tau\>><around*|(|b<rsup|->|)>>
  (see section <reference|subc>). If this occurs, the constraint is
  unsatisfiable, and so closure fails giving a type error.

  <section|Type simplification and optimisation>

  Since an rc type essentially encodes a constraint for each operation in the
  program source, they can grow to be very large. Due to the decomposition of
  constraints in the incremental closure algorithm, the size of the rc type
  can actually grow faster than linearly in the program size. As well as
  being unwieldy and slow to manipulate, such large types are difficult to
  understand if an error occurs or if the programmer wants to display the
  type of a function. Some method is needed for optimising them.

  Several methods for optimising rc types have appeared in the literature
  <cite|pottiersimplifying|kaesinference>. Many of these (such as the removal
  of cycles in <cite|pottiersimplifying>) are in fact unnecessary in this
  system since they are less powerful than the ``garbage collection'' done
  implicitly in the constraint graph. We use two other type optimisation
  methods: canonisation and minimisation.

  Canonisation is the removal of <math|\<sqcap\>> and <math|\<sqcup\>>-terms
  from small constucted terms in the constraint graph. As we shall see, any
  constraint graph is equivalent to a constraint graph (possibly with more
  variables) which does not include those two operations. A graph in this
  form will be referred to as ``canonical''. The algorithm is reminiscent of
  the algorithm to convert a non-deterministic finite state automaton into a
  deterministic one, by adding new states to represent sets of states in the
  original.

  Minimisation is essentially a form of common subexpression elimination,
  applied to type terms to merge redundant variables. The algorithm itself is
  very close to Hopcroft's algorithm for minimising the number of states in a
  finite state automaton<cite|hopcroftmin>. It expects a canonical constraint
  graph, and so canonisation must be run before minimisation.

  Smith and Trifonov <cite|subconst> defined canonisation, and Pottier
  <cite|pottierphd> defined canonisation and minimisation. Our implementation
  is heavily based on Pottier's: the algorithms are fundamentally identical,
  but their description is marginally different as our constraint graphs have
  a simpler form.

  In <cite|pottierphd>, Pottier's garbage collection does not necessarily
  produce a closed output constraint graph given a closed input. He then
  defines a weaker closure-like property and proves that it is preserved by
  the canonisation and garbage collection processes. In this presentation,
  due to application of the mono-polarity invariant globally and integration
  of the garbage collection algorithm with incremental closure, we know that
  all constraint graphs are always closed.

  All of our constraint graphs are maintained in the simple form referred to
  in <cite|pottierphd> as ``perfect'', and hence the results therein about
  the validity of the various optimisations (garbage collection, canonisation
  and minimisation) still hold for this system.

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
  about each <math|a<rsup|v>\<in\>S>. Then, each set of merged variables with
  more than two elements appearing as a parameter to a constructed term may
  be removed and replaced with the singleton set
  <math|<around*|{|S<rsup|v>|}>>, thus removing all instances of
  <math|\<sqcap\>> and <math|\<sqcup\>> from the graph.

  Of course, the actual implementation of the canonisation algorithm does not
  create all of the variables <math|S<rsup|+>,S<rsup|->>. Instead, the new
  variables are created lazily as a term is found which requires them, and
  the actual set of new variables inserted is calculated as a
  least-fixed-point.

  It would seem that canonisation always increases the number of terms in the
  constraint graph by adding more variables. This is not necessarily the case
  as the algorithm, while adding new variables, may cause other variables to
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
  have a <tt|doSomething> method. These constraints will be merged into a
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

  <subsection|Minimisation><label|minimisation>

  The minimisation algorithm in <cite|pottierphd> grew out of other work by
  the same author <cite|pottiersimplifying> and others based on finding
  variable substitutions which simplify the constraint graph while preserving
  its semantics.

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

    <item><math|\<Omega\><rsup|\<tau\>><around*|(|a|)>\<equiv\>\<Omega\><rsup|\<tau\>><around*|(|b|)>>
    where equivalence of small canonical constructed terms means they have
    the same constructor and the parameters are componentwise equivalent

    <item><math|\<Omega\><rsup|\<cal-V\>><around*|(|a|)>=\<Omega\><rsup|\<cal-V\>><around*|(|b|)>>
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
  singly-linked lists<\footnote>
    The condition on the ``if'' is simply <tt|true> to avoid introducing
    boolean types; the types are independent of the execution path.
  </footnote>:

  <\center>
    <\verbatim>
      <tabular|<tformat|<table|<row|<cell|def f(x) do>>|<row|<cell| \ var y =
      x>>|<row|<cell| \ if true do>>|<row|<cell| \ \ \ y =
      x.next>>|<row|<cell| \ else do>>|<row|<cell| \ \ \ y =
      x.next.next>>|<row|<cell| \ end>>|<row|<cell| \ y =
      y.next>>|<row|<cell| \ return y>>|<row|<cell|end>>>>>
    </verbatim>
  </center>

  \ The branches of the if statement combine <tt|x.next> and
  <tt|x.next.next>, thus indicating that <tt|x> has a recursive type. The
  <tt|x.next.next> expression will lead to a complex nested type, which must
  be merged with the rest of the information gleaned from the program
  structure about <tt|x>.

  So, the <brick> type inference engine generates a type with many
  redundancies for this function. The actual type generated, after
  canonisation but before minimisation, is:

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
  user, using the techniques in <reference|display>, this type would be
  rendered simply as <math|a\<rightarrow\>a\\a\<leqslant\><around*|{|<tt|next>:a|}>>.

  <section|rc type subsumption><label|subsumptionalg>

  Occasionally the question arises of whether one rc type is a subtype of
  another. This is not needed for most type inferencing operations, since the
  closure algorithm checks solvability of constraint sets without needing to
  know this. However, there are situations in which we need to decide this
  relation. In particular, a language which allows optional type annotations
  (which might be rc types with constraints and free variables) will need to
  check those type annotations against the inferred type of the program.
  Also, a language with some notion of an interface type which allows
  multiple specialised implementations of the interface (such as Haskell's
  typeclasses or Java's interfaces) will need to be able to check whether a
  given implementation of an interface in fact conforms to the type
  requirements of that inferface.

  The closure algorithm will not suffice in this case: attempting to check
  whether an implementation conforms to a previously-declared interface by
  adding constraints to the constraint set would result in the interface
  being constrained to meet the implementation. We need not to constrain the
  interface type to fit the implementation, but simply to verify that the
  implementation type corresponds to the interface as it is written.

  <subsection|Subsumption>

  In order to check user type annotations for polymorphic defitions such as
  functions, we need to be able to calculate whether one type with free
  variables (the inferred type) is a subtype of another type with free
  variables (the declared type).

  This is the subsumption relation <math|\<leqslant\><rsup|\<forall\>>>:
  <math|a<rprime|'>\\C<rprime|'>\<leqslant\><rsup|\<forall\>>a\\C<rsub|>> if
  all terms of rc type <math|a<rprime|'>\\C<rprime|'>> are also of rc type
  <math|a\\C>. Equivalently, <with|mode|math|a<rprime|'>\\C<rprime|'>\<leqslant\><rsup|\<forall\>>a\\C<rsub|>>
  if the denotation<\footnote>
    see section <reference|rcdenotation>
  </footnote> of <math|a<rprime|'>\\C<rprime|'>> is a subset of the
  denotation of <math|a\\C>. No efficient algorithm for calculating this is
  known, but efficiently decidable approximations have been
  defined<cite|pottierphd|subconst>. The algorithm answers queries of the
  form <math|a<rsup|+>\<leqslant\>b<rsup|+>> (or
  <math|c<rsup|->\<leqslant\>d<rsup|->>). Essentially, the question being
  answered by the algorithm is if the (disjoint) constraint sets of <math|a>
  and <math|b> were combined, would the resulting constraint graph be more
  restrictive than that of <math|b> on its own?

  This question is answered using the following algorithm: we perform the
  incremental closure algorithm to combine the constraint sets. However, when
  we are to add a constraint purely defined on the variables in <math|b>'s
  graph (or <math|c>'s graph, in the negative case), then rather than add it
  to the graph by incremental closure, we use the
  <with|font-shape|italic|entailment> algorithm to prove that it doesn't need
  to be added. Essentially, entailment tells us that a constraint is
  ``already present'' in the constraint graph, or that it is implied by what
  is already there.

  If this succeeds, it implies that we can combine <math|a>'s and <math|b>'s
  constraint graphs and end up with a constraint graph no more restrictive
  than that of <math|b>, and hence <math|a\<leqslant\><rsup|\<forall\>>b>.

  <subsection|Entailment>

  A constraint graph <math|C> entails a constraint
  <math|x<rsup|->\<leqslant\>y<rsup|+>> if adding that constraint to <math|C>
  would not reduce the set of solutions. That is,
  <math|C\<vdash\>x<rsup|->\<leqslant\>y<rsup|+>> if for all solutions to
  <math|C> the type assigned to <math|x<rsup|->> is a subtype of that
  assigned to <math|y<rsup|+>>. This is a more subtle notion than the
  constraint <math|x<rsup|->\<leqslant\>y<rsup|+>> simply being present in
  the constraint set: it is possible for the constraint not to be explicity
  stated but still necessarily hold in any solution. For instance, if we have
  the constraint set <math|<around*|{|a\<leqslant\>\<bot\>\<rightarrow\>a\<nocomma\>,\<bot\>\<rightarrow\>b\<leqslant\>b|}>>,
  then in any solution <math|a\<leqslant\>b>, even though this constraint is
  not present in the set.

  Like subsumption, entailment is not known to be efficiently decidable.
  However, there are a number of sound, but incomplete entailment algorithms.
  A very simple one would be to check whether the constraint was literally
  present in the constraint set, but this would fail to prove too many
  entailments to be useful.

  Instead, we use a powerful approximation to entailment based on an
  axiomatisation of provable entailment from <cite|pottierphd>. The algorithm
  will answer queries of the form <math|a<rsup|+>\<leqslant\>b<rsup|->> and
  will return a boolean result. If the algorithm returns true, the constraint
  is entailed by the constraint graph and adding it to the graph would not
  shrink the set of solutions.

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|HIST :=
  <math|\<varnothing\>>>>|<row|<cell|entailed(<math|a<rsup|+>>,<math|b<rsup|->>)
  = >>|<row|<cell| \ if <math|<around*|(|a<rsup|+>\<leqslant\>b<rsup|->|)>\<in\><tt|HIST>>
  or <math|a<rsup|+>\<in\>\<Omega\><rsup|\<cal-V\>><around*|(|b<rsup|->|)>>
  then>>|<row|<cell| \ \ \ True>>|<row|<cell| \ else>>|<row|<cell| \ \ \ set
  HIST := HIST <math|\<cup\> <around*|{|a<rsup|+>\<leqslant\>b<rsup|->|}>>>>|<row|<cell|
  \ \ \ if entailed(<math|p>) for <math|p\<in\>subc<around*|(|\<Omega\><rsup|\<tau\>><around*|(|a<rsup|+>|)>\<leqslant\>\<Omega\><rsup|\<tau\>><around*|(|b<rsup|->|)>|)>>
  then>>|<row|<cell| \ \ \ \ \ True>>|<row|<cell| \ \ \ else>>|<row|<cell|
  \ \ \ \ \ False>>>>>>>

  <tt|HIST> denotes the set of entailments previously proven or previously
  added as hypotheses in the current proof. As explained in
  <cite|pottierphd>, it is valid to add hypotheses to <tt|HIST> before the
  hypothesis is fully proven as proving an entailment recursively in terms of
  such hypotheses demonstrates the existence of an infinite regular proof.

  The algorithm is similar to the algorithm in <cite|subrecfast> for
  efficiently deciding the subtype relation between two ground types
  expressed as regular trees.

  <section|Display><label|display>

  The representation of constraint graphs in the typechecker, while
  efficient, is almost entirely incomprehensible to a human programmer. In
  particular, the small-terms invariant results in a constraint graph which
  contains a large number of intermediate variables which serve no purpose
  other than to link small terms (this is analogous to the unreadability of
  code where all of the expressions have been converted to three-address
  code).

  So, we perform some simplifications before displaying a type to the user.
  These simplifications are not performed on the internal representation as
  they violate the small-terms invariant or the mono-polarity invariant in
  pursuit of readable type expressions. By way of examples, consider the
  following two functions (written in <brick> syntax):

  <center|<verbatim|<tabular|<tformat|<cwith|1|3|2|2|cell-lborder|0.2pt>|<table|<row|<cell|def
  f1(x) do>|<cell|def f2(x) do>>|<row|<cell| \ x.increment(5)>|<cell|
  \ return x>>|<row|<cell|end>|<cell|end>>>>>>>

  The function <tt|f1> takes an object that has an <tt|increment> method
  taking an <tt|int>, and returns nothing. The function <tt|f2> is the
  identity function.

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
  mono-polarity invariant, we must use separate type variables for the
  argument and the result of the function. The programmer has no such qualms,
  and would prefer to see the type as the more natural
  <rigid|<math|a\<rightarrow\>a>.>\ 

  Both of these type graphs can be made readable by applying a simple
  substitution: replacing type variables with their unique bounds. That is,
  if a variable <math|a> has an empty set of variable bounds
  <math|\<Omega\><rsup|\<cal-V\>><around*|(|a|)>>, then it is safe to replace
  <math|a> with its constructed bound <math|\<Omega\><rsup|\<tau\>><around*|(|a|)>>.
  Similarly, if the constructed bound does not constrain <math|a> (that is,
  <math|\<Omega\><rsup|\<tau\>><around*|(|a|)>=\<bot\> if a is
  positive\<nocomma\><text|, or >\<top\> if a is negative>), and <math|a> has
  only a single variable bound, <math|a> can safely be replaced with that
  variable.

  This applies the following substitutions to <math|<tt|f1><rsup|+>>:

  <\equation*>
    <tabular|<tformat|<cwith|1|3|1|3|cell-bsep|0>|<cwith|1|3|4|6|cell-bsep|0>|<cwith|1|3|1|1|cell-halign|r>|<cwith|1|3|4|4|cell-halign|r>|<cwith|1|3|4|4|cell-lborder|0.2pt>|<cwith|1|3|3|3|cell-rsep|1cm>|<cwith|1|3|4|4|cell-lsep|1cm>|<cwith|1|3|3|3|cell-width|3.5cm>|<cwith|1|3|3|3|cell-hmode|exact>|<cwith|1|3|6|6|cell-width|3.5cm>|<cwith|1|3|6|6|cell-hmode|exact>|<cwith|1|3|4|4|cell-width|1.5cm>|<cwith|1|3|4|4|cell-hmode|exact>|<cwith|1|3|1|1|cell-width|1.5cm>|<cwith|1|3|1|1|cell-hmode|exact>|<table|<row|<cell|<tt|f1><rsup|+>>|<cell|\<mapsto\>>|<cell|a<rsup|->\<rightarrow\>b<rsup|+>>|<cell|c<rsup|->>|<cell|\<mapsto\>>|<cell|d<rsup|+>\<rightarrow\>e<rsup|->>>|<row|<cell|a<rsup|->>|<cell|\<mapsto\>>|<cell|<around*|{|<tt|increment>:c<rsup|->|}>>|<cell|d<rsup|+>>|<cell|\<mapsto\>>|<cell|<tt|int>>>|<row|<cell|b<rsup|+>>|<cell|\<mapsto\>>|<cell|<around*|(||)>>|<cell|e<rsup|->>|<cell|\<mapsto\>>|<cell|\<top\>>>>>>
  </equation*>

  Thus, the type of <tt|f1> is displayed to the user as

  <\equation*>
    <around*|{|<tt|increment>:<tt|int>\<rightarrow\>\<top\>|}>\<rightarrow\><around*|(||)>
  </equation*>

  which is much more readable. Similarly, the following substitutions are
  applied to <math|<tt|f2><rsup|+>>:

  <\equation*>
    <tabular|<tformat|<cwith|1|2|1|3|cell-bsep|0>|<cwith|1|2|4|6|cell-bsep|0>|<cwith|1|2|1|1|cell-halign|r>|<cwith|1|2|4|4|cell-halign|r>|<cwith|1|2|4|4|cell-lborder|0.2pt>|<cwith|1|2|3|3|cell-rsep|1cm>|<cwith|1|2|4|4|cell-lsep|1cm>|<cwith|1|2|3|3|cell-width|3.5cm>|<cwith|1|2|3|3|cell-hmode|exact>|<cwith|1|2|6|6|cell-width|3.5cm>|<cwith|1|2|6|6|cell-hmode|exact>|<cwith|1|2|4|4|cell-width|1.5cm>|<cwith|1|2|4|4|cell-hmode|exact>|<cwith|1|2|1|1|cell-width|1.5cm>|<cwith|1|2|1|1|cell-hmode|exact>|<table|<row|<cell|<tt|f2><rsup|+>>|<cell|\<mapsto\>>|<cell|a<rsup|->\<rightarrow\>b<rsup|+>>|<cell|b<rsup|+>>|<cell|\<mapsto\>>|<cell|a<rsup|->>>>>>
  </equation*>

  The choice of <math|b<rsup|+>\<mapsto\>a<rsup|->> was arbitrary, the
  algorithm could equally have picked <math|a<rsup|->\<mapsto\>b<rsup|+>>.
  So, the type of <tt|f2> is displayed to the user (without polarity
  indicators) as:

  <\equation*>
    a\<rightarrow\>a
  </equation*>

  <chapter|Semantics and object model><label|chapsemantics>

  <chapquote|I paint objects as I think them, not as I see them.|Pablo
  Picasso>

  In this chapter, the main features of the <brick> language and how they
  integrate with the type inference system will be discussed, including the
  interaction of structures and classes and how polymorphic functions are
  handled.

  <section|Structures>

  Structures are a mapping from field names to values. The set of fields of a
  structure is immutable after the structure is created, but the values can
  be read and written.\ 

  The subtyping rule for structures is that a structure type <math|S<rsub|1>>
  is a subtype of <math|S<rsub|2>> if <math|S<rsub|1>> has a superset of the
  fields and the field types are compatible. Exactly what is meant by
  ``compatible'' will be deferred for a moment, and answered in the section
  describing how mutability is integrated into the type system.

  Structures are created with a syntax like
  <math|<around*|{|<tt|x>=42\<nocomma\>,<tt|y>=17|}>>. Fields are accessed as
  <math|<tt|s.field>> and assigned as <tt|s.field = val>. The subtyping rule
  means you can safely pass a structure to a function expecting a structure
  with arbitrary subset of the fields present. This is vital to correctly
  inferring types for bodies of code which use structures, as it means that a
  function need not reference all of the fields to be compatible with a
  structure.

  <subsection|Mutability and typing><label|mutability>

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
  during ``write'' operations (as in <with|font-family|tt|f2>). To solve this
  problem, we use an elegant trick described in <cite|pottierphd>, attributed
  to Luca Cardelli, and Smith and Trifonov (independantly): we introduce
  <with|font-shape|italic|two> type parameters, one contravariant and one
  covariant.

  Thus, in the array above, the argument to <tt|f1> will have type
  <math|array<around*|(|\<bot\>,<tt|Mammal>|)>>. The contravariant type is
  unconstrained, and therefore remains as <math|\<bot\>>. The array being
  passed, <math|array<around*|(|<tt|Dog>,<tt|Dog>|)>>, is a subtype of this
  type and thus correct to pass. The argument to <tt|f2> will have type
  <math|array<around*|(|<tt|Mammal>,\<top\>|)>> since it only uses the
  parameter contravariantly. This is not a subtype of
  <math|array<around*|(|<tt|Dog>,<tt|Dog>|)>>, so the function is correctly
  rejected. <math|array<around*|(|<tt|Animal>,<tt|Animal>|)>> is, however, so
  it would be type-correct (and make sense!) to pass such an array to
  <tt|f2>.

  This technique of typing mutable objects with a pair of type variables is
  used to type structure fields as well. So, a fully-specified structure type
  might look like <math|<around*|{|<tt|f1>:a/b|}>>, where <math|a> is the
  (contravariant) type used for assignments to the field, while <math|b> is
  the (covariant) type used for reading from it. The type system will ensure
  that <math|a\<leqslant\>b>, so anything written can be read back out.

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
  very general type to a specific subtype. A programmer, after writing a
  program fragment with a particular type <math|t>, may want to explicitly
  limit the uses of that fragment as though it had type <math|t<rprime|'>>,
  where <math|t\<leqslant\>t<rprime|'>>. This could be done to clarify the
  programmer's intentions and to indicate the function of the code to a user.

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
  to be used only with points, and not with just any structure which declares
  an <math|x> coordinate. So, the function can be rewritten to include
  specific annotations:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|def
  get_x(point:{x:float,y:float}):float do>>|<row|<cell| \ return
  point.x>>|<row|<cell|end>>>>>>>

  In this case, the function has type <math|<around*|{|<tt|x>:<tt|float>,<tt|y>:<tt|float>|}>\<rightarrow\><tt|float>>,
  which better indicates the programmer's intentions. Since
  <math|<around*|{|<tt|x>:<tt|float>,<tt|y>:<tt|float>|}>\<rightarrow\><tt|float>>
  is a supertype of <math|<around*|{|<tt|x>:a|}>\<rightarrow\>a>, the
  annotation is valid.

  <subsection|Checking type annotations>

  To verify that a type annotation is correct, we must check that the
  declared type of a term is some supertype of the inferred type. That is,
  the type the programmer uses to declare a term must be equal or less
  specific than the type inferred from the body: he cannot claim the code
  does something it can't.

  Annotations for generalised and ungeneralised terms are checked somewhat
  differently, since the former may contain free variables and is therefore
  more complicated. Ungeneralised terms are checked using the entailment
  algorithm: if the programmer writes <tt|x:int>, we check that adding the
  constraint <math|x\<leqslant\><tt|int>> does not restrict the set of
  solutions (alternatively, that this constraint is implied by the
  constraints inferred).

  If an annotation is placed on a generalised term, for instance if the
  programmer defines an identity function <tt|id> and writes <rigid|<tt|id:a
  =\<gtr\> a forall a>>, we must use the subsumption algorithm in order to
  cover all of the possible instantiations of the free variable <math|a>.

  <section|Classes><label|classes>

  Classes are built atop the structure functionality: each class is a subtype
  of the structure type with the same set of members. This facilitates the
  integration of nominative and structural types: an object of nominative
  type (an instance of a class) can be passed to a function expecting a
  structural type, and the subtyping rules ensure that it will work. There
  are many subtleties with this relationship between the structure types and
  the class types, see section <reference|nomstruct>.

  One additional difficulty is that the inference algorithm requires that the
  types form a lattice, which most nominative type systems fail to do (this
  restriction allows the existence of a fast closure algorithm for
  typechecking; without it the inference problem is
  PSPACE-hard<cite|decidablesub>). While seeming to form an additional
  difficulty, this restriction actually leads to a more elegant system and
  allows the system to be more expressive than most nominatively typed
  languages.

  Some standard features of object-oriented languages are as yet
  unimplemented. These pose no theoretical challenges, but simply are not yet
  part of <brick> due to time constraints. See section <reference|futurework>
  for details.

  <subsection|Class members>

  Classes also impose constraints on the types of their members. For
  instance, suppose a class Point is defined with two integer fields <tt|x>
  and <tt|y>, and the following function is written:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|def get_x(pt:Point)
  do>>|<row|<cell| \ return pt.x>>|<row|<cell|end>>>>>>>

  It should be possible to infer that the return type is <tt|int>. This is
  done quite simply: when a class name appears in a typing constraint the
  system will not only add a constraint based on the object type constructor
  (section <reference|objectlattice>), but will also add a constraint for
  each field defined by the class.

  When a subclass is derived from a class, it must be ensured that the
  subclass is in fact a subtype. This is performed by the polymorphic
  subsumption algorithm (<math|\<leqslant\><rsup|\<forall\>>>) described
  previously.

  <subsection|Constructors>

  Constructors for a class present an interesting problem. A subclass
  constructor must be able to call its parent class' constructor to
  initialise the parts of the object for which the parent is responsible. We
  must ensure that the constructor of the parent class is run before the
  child class performs any initialisation.

  This is done in Java by syntactic restrictions: a call to <tt|super()> must
  be the very first thing in the constructor's body. In <brick> we adopt a
  slightly different approach: the call to the superclass's constructor is
  what actually returns the new object, and so it cannot be accessed before
  then by virtue of simply having no name (<tt|self> is not in scope in a
  constructor).

  \;

  <section|Generalised and ungeneralised bindings><label|generalised>

  A binding of a name may be <with|font-shape|italic|generalised>. This
  allows it to be used with multiple different incompatible types at
  different points in the program. For instance, consider this function:

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
    tractable. See <cite|ranknml|ranknhaskell> for examples.
  </footnote>. The variables bound as function arguments must therefore be
  ungeneralised, and as we'll see in the next section, due to imperative
  constructs some other classes of binding must be ungeneralised.

  <subsection|The value restriction>

  \;

  In languages like Haskell, every <with|font-family|tt|let>-bound and all
  toplevel bindings are generalised<\footnote>
    Generalised bindings are known as <with|font-family|tt|let>-bindings in
    functional languages.
  </footnote>. This poses a well-known problem<cite|valuerestriction|valuerestriction2>
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

  <section|Integration of nominative and structural typing><label|nomstruct>

  For reasons outlined in the introduction, it was a design goal to support
  both structural and nominative typing.

  Here is a concrete example of the problems that arise from this: Suppose we
  have class <with|font-family|tt|Cowboy> and class
  <with|font-family|tt|Shape>. Both of these have a method
  <with|font-family|tt|draw>, with very different meanings. Class
  <with|font-family|tt|Square> is a subtype of <with|font-family|tt|Shape>,
  implementing the <with|font-family|tt|draw> defined by shapes.

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

  <subsection|Formal model of classes>

  Having given an intuitive explanation for how we would like nominative and
  structural types to interoperate, it remains to fit it into the formal
  model of constructor lattices defined in section
  <reference|constructorlattice>. If this can be done, then we will know that
  the type inference algorithms will support inference and
  annotation-checking of code using these types.

  So, we would like to add <dfn|object types> to our constructor lattice.
  These types must support an arbitrary set of fields, and must support
  (user-defined) classes. As was explained above, a class is a subtype of the
  purely structural type with the same set of fields, as well as being a
  subtype of those classes it explicitly extends. An important (almost
  defining) property of nominative typing is that two classes do not enter
  into a subtype relation merely by having the same set of fields. However,
  those two classes must both be subtypes of the structural type defining
  their common fields.

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
    Note that, under this definition, each class is a subclass of itself.
  </footnote>. <math|<with|math-font-series|bold|superclasses><around*|(|<with|math-font-series|bold|C>|)>>
  will denote the set of classes of which
  <math|<with|math-font-series|bold|C>> is a subclass.

  As well as defining some members, a class inherits the members defined in
  each of its superclasses. Some of these members (particularly methods) may
  be overridden and given a different definition in the superclass, giving
  rise to ``polymorphic dispatch'': the target of a function call depends on
  the runtime class of a object.

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

  <subsection|The object constructor lattice><label|objectlattice>

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
  a type constructor lattice (as defined in <reference|constructorlattice>).

  <\itemize>
    <item>The set of constructors is <math|\<bbb-O\>>.

    <item>The set of labels is the set of all possible field names.

    <item><math|arity<around*|(|<with|math-font-series|bold|O>|)>=<with|math-font-series|bold|fields><around*|(|<with|math-font-series|bold|O>|)>;
    arity<around*|(|\<bot\><rsub|\<bbb-o\>>|)>=<around*|{|all possible field
    names|}>>

    The arity is simply the set of fields, each field becomes a label.

    <item><math|variance<around*|(|f|)>=+>

    All of the labels (fields) have positive variance<\footnote>
      see section <reference|mutability> for an extension of this providing
      for mutable variables
    </footnote>.

    <item><math|\<bot\><rsub|\<bbb-o\>>\<leqslant\><rsub|\<bbb-o\>><with|math-font-series|bold|O>;<with|math-font-series|bold|O<rsub|1>>\<leqslant\><rsub|\<bbb-o\>><rsub|><with|math-font-series|bold|O<rsub|2>\<Leftrightarrow\>><with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O<rsub|1>>|)>\<supseteq\><with|math-font-series|bold|classes><around*|(|<with|math-font-series|bold|O<rsub|2>>|)>\<wedge\><with|math-font-series|bold|fields><around*|(|<with|math-font-series|bold|O<rsub|1>>|)>\<supseteq\><with|math-font-series|bold|fields><around*|(|<with|math-font-series|bold|O<rsub|2>>|)>>

    <with|mode|math|\<bot\><rsub|\<bbb-o\>>> is a subtype of every type
    constructor.

    A type constructor <math|<with|math-font-series|bold|O<rsub|1>>> is a
    subtype of <math|<with|math-font-series|bold|O<rsub|2>>> if it has a
    larger set of classes and fields.
  </itemize>

  We need to show that the ordering on object type constructors forms a
  lattice and follows the convexity of arity condition. The latter is easy:
  the constructor ordering is anti-monotonic in arity (that is,
  <math|<with|math-font-series|bold|O<rsub|1>\<leqslant\><rsub|\<bbb-o\>>O<rsub|2>>>
  only if <math|arity<around*|(|<with|math-font-series|bold|O<rsub|1>>|)>\<supseteq\>arity<around*|(|<with|math-font-series|bold|O<rsub|2>>|)>>),
  and so the convexity condition trivially holds.

  It remains to show that this structure forms a lattice. Rather than prove
  this directly (which would be somewhat messy), we prove it by construction.

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

    Let <math|b\<in\>L=x\<sqcap\><rsub|L>y>. If <math|b\<nleqslant\>s>, then
    <math|b\<in\>L<rprime|'>>. Otherwise, since <math|b> was the greatest
    lower bound, all lower bounds of <math|x> and <math|y> are
    <math|\<leqslant\>s>. Thus, none of them (except <math|\<bot\>>) appear
    in <math|L<rprime|'>> and <math|\<bot\>> is the g.l.b. of <math|x> and
    <math|y> in <math|L<rprime|'>>. Thus, in either case, <math|\<sqcap\>> is
    well-defined on <math|L<rprime|'>>.
  </proof>

  <math|erase<rsub|s><around|(|L|)>> can be thought of as a new lattice with
  all elements below <math|s> removed. We can now restate the object type
  structure in terms of lattices: We take the space of upwards-closed sets of
  classes (which forms a lattice, see above), and the space of arbitrary sets
  of fields (which forms a lattice, see above). We take the space of pairs of
  these lattices (again, this forms a lattice), and we remove via
  <math|erase<rsub|s>> all of those points which include incompatible
  classes. Finally, we remove those points where the condition
  <math|><with|mode|math|<with|math-font-series|bold|members><around*|(|<with|math-font-series|bold|C>|)>\<subseteq\><with|math-font-series|bold|fields><around*|(|<with|math-font-series|bold|O>|)>>.
  Since this condition preserves l.u.b. and g.l.b (it holds for <math|a> and
  <math|b> if and only if it holds for <math|a\<sqcap\>b> and
  <math|a\<sqcup\>b>), the structure remains a lattice.

  So, we have managed to reconstruct <math|\<bbb-O\>> in a way which is
  guaranteed to yield a lattice, hence <math|\<bbb-O\>> is a lattice.

  <subsection|Interface intersection types>

  The requirement that our types form a lattice led to the inclusion of a few
  extra types (to ``fill in the blanks'' by giving every pair of types a glb
  and lub), some of which turn out to be independantly useful. In particular,
  we gain interface intersection types: for any two classes or interfaces
  <math|C<rsub|1>> and <math|C<rsub|2>>, it is possible to define a function
  which takes arguments of type <math|C<rsub|1>\<sqcap\>C<rsub|2>>, demanding
  that the parameter implement both of these interfaces. This is a useful
  property that cannot be expressed in many statically-typed languages,
  including Java<\footnote>
    It is possible to define a new interface type which extends both
    <math|C<rsub|1>> and <math|C<rsub|2>>, but then both classes must be
    modified to explicitly implement it, something which may not be possible
    if the interfaces are from different packages.
  </footnote>.

  <\part*>
    <\with|par-mode|center>
      Part II:

      Language Implementation
    </with>
  </part*>

  <chapter|Implementation tools>

  <\chapquote|Let him choose out of my files, his projects to accomplish.>
    William Shakespeare,

    ``Coriolanus''
  </chapquote>

  <section|Haskell>

  The pure, lazy, functional language Haskell was used for the
  implementation. There are two somewhat unusual features of Haskell which
  were used heavily to describe the generic compiler infrastructure: laziness
  and monads.

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
  There are many, many, many introductions to the
  concept<cite|wadlermonads|moggimonads|imperativefunc> ranging from
  category-theoretic interpretations to their use in describing I/O effects.
  What follows is a broad overview of how they can be used to describe
  sequential computation in a generic way, without reference to the
  technicalities of Haskell's type system. This will serve as a minimal
  introduction in order to explain the use made of the concept in the
  implementation of <brick>. For a deeper discussion, see any of the above
  references.

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

  These can be layered using a technique known as <dfn|monad transformers>.
  For instance, a <strong|Reader> can be layered over any monad to give a
  monad which acts as the underlying monad, but where each statement can also
  access a global parameter.

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
  the extra opportunities. However, none of these type-based optimisations
  have yet been implemented in <brick>.

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

  <chapquote|All things are subject to interpretation ...|Friedrich
  Nietzsche>

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

  For the purposes of this discussion, let's presume we represent abstract
  syntax trees for a very simple language with the following datatypes:

  <center|<verbatim|<tabular|<tformat|<table|<row|<cell|data
  Program>|<cell|=>|<cell|Seq Program Program>>|<row|<cell|>|<cell|\|>|<cell|Asgn
  Var Program>>|<row|<cell|>|<cell|\|>|<cell|If Exp
  Program>>|<row|<cell|>|<cell|\|>|<cell|While Exp
  Program>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|data
  Exp>|<cell|=>|<cell|EVar Var>>|<row|<cell|>|<cell|\|>|<cell|EAdd Exp
  Exp>>|<row|<cell|>|<cell|\|>|<cell|ECmpEq Exp Exp>>>>>>>

  Assume <tt|Var> is a type representing variable names. The interpreter
  consists of two functions, <tt|eval> and <tt|evalExp>:

  <center|<verbatim|<tabular|<tformat|<cwith|1|25|2|2|cell-lborder|0.2pt>|<table|<row|<cell|eval
  prog s1 = case prog of>|<cell|evalExp exp s = case exp of>>|<row|<cell|
  \ \ \ (Seq p1 p2) -\<gtr\> >|<cell| \ \ \ (EVar v) -\<gtr\> varGet v
  s>>|<row|<cell| \ \ \ \ \ let s2 = eval p1 s1>|<cell| \ \ \ >>|<row|<cell|
  \ \ \ \ \ \ \ \ \ s3 = eval p2 s2>|<cell| \ \ \ (EAdd e1 e2) -\<gtr\>
  >>|<row|<cell| \ \ \ \ \ in s3>|<cell| \ \ \ \ \ let v1 = evalExp e1
  s>>|<row|<cell|>|<cell| \ \ \ \ \ \ \ \ \ v2 = evalExp e2 s>>|<row|<cell|
  \ \ \ (Asgn v exp) -\<gtr\>>|<cell| \ \ \ \ \ in opAdd v1 v2>>|<row|<cell|
  \ \ \ \ \ let (s2,val) = evalExp exp s1>|<cell|>>|<row|<cell|
  \ \ \ \ \ \ \ \ \ s3 = varSet v val>|<cell| \ \ \ (ECmpEq e1 e2)
  -\<gtr\>>>|<row|<cell| \ \ \ \ \ in s3>|<cell| \ \ \ \ \ let v1 = evalExp
  e1 s>>|<row|<cell|>|<cell| \ \ \ \ \ \ \ \ \ v2 = evalExp e2
  s>>|<row|<cell| \ \ \ (If exp p1 p2) -\<gtr\>>|<cell| \ \ \ \ \ in opCmpEq
  v1 v2>>|<row|<cell| \ \ \ \ \ let c = evalExpr exp s1>|<cell|>>|<row|<cell|
  \ \ \ \ \ \ \ \ \ condition = cond c>|<cell|>>|<row|<cell| \ \ \ \ \ in if
  condition then eval p1 s1>|<cell|>>|<row|<cell|
  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else eval p2
  s1>|<cell|>>|<row|<cell|>|<cell|>>|<row|<cell| \ \ \ (While exp body)
  -\<gtr\> >|<cell|>>|<row|<cell| \ \ \ \ \ let c = evalExpr e
  s1>|<cell|>>|<row|<cell| \ \ \ \ \ \ \ \ \ condition = cond
  c>|<cell|>>|<row|<cell| \ \ \ \ \ in if condition
  then>|<cell|>>|<row|<cell| \ \ \ \ \ \ \ \ \ \ let s3 = eval body
  s2>|<cell|>>|<row|<cell| \ \ \ \ \ \ \ \ \ \ in eval prog
  s3>|<cell|>>|<row|<cell| \ \ \ \ \ \ \ \ else>|<cell|>>|<row|<cell|
  \ \ \ \ \ \ \ \ \ \ s2>|<cell|>>>>>>>

  <tt|eval> evaluates a program, calling <tt|evalExp> to evaluate an
  expression. The state (mapping of variables to values) is explicitly passed
  to <tt|eval> and <tt|evalExp>. Since <tt|eval> may modify the state,
  <tt|eval> is written to return a new state. <tt|evalExp> never modifies the
  state, so returns a value instead<\footnote>
    Of course, this must change when side-effecting expressions are
    introduced. The language presented here is deliberately simplistic.
  </footnote>.

  A few primitives such as <tt|varGet> and <tt|varSet> (which read and modify
  a state) aren't shown here.

  <section|Monadic interpreters>

  Our interpreter, while being concise, is also difficult to read. This is in
  no small part due to the necessity of passing around the symbol table
  parameters (<tt|s1>, <tt|s2> and so on) so that names can always be
  resolved. We can abstract this away and hide the symbol table inside a
  <tt|State> monad, so that it is always available but need not be explicitly
  passed around. The monadic versions of <tt|eval> and <tt|evalExpr> look
  like:

  <center|<verbatim|<tabular|<tformat|<cwith|1|24|2|2|cell-lborder|0.2pt>|<table|<row|<cell|eval
  prog = case prog of>|<cell|evalExp exp = case exp of>>|<row|<cell|
  \ \ \ (Seq p1 p2) -\<gtr\> do>|<cell| \ \ \ (EVar v) -\<gtr\> varGet
  v>>|<row|<cell| \ \ \ \ \ eval p1>|<cell| \ \ \ >>|<row|<cell|
  \ \ \ \ \ eval p2>|<cell| \ \ \ (EAdd e1 e2) -\<gtr\> do
  >>|<row|<cell|>|<cell| \ \ \ \ \ v1 \<less\>- evalExp e1>>|<row|<cell|
  \ \ \ (Asgn v exp) -\<gtr\> do>|<cell| \ \ \ \ \ v2 \<less\>- evalExp
  e2>>|<row|<cell| \ \ \ \ \ val \<less\>- evalExp exp>|<cell|
  \ \ \ \ \ opAdd v1 v2>>|<row|<cell| \ \ \ \ \ varSet v
  val>|<cell|>>|<row|<cell| \ \ \ \ \ >|<cell| \ \ \ (ECmpEq e1 e2)
  -\<gtr\>>>|<row|<cell| \ \ \ (If exp p1 p2) -\<gtr\>>|<cell| \ \ \ \ \ v1
  \<less\>- evalExp e1>>|<row|<cell| \ \ \ \ \ c \<less\>- evalExpr
  exp>|<cell| \ \ \ \ \ v2 \<less\>- evalExp e2>>|<row|<cell|
  \ \ \ \ \ condition \<less\>- cond c>|<cell| \ \ \ \ \ opCmpEq v1
  v2>>|<row|<cell| \ \ \ \ \ in if condition then eval
  p1>|<cell|>>|<row|<cell| \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else
  eval p2>|<cell|>>|<row|<cell|>|<cell|>>|<row|<cell| \ \ \ (While exp body)
  -\<gtr\> >|<cell|>>|<row|<cell| \ \ \ \ \ c \<less\>- evalExpr
  e>|<cell|>>|<row|<cell| \ \ \ \ \ condition \<less\>- cond
  c>|<cell|>>|<row|<cell| \ \ \ \ \ in if condition then
  do>|<cell|>>|<row|<cell| \ \ \ \ \ \ \ \ \ \ eval
  body>|<cell|>>|<row|<cell| \ \ \ \ \ \ \ \ \ \ eval
  prog>|<cell|>>|<row|<cell| \ \ \ \ \ \ \ \ else do>|<cell|>>|<row|<cell|
  \ \ \ \ \ \ \ \ \ \ return ()>|<cell|>>>>>>>

  \;

  This is much clearer than the previous code. We do have to change the
  implementation of a few operations, though: <tt|varGet> and <tt|varSet>
  must now contain code to query and update the current monadic state.

  As an added benefit, our <tt|eval> function is now free from the
  implementation details of the state mapping. Since <tt|eval> no longer
  passes around the state mapping directly, the interaction between <tt|eval>
  and the state consists solely of calls to primitive operations. Thus, we
  can freely substitute other more efficient representations of this state
  without having to change the contents of <tt|eval>.

  <section|Generalising <tt|eval>>

  Note that <tt|eval> does not depend on the concrete type <math|\<cal-E\>>
  used to represent values. In an initial implementation, <tt|eval> might be
  hardcoded to use a particular algebraic datatype which may represent a
  function, an integer, etc. Generalising this so that <tt|eval> can use any
  type <math|<with|math-font|cal|E>> on which the appropriate operations have
  been defined allows modularity. We can use <tt|eval> with any type, so long
  as an implementation of the primitive operations (<tt|varGet>, <tt|varSet>,
  <tt|cond> and the like) is provided.

  For instance, a more efficient representation for values can be used
  without needing to modify <tt|eval>. Alternatively, we could define new
  representation which kept more debugging information such as making each
  value keep track of the line of code which produced it. This information
  could be used to pinpoint the source of an incorrect value and aid in
  debugging. Since <tt|eval> is generalised over the type
  <math|<with|math-font|cal|E>>, then as long as we could implement the few
  primitives for manipulating values in terms of
  <math|<with|math-font|cal|E>>, <tt|eval> would transparently work on our
  new representation without needing to change a line of code.

  <section|Generalising <tt|eval> further>

  We have already generalised <tt|eval> so that it does not depend on the
  concrete details of the type <math|\<cal-E\>> used to represent values. By
  abstracting this away, we allow different implementations of the runtime
  data structures without having to change any code in <tt|eval> to
  accomodate them. <tt|eval> no longer depends on a specific data structure
  used to represent values, and will now work with any type
  <math|<with|math-font|cal|\<cal-E\>>> as long as certain operations
  (<tt|varGet>, <tt|varSet> and so on) are defined on it.

  We can continue applying this notion and generalise the type used to
  represent variables. Instead of representing them explicitly as strings, we
  can abstract this. We would provide a new primitive, <tt|varNew>, which
  creates a new variable and then let <tt|eval> use these primitives without
  reference to the data structure used to describe them. Again, this allows
  for flexibility: we can define one version of the variables which uses
  string names as above, or perhaps an optimised version which removes the
  names for efficiency and simply uses pointers to mutable storage as
  variables.

  As the language grows bigger, the <tt|eval> function grows to accomodate
  every part of the syntax and define the semantics for the entire language.
  The set of primitive operations remains relatively small. So, by
  generalising <tt|eval> over <math|<with|math-font|cal|V>> and
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

  <chapquote|The soul is so far from being a monad that we have not only to
  interpret other souls to ourself but to interpret ourself to ourself.|T.S.
  Eliot>

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

  <subsection|Aside: Arrows>

  The original version of this work implemented the concepts not in terms of
  monads but in terms of arrows. Arrows are a generalisation of monads which
  can represent ``computations with side-effects'' as opposed to monads which
  represent ``results with side effects'', the difference being that an arrow
  can reason about a computation's inputs as well as its
  outputs<cite|arrowcomp|arrows>. In this version of the work, the equivalent
  of <tt|fixiter> arose more naturally.

  In standard presentations of arrows, there are combinators to produce more
  complex arrows from simpler. Two important ones are:

  <\eqnarray>
    <tformat|<table|<row|<cell|first>|<cell|\<colons\>>|<cell|<around*|(|a\<rightarrowlim\><rsup|\<cal-A\>>b|)>\<mapsto\><around*|(|<around*|(|a,s|)>\<rightarrowlim\><rsup|\<cal-A\>><around*|(|b,s|)>|)>>>|<row|<cell|left>|<cell|\<colons\>>|<cell|<around*|(|a\<rightarrowlim\><rsup|\<cal-A\>>b|)>\<mapsto\><around*|(|<around*|(|a+s|)>\<rightarrowlim\><rsup|\<cal-A\>><around*|(|b+s|)>|)>>>>>
  </eqnarray>

  <math|a\<rightarrowlim\><rsup|\<cal-A\>>b> denotes a computation taking
  <math|a> and producing <math|b> in the arrow, <math|<around*|(|a,s|)>> is a
  pair of <math|a> and <math|s>, while <math|a+s> is a value which is either
  an <math|a> or an <math|s>. The action of first is to produce an arrow
  which takes two inputs, passes the first through a given arrow and pass the
  second through unchanged. Left is analogous, except it passes only those
  values which match a condition through the given arrow and passes those
  which don't through unchanged.

  First has a standard inverse, known as loop:

  <\eqnarray>
    <tformat|<table|<row|<cell|loop>|<cell|\<colons\>>|<cell|<around*|(|<around*|(|a,s|)>\<rightarrowlim\><rsup|\<cal-A\>><around*|(|b,s|)>|)>\<mapsto\><around*|(|a\<rightarrowlim\><rsup|\<cal-A\>>b|)>>>>>
  </eqnarray>

  This constructs an arrow whose second output is connected to its second
  input, and is used to model recursion in arrows. If we construct a similar
  inverse for left, we get:

  <\eqnarray>
    <tformat|<table|<row|<cell|iter>|<cell|\<colons\>>|<cell|<around*|(|<around*|(|a+s|)>\<rightarrowlim\><rsup|\<cal-A\>><around*|(|b+s|)>|)>\<mapsto\><around*|(|a\<rightarrowlim\><rsup|\<cal-A\>>b|)>>>>>
  </eqnarray>

  This constructs an arrow whose output is fed back to its input if it fails
  to meet a condition, and is a natural equivalent to <tt|fixiter>.

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

  Structs are layed out as a series of pointer-width words.<\footnote>
    In the current implementation, there are no unboxed types so every value
    is represented as a pointer. In a future implementation, this constraint
    will be relaxed for efficiency.
  </footnote> The first word points to a ``type table'', which describes the
  layout of the rest of the structure. The ``type table'' must map string
  keys to offsets within the structure efficiently.

  The trivial (and initially implemented) solution is simply to do a linear
  scan of the type table on each lookp, but more efficient solutions are
  possible. We propose a simple hashing scheme. This problem is related to
  the problems of storing sparse tables<cite|sparsetables>.

  To avoid performing string comparisons, field names are hashed at compile
  time. To correctly handle hash collisions, each field is associated with a
  global variable with the same name. The system linker disambiguates
  globals, so we can rely on uniqueness and identify names with pointers to
  these globals variables.

  The actual lookup scheme involves taking bitfields out of a precomputed
  hash value and using it to index into a table. Collisions are resolved by
  the global variable addresses. At the expense of some compilation time, we
  found it was generally possible to ensure (by searching the parameter
  space) that there are no more than 2 collisions for a given key, and so the
  lookup function could be implemented without branching.

  Since LLVM is used to generate object code, we can rely on its optimisation
  passes to make changes like hoisting structure index operations out of
  loops.

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

  <section|A typechecker from an interpreter>

  So far, we've shown how a single semantics for a language parameterised
  over a monad <math|<with|math-font|cal|M>>, a data type for variables
  <math|<with|math-font|cal|V>>, and a datatype for values
  <math|<with|math-font|cal|E>> can be instantiated to give an interpreter or
  a compiler. Next, we show how that can be generalised to form a
  type-checker.

  The algorithms for analysing the constraint graph of a program have been
  described at length in part I. What remains is the initial constraint
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

  <math|<with|math-font|cal|E>> and <math|<with|math-font|cal|V>> simply
  represent type variables. Each of the actual operations of the language
  which operates upon values can be expressed as a constraint upon type
  variables. For instance, the primitive operation <tt|apply> (used to apply
  a function to its argument) takes a pair of <math|<with|math-font|cal|E>>
  (function and argument) and returns a single <math|<with|math-font|cal|E>>.
  It can be implemented in the typechecker as taking <math|<around*|(|a,b|)>>
  and returning a fresh variable <math|c> while building the constraint
  <math|a\<leqslant\>b\<rightarrow\>c>. Each of the primitive operations can
  be defined in this way, giving us a type checker which builds constraints
  as an abstraction of the operation of the interpreter (see appendix B for a
  full description of these typing rules).

  Thus, with a single definition of <tt|eval>, as well as getting a compiler
  we also gain a typechecker.

  <section|Primitive operations><label|primops>

  As a final description of the architecture of the implementation, this
  section contains a list of the operations available to <tt|eval>. The
  various components simply implement these primtives, and the common
  language description in <tt|eval> hooks them together.

  Before describing the operations themselves, it is worth pointing out a few
  features conspicious by their absence:

  <\description>
    <item*|Control flow>There are no intraprocedure control flow operations
    in the set of primitives, no if/then/else nor while nor return. Instead,
    <tt|eval> implements such operations as though it were an interpreter
    (for instance, <tt|break> and <tt|continue> are implemented by <tt|eval>
    throwing and catching exceptions), and the various implementations of the
    monad <math|\<cal-M\>> contrive to ensure that the program states are
    correctly ordered.

    <item*|Bindings and name resolution>The compiler, typechecker and
    interpreter core need not deal <with|font-shape|italic|at all> with
    variable names. The symbol table is entirely managed by the <tt|eval>
    code. Primitives are provided for generating new variables (<tt|varNew>),
    and it is up to <tt|eval> to ensure these are passed around correctly.

    <item*|Closures>Functions that access objects from outside their local
    scope are implemented transparently as Haskell closures. They are then
    ``run'' in the monad <math|\<cal-M\>> to determine which items they
    access. The effect of this is that no special effort need be made to pass
    environment values to subfunctions in <tt|eval>.
  </description>

  In the description of the operations to follow,
  <math|a\<rightarrowlim\><rsup|\<cal-M\>>b> is used to denote a function
  from <math|a> to <math|b> also performing a monadic action. It corresponds
  roughly to an action at the <brick> language level, and the type in Haskell
  would be rendered <tt|a -\<gtr\> <math|\<cal-M\>> b>. Conversely,
  <math|a\<mapsto\>b> denotes a Haskell function, and corresponds roughly to
  an action taken during the compilation process.

  As above, <math|\<cal-E\>> denotes the (abstract) type of <brick> values,
  while <math|\<cal-V\>> denotes the abstract type of <brick> variables.
  <tt|Field> denotes a field name of a structure, it is simply a string. Some
  of these types do not correspond exactly to the Haskell types: these types
  are presented ``uncurried'' for simplicity.\ 

  <\equation*>
    <tabular|<tformat|<cwith|1|12|1|4|cell-bsep|0.2cm>|<cwith|1|12|1|1|cell-halign|r>|<table|<row|<cell|<tt|litInt>>|<cell|\<colons\>>|<cell|<tt|Int>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-E\>>|<cell|<text|Integer
    literals>>>|<row|<cell|<tt|litBool>>|<cell|\<colons\>>|<cell|<tt|Bool>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-E\>>|<cell|Boolean
    literals>>|<row|<cell|<tt|voidValue>>|<cell|\<colons\>>|<cell|<around*|(||)>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-E\>>|<cell|<text|The
    unique literal value ``<tt|void>''>>>|<row|<cell|<tt|cond>>|<cell|\<colons\>>|<cell|\<cal-E\>\<rightarrowlim\><rsup|\<cal-M\>><tt|Bool>>|<cell|<text|Evaluate
    a condition>>>|<row|<cell|<tt|varNew>>|<cell|\<colons\>>|<cell|<around*|(||)>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-V\>>|<cell|<text|Create
    a new variable>>>|<row|<cell|<tt|varGet>>|<cell|\<colons\>>|<cell|\<cal-V\>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-E\>>|<cell|<text|Read
    a variable>>>|<row|<cell|<tt|varSet>>|<cell|\<colons\>>|<cell|<around*|(|\<cal-V\>,\<cal-E\>|)>\<rightarrowlim\><rsup|\<cal-M\>><around*|(||)>>|<cell|<text|Write
    a variable>>>|<row|<cell|<tt|structNew>>|<cell|\<colons\>>|<cell|<around*|[|<tt|Field>|]>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-E\>>|<cell|<text|Create
    a new structure>>>|<row|<cell|<tt|structGet>>|<cell|\<colons\>>|<cell|<around*|(|\<cal-E\>,<tt|Field>|)>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-E\>>|<cell|<text|Read
    a structure field>>>|<row|<cell|<tt|structSet>>|<cell|\<colons\>>|<cell|<around*|(|\<cal-E\>,<tt|Field>|)>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-E\>>|<cell|<text|Write
    a structure field>>>|<row|<cell|<tt|lambda>>|<cell|\<colons\>>|<cell|<around*|(|\<cal-E\>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-E\>|)>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-E\>>|<cell|<text|Create
    a new function>>>|<row|<cell|<tt|apply>>|<cell|\<colons\>>|<cell|\<cal-E\>\<rightarrowlim\><rsup|\<cal-M\>><around*|(|\<cal-E\>\<rightarrowlim\><rsup|\<cal-M\>>\<cal-E\>|)>>|<cell|<text|Apply
    a function>>>>>>
  </equation*>

  For simplicity, some primitives have been omitted, including <tt|letrec>, a
  list version of <tt|lambda> which allows corecursive functions,
  <tt|typeNew> and <tt|typeConstrain> for checking user type annotations
  (ignored by the compiler and interpreter) and the primitives for describing
  and instantiating classes.

  Any function which can be implemented in terms of the above primitives can
  be executed using the interpreter's definiton of those primitives, compiled
  using the compiler's, or typechecked using the typechecker's. <brick>'s
  parser, rather than produce a syntax tree, simply ``executes'' the program
  in an arbitrary monad <math|\<cal-M\>> in terms of these primitives. The
  result of this ``execution'' can then be evaluated in any or all of the
  compiler components.

  <chapter|Conclusions and future work>

  <chapquote|I have seen the future and it doesn't work.|Robert Fulford>

  We have shown that a practical imperative language can be constructed using
  the type inference engine described by Pottier and others, and that the
  problems that arise with the introduction of object-oriented features such
  as nominative classes and mutability are surmountable. We have also
  demonstrated some new techniques for a high-performance implementation of
  the type inference engine, and a novel means of combining the
  software-engineering and robustness advantages of nominative types with the
  quick-prototyping and flexibility advantages of structural types.

  The implementation of <brick> has shown that the development costs
  associated with a language implementation can be reduced by adopting a more
  abstract approach. In particular, complexities arising from symbol table
  lookup (or <math|\<alpha\>>-renaming), control flow management, closure
  generation and others can be abstracted out into a single implementation
  which fulfills the needs of a compiler, interpreter, typechecker and
  possibly other as yet unimplemented phases.

  <section|Current state of the implementation>

  The interpreter and compiler can parse and run many programs, although some
  of the object-oriented features have not fully been implemented yet.

  The type checker has been implemented more-or-less fully, and can infer and
  simplify types for some quite complex expressions (including recognising
  partial unrollings of a recursive type and correctly typing the Y
  combinator). Its performance (often a sore spot for complex inference
  algorithms) has so far been more than adequate, although it has yet to be
  tested on any large programs.

  The ``difficult problems'' in the implementation of <brick> are solved.
  However, in the quest to implement the more advanced parts of <brick>'s
  type system, compiler framework and runtime, some of the more mundane parts
  of a programming language were neglected. For instance, <brick> does not
  yet support something as trivial as integer subtraction, and there is
  little support for input and output. These features are not complex to add,
  but time constraints during this project prevented their implementation.

  <section|Future work><label|futurework>

  Besides finishing the implementation of the features already described,
  other interesting areas of future work include:

  <\description>
    <item*|Error messages>Currently <brick> does not provide useful error
    messages on either syntax or type errors. This is an open research
    problem (particularly for complex type errors), but even basic support
    would be a boon to the current implementation.

    <item*|Standard object-orientation features>Some standard OO features
    have not yet been implemented, in particular: it is intended that
    multiple conflicting definitions of a method (the standard problem of
    systems supporting multiple inheritance) be resolved using the C3 class
    linearisation algorithm first defined for the Dylan programming language;
    this is described fully in <cite|c3dylan>. Also, another thing missing
    from the current model is a notion of data hiding: the members of an
    object are equally visible inside and outside the class's definition.

    <item*|Garbage collection>Writing a garbage collector was considered to
    be outside the scope of this project, and so compiled <brick> programs
    simply run until available memory is exhausted (interpreted programs are
    garbage-collected by Haskell's GC). This is obviously a vital addition
    before <brick> becomes a usable general-purpose language.

    <item*|Optimisation>Although using LLVM for code-generation provides many
    optimisations ``for free'', some opportunities are currently missed. For
    instance, there is currently no mechanism by which the type inference
    engine can pass typing data to the compiler. Were this to be implemented,
    the compiler would have a large scope for type-based optimisations such
    as the elision of name-based field lookups.

    <item*|Foreign interface>To be able to perform most I/O tasks, it is
    necessary that a language be able to integrate with the language of the
    host system (generally C). A means of easily generating a <brick>
    interface from a C interface would make the language much more useful.
  </description>

  <appendix|BNF grammar for the syntax of <brick>><\footnote>
    Title of this section may be inaccurate, see <cite|getwellsoon>.
  </footnote><label|grammar>

  <chapquote|This document describes the usage and input syntax of the Unix
  Vax-11 assembler <tt|as>. <tt|as> is designed for assembling code produced
  by the ``C'' compiler; certain concessions have been made to handle code
  written directly by people, but in general little sympathy has been
  extended|Berkeley Vax/Unix Assembler Reference Manual>

  The grammar of <brick> as used by the parser is deliberately more liberal
  than the syntax of valid <brick> programs. The purpose of this is to lead
  to better error messages: although, say, an assignment statement is not
  valid in a class body, it is correctly parsed.<assign|bnfprod|<macro|
  \ <math|\<rightarrow\>> >> Later during compilation, an error message will
  be generated stating that the assignment was misplaced. This means that
  misplaced statements can cause accurate error messages (rather than generic
  ``= unexpected here'' style messages) and the size of the grammar is
  reduced.

  A number of current limitations of <brick> are reflected in this grammar:
  for instance, functions can only take a single argument.

  \;

  <\with|par-mode|left>
    <\with|par-columns|2>
      Program

      <bnfprod>Block

      ClassDef

      <bnfprod>class ID TypeParamList\ 

      \ \ \ \ \ \ SuperclassList TypeConstraintSet

      \ \ \ \ \ \ Stmts end

      SuperclassList

      <bnfprod><math|\<epsilon\>>

      <bnfprod>'\<less\>:' InstantiatedClassList

      InstantiatedClassList

      <bnfprod>InstantiatedClass

      <bnfprod>InstantiatedClassList ','\ 

      \ \ \ \ \ \ InstantiatedClass

      InstantiatedClass

      <bnfprod>ID TypeParamList

      Exp

      <bnfprod>ID

      <bnfprod>Exp '.' Field

      <bnfprod>Int

      <bnfprod>'(' Exp ')'

      <bnfprod>ExpStmt

      <bnfprod>true

      <bnfprod>false

      <bnfprod>Struct

      <bnfprod>function '(' ArgBinder ')' FuncBody

      ExpStmt

      <bnfprod>Exp '(' Exp ')'

      Struct

      <bnfprod>'{' StructContents '}'

      StructContents

      <bnfprod><math|\<epsilon\>>

      <bnfprod>DefList

      DefElem

      <bnfprod>ID TypeAnn OptDef

      OptDef

      <bnfprod><math|\<epsilon\>>

      <bnfprod>'=' Exp

      DefList

      <bnfprod>DefElem

      <bnfprod>DefList ',' DefElem

      Block

      <bnfprod>Stmts

      Stmts

      <bnfprod>Stmt

      <bnfprod>Stmts ';' Stmt

      Stmt

      <bnfprod>if Exp do Block IfTail

      <bnfprod>while Exp do Block end

      <bnfprod>do Block end

      <bnfprod>break

      <bnfprod>continue

      <bnfprod>return Exp

      <bnfprod>LValue '=' Exp

      <bnfprod>ExpStmt

      <bnfprod>var DefList

      <bnfprod>def DefList

      <bnfprod>def ID '(' ArgBinder ')' FuncBody

      ArgBinder

      <bnfprod>ID

      FuncBody

      <bnfprod>do Block end

      <bnfprod>'=' Exp

      IfTail

      <bnfprod>end

      <bnfprod>elif Exp do Block IfTail

      <bnfprod>else do Block end

      LValue

      <bnfprod>Var

      <bnfprod>Exp '.' Field

      Var

      <bnfprod>ID

      Field

      <bnfprod>ID

      TypeAnn

      <bnfprod><math|\<epsilon\>>

      <bnfprod>':' Type

      Type

      <bnfprod>TypeTerm

      <bnfprod>TypeQuantifierSet

      TypeTerm

      <bnfprod>TypeTerm '=\<gtr\>' TypeTerm

      <bnfprod>any

      <bnfprod>none

      <bnfprod>TypeVar

      <bnfprod>'(' TypeTerm ')'

      TypeQuantifierSet

      <bnfprod>forall TypeVarList TypeConstraintSet

      TypeConstraintSet

      <bnfprod><math|\<epsilon\>>

      <bnfprod>where TypeConstraintSet1

      TypeConstraintSet1

      <bnfprod>TypeConstraint

      <bnfprod>TypeConstraintSet1 ','\ 

      \ \ \ \ \ \ TypeConstraint

      TypeConstraint

      <bnfprod>TypeTerm '\<less\>:' TypeTerm

      TypeParamList

      <bnfprod><math|\<epsilon\>>

      <bnfprod>'[' TypeVarList ']'

      TypeVarList

      <bnfprod>TypeVar

      <bnfprod>TypeVarList ',' TypeVar

      TypeVar

      <bnfprod>ID
    </with>
  </with>

  <appendix|Detailed typing rules for <brick>><\footnote>
    Title of this section may be inaccurate, see <cite|getwellsoon>.
  </footnote>

  <chapquote|A chic type, a rough type, an odd type - but never a
  stereotype|Jean-Michel Jarre>

  We now present a formal specification of a subset of the typing rules of
  <brick>, to give a flavour of the internal workings of the constraint
  generator.

  In the description of the typing rules, we will use a simplified, more
  functional-looking syntax. Programs will be represented as:

  <\equation*>
    <tabular|<tformat|<cwith|1|7|2|2|cell-halign|r>|<table|<row|<cell|\<mathe\>>|<cell|=>|<cell|\<lambda\><text|x>.\<mathe\>>|<cell|\<lambda\><text|-abstraction>
    <around*|(|ungeneralised binding|)>>>|<row|<cell|>|<cell|\|>|<cell|\<mathe\>
    \<mathe\>>|<cell|<text|function application>>>|<row|<cell|>|<cell|<mid|\|>>|<cell|let
    \ <wide|\<b-x\>|^>= \<mathe\> in \<mathe\>>|<cell|let<text|-abstraction>
    <around*|(|generalised binding|)>>>|<row|<cell|>|<cell|\|>|<cell|<around*|{|<tt|f1>:\<mathe\>,<tt|f2>:\<mathe\>,\<ldots\>|}>>|<cell|structure
    creation>>|<row|<cell|>|<cell|\|>|<cell|\<mathe\>.<tt|f>>|<cell|structure
    field read>>|<row|<cell|>|<cell|\|>|<cell|\<mathe\>.<tt|f>\<assign\>\<mathe\>>|<cell|structure
    field write>>|<row|<cell|>|<cell|\|>|<cell|\<mathe\>;\<mathe\>>|<cell|sequential
    composition>>>>>
  </equation*>

  \;

  Bound names will be divided into two syntatically distinct classes:
  <math|<text|x>>, <text|y>, <text|z>, bound by <math|\<lambda\>>, and
  <math|<wide|\<b-x\>|^>,<wide|\<b-y\>|^>,<wide|\<b-z\>|^>>, bound by let
  (for a discussion of the distinction, including restrictions on what can be
  in the body of a let, see section <reference|generalised>). Mutable
  variables are omitted entirely, their effect is the same as that of a
  structure containing only one field.

  Typing judgements will be of the form <math|\<Gamma\>\<vdash\>\<mathe\>:\<tau\>\\C>,
  where <math|\<mathe\>> is the program being typed, <math|C> is the
  resulting constraint graph, <math|\<tau\>> is the constructed type or
  variable within the constraint graph representing the type, and
  <math|\<Gamma\>> is the typing environment.

  Typing environments <math|\<Gamma\>> will map names to types. For each
  ungeneralised variable <math|<text|x>> (bound by <math|\<lambda\>>),
  <math|\<Gamma\><around*|(|x|)>> will be a single type variable <math|a>
  which is constrained by each use of x. For each generalised variable
  <with|mode|math|<wide|\<b-x\>|^>> (bound by let),
  <math|\<Gamma\><around*|(|<wide|\<b-x\>|^>|)>> will be an rc type
  <math|a\\C>, allowing the binding to be used polymorphically by duplicating
  constraints. The set of ungeneralised variables in <math|\<Gamma\>> is
  <math|dom<rsub|\<lambda\>><around*|(|\<Gamma\>|)>>, and
  <math|\<Gamma\>+<around*|(|v\<mapsto\>t|)>> denotes the environment
  <math|\<Gamma\>> augmented with an extra mapping.

  The subsumption relation on rc types is extended to include the typing
  environment as:

  <\equation*>
    a\\C\<leqslant\><rsub|\<Gamma\>><rsup|\<forall\>>a<rprime|'>\\C<rprime|'>
  </equation*>

  which is defined as:

  <\equation*>
    a\\C\<leqslant\><rsup|\<forall\>>a<rprime|'>\\C<rprime|'>
    <space|0.2cm>\<wedge\><space|0.2cm> \<Gamma\><around*|(|<text|x>|)>\\C\<geqslant\><rsup|\<forall\>>
    \<Gamma\><around*|(|<text|x>|)>\\C<rprime|'> for all
    <text|x>\<in\>dom<rsub|\<lambda\>><around*|(|\<Gamma\>|)>
  </equation*>

  That is, an rc type <math|A> is a subtype of another rc type <math|B> in an
  environment <math|\<Gamma\>> iff <math|A> is a subtype of <math|B> and each
  ungeneralised binding is assigned by <math|A> a
  <with|font-shape|italic|supertype> of the type assigned by <math|B>. Since
  the ungeneralised bindings (<math|\<lambda\>>-bound variables) are
  essentially extra inputs to the term, this means that a type is a subtype
  of another iff it gives a subtype to the current term while giving a
  <with|font-shape|italic|supertype> to the extra inputs. This is analogous
  to the contravariant typing rule for function inputs.

  First, we present the <dfn|base typing rules> for <brick>:

  \;

  <\equation*>
    <tabular|<tformat|<cwith|1|7|1|2|cell-bsep|0.5cm>|<cwith|1|10|1|1|cell-halign|c>|<cwith|1|10|1|1|cell-bsep|0.5cm>|<table|<row|<cell|<frac|\<Gamma\>+<around*|(|<text|x>\<mapsto\>a|)>\<vdash\><text|e>:b\\C|\<Gamma\>\<vdash\>\<lambda\><text|x.e>:a\<rightarrow\>b\\C>>|<cell|<text|<name|Lambda>>>>|<row|<cell|<frac|\<Gamma\>\<vdash\><text|e><rsub|1>:a\<rightarrow\>b\\C<space|1cm>\<Gamma\>\<vdash\><text|e><rsub|2>:a\\C|\<Gamma\>\<vdash\><text|e><rsub|1><text|e><rsub|2>:b\\C>>|<cell|<text|<name|Apply>>>>|<row|<cell|<frac|\<Gamma\>\<vdash\>\<mathe\><rsub|1>:a<rsub|1>\\C<space|1cm>\<Gamma\>\<vdash\>\<mathe\><rsub|2>:a<rsub|2>\\C<space|1cm>\<ldots\>|\<Gamma\>\<vdash\><around*|{|<tt|f1>:\<mathe\><rsub|1>,<tt|f2>:\<mathe\><rsub|2>,\<ldots\>|}>:<around*|{|<tt|f1>:a<rsub|1>/a<rsub|1>,<tt|f2>:a<rsub|2>/a<rsub|2>,\<ldots\>|}>\\C>>|<cell|<text|<name|Struct-New>>>>|<row|<cell|<frac|\<Gamma\>\<vdash\><text|e>:<around*|{|<tt|f>:a/b|}>\\C|\<Gamma\>\<vdash\><text|e>.<tt|f>:b\\C>>|<cell|<text|<name|Struct-Get>>>>|<row|<cell|<frac|\<Gamma\>\<vdash\><text|e><rsub|1>:<around*|{|<tt|f>:a/b|}>\\C<space|1cm>\<Gamma\>\<vdash\><text|e><rsub|2>:a\\C|\<Gamma\>\<vdash\><text|e><rsub|1>.<tt|f>\<assign\>
    <text|e><rsub|2>:<around*|(||)>\\C>>|<cell|<text|<name|Struct-Set>>>>|<row|<cell|<frac|\<Gamma\>\<vdash\>\<mathe\><rsub|1>:a\\C<space|1cm>\<Gamma\>\<vdash\>\<mathe\><rsub|2>:b\\C|\<Gamma\>\<vdash\>\<mathe\><rsub|1>;\<mathe\><rsub|2>:b\\C>>|<cell|<text|<name|Seq>>>>|<row|<cell|<frac|\<Gamma\>\<vdash\>\<mathe\>:a\\C<space|1cm>a\\C\<leqslant\><rsub|\<Gamma\>><rsup|\<forall\>>a<rprime|'>\\C<rprime|'>|\<Gamma\>\<vdash\>\<mathe\>:a<rprime|'>\\C<rprime|'>>>|<cell|<text|<name|Sub>>>>|<row|<cell|<frac|\<Gamma\><around*|(|<text|x>|)>=v|\<Gamma\>\<vdash\><text|x>:v\\\<varnothing\>>>|<cell|<text|<name|Var>>>>|<row|<cell|<frac|\<Gamma\>\<vdash\><rsup|>\<mathe\><rsub|1>:a\\C<rsub|1><space|1cm>\<Gamma\>+<around*|(|<wide|\<b-x\>|^>\<mapsto\>a\\C<rsub|1>|)>\<vdash\>\<mathe\><rsub|2>:b\\C<rsub|2>|\<Gamma\>\<vdash\>let
    <wide|\<b-x\>|^>=\<mathe\><rsub|1> in
    \<mathe\><rsub|2>:b\\C<rsub|2>>>|<cell|<text|<name|Let>>>>|<row|<cell|<frac|\<Gamma\><around*|(|<wide|\<b-x\>|^>|)>=a\\C
    |\<Gamma\>\<vdash\><wide|\<b-x\>|^>:a\\C>>|<cell|<text|<name|Let-Var>>>>>>>
  </equation*>

  \;

  \;

  These typing rules, sadly, do not describe an algorithm. The rule
  <name|Sub> may be applied at any time, and since <math|C> appears twice in
  the context for some rules it can't be easily calculated.

  We now present the <dfn|inference rules> for <brick>. They are believed to
  be equivalent to the base typing rules, but no rigourous proof of this is
  provided.

  In order to ensure that these new rules are syntax-directed, we need to
  eliminate all uses of the rule <name|Sub>. There are a couple of situations
  in which <name|Sub> is used: to allow subtypes to be substituted when
  typing a primitive operation (e.g. the argument to <name|Struct-Get> is
  allowed to have more than one field by virtue of <name|Sub>), to allow
  renaming of variables in generalised terms (<name|Sub> allows the
  constraints generated by a use of <name|Let-Var> to be
  <math|\<alpha\>>-renamed, provinding generalisation) and to allow
  simplfication of inferred type (any valid simplification can be justified
  by a use of <name|Sub>).

  The first situation is avoided by removing all constructed terms from
  hypotheses of rules and building the minimum set of constraints explicitly.
  Since a minimal set of constraints is built, we end up with the typing
  derivation which corresponds to using <name|Sub> as little as possible to
  construct a valid derivation.

  The second situation is resolved by handling renaming of generalised
  variables explicitly, whiile the third is resolved by introducing an
  explicit rule <name|Simplify><math|> for performing simplifications which
  don't change the semantics of the graph. Its hypothesis demands that the
  two rc types be exactly equivalent (<math|\<equiv\><rsub|\<Gamma\>><rsup|\<forall\>>>
  is defined as the conjunction of <math|\<leqslant\><rsub|\<Gamma\>><rsup|\<forall\>>
  > and <with|mode|math|\<geqslant\><rsub|\<Gamma\>><rsup|\<forall\>>>), so
  its application is entirely optional: any valid derivation remains valid
  after all instances of <name|Simplify> are removed.

  The type environment <math|\<Gamma\>> changes slightly in this set of
  rules: the types given to let-bound variables are no longer just rc types
  but rc types with a renaming: <with|mode|math|\<Gamma\><around*|(|<wide|\<b-x\>|^>|)>=<around*|[|\<phi\>|]>a\\C>.
  The rc type <math|a\\C> contains no variables in common with any other part
  of the constraint set, and the renaming <math|\<phi\>> shows the mapping
  from the ungeneralised variables (<math|dom<rsub|\<lambda\>><around*|(|\<Gamma\>|)>>)
  to the variables in <math|a\\C>. This allows the rc type <math|a\\C> to
  apply constraints on the variables of <math|dom<rsub|\<lambda\>><around*|(|\<Gamma\>|)>>,
  without having them explicitly share variables as that would lead to very
  complex subtyping rules.

  Renamings such as <math|\<phi\>,\<rho\>> map variables to variables, and
  are generalised to rename constraint graphs and typing environments by
  renaming each of the variables within them.

  \;

  \;

  <\equation*>
    <tabular|<tformat|<cwith|1|9|1|2|cell-bsep|0.5cm>|<cwith|1|10|1|1|cell-halign|c>|<table|<row|<cell|<frac|\<Gamma\>+<around*|(|<text|x>\<mapsto\>a|)>\<vdash\><rsup|i><text|e>:b\\C|\<Gamma\>\<vdash\>\<lambda\><text|x>.<text|e>:f\\C\<oplus\><around*|{|a\<rightarrow\>b\<leqslant\>f|}>>>|<cell|<text|<name|Lambda>><rsup|i>>>|<row|<cell|<frac|\<Gamma\>\<vdash\><rsup|i><text|e><rsub|1>:f\\C<rsub|1><space|1cm>\<Gamma\>\<vdash\><rsup|i><text|e><rsub|2>:a\\C<rsub|2>|\<Gamma\>\<vdash\><rsup|i><text|e><rsub|1><text|e><rsub|2>:b\\C<rsub|1>\<oplus\><around*|{|f\<leqslant\>a\<rightarrow\>b|}>\<oplus\>C<rsub|2>>>|<cell|<text|<name|Apply>><rsup|i>>>|<row|<cell|<frac|\<Gamma\>\<vdash\><rsup|i>\<mathe\><rsub|1>:a<rsub|1>\\C<rsub|1><space|1cm>\<Gamma\>\<vdash\><rsup|i>\<mathe\><rsub|2>:a<rsub|2>\\C<rsub|2><space|1cm>\<ldots\>|\<Gamma\>\<vdash\><rsup|i><around*|{|<tt|f1>:\<mathe\><rsub|1>,<tt|f2>:\<mathe\><rsub|2>,\<ldots\>|}>:t\\<around*|{|<around*|{|<tt|f1>:a<rsub|1>/a<rsub|1>,<tt|f2>:a<rsub|2>/a<rsub|2>,\<ldots\>|}>\<leqslant\>t|}>\<oplus\><big-around|\<oplus\>|<rsub|i>C<rsub|i>>>>|<cell|<text|<name|Struct-New>><rsup|i>>>|<row|<cell|<frac|\<Gamma\>\<vdash\><rsup|i><text|e>:t\\C|\<Gamma\>\<vdash\><rsup|i><text|e>.<tt|f>:b\\<around*|{|t\<leqslant\><around*|{|<tt|f>:a/b|}>|}>\<oplus\>C>>|<cell|<text|<name|Struct-Get>><rsup|i>>>|<row|<cell|<frac|\<Gamma\>\<vdash\><rsup|i><text|e><rsub|1>:t\\C<rsub|1><space|1cm>\<Gamma\>\<vdash\><rsup|i><text|e><rsub|2>:a\\C<rsub|2>|\<Gamma\>\<vdash\><rsup|i><text|e><rsub|1>.<tt|f>\<assign\>
    <text|e><rsub|2>:c\\<around*|{|t\<leqslant\><around*|{|<tt|f>:a/b|}>,<around*|(||)>\<leqslant\>c|}>\<oplus\>C<rsub|1>\<oplus\>C<rsub|2>>>|<cell|<text|<name|Struct-Set>><rsup|i>>>|<row|<cell|<frac|\<Gamma\>\<vdash\><rsup|i>\<mathe\><rsub|1>:a\\C<rsub|1><space|1cm>\<Gamma\>\<vdash\><rsup|i>\<mathe\><rsub|2>:b\\C<rsub|2>|\<Gamma\>\<vdash\><rsup|i>\<mathe\><rsub|1>;\<mathe\><rsub|2>:b\\C<rsub|1>\<oplus\>C<rsub|2>>>|<cell|<text|<name|Seq>><rsup|i>>>|<row|<cell|<frac|\<Gamma\>\<vdash\>\<mathe\>:a\\C<space|1cm>a\\C\<equiv\><rsub|\<Gamma\>><rsup|\<forall\>>a<rprime|'>\\C<rprime|'>|\<Gamma\>\<vdash\>\<mathe\>:a<rprime|'>\\C<rprime|'>>>|<cell|<text|<name|Simplify>><rsup|i>>>|<row|<cell|<frac|\<Gamma\><around*|(|<text|x>|)>=v|\<Gamma\>\<vdash\><rsup|i><text|x>:v\\\<varnothing\>>>|<cell|<text|<name|Var>><rsup|i>>>|<row|<cell|<frac|<tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|\<phi\><text|
    a fresh renaming of >dom<rsub|\<lambda\>><around*|(|\<Gamma\>|)>>>|<row|<cell|\<phi\><around*|(|\<Gamma\>|)>\<vdash\><rsup|i>\<mathe\><rsub|1>:a\\C<rsub|1><space|1cm>\<Gamma\>+<around*|(|<wide|\<b-x\>|^>\<mapsto\><around*|[|\<phi\>|]>a\\C<rsub|1>|)>\<vdash\>\<mathe\><rsub|2>:b\\C<rsub|2>>>>>>|\<Gamma\>\<vdash\>let
    <wide|\<b-x\>|^>=\<mathe\><rsub|1> in
    \<mathe\><rsub|2>:b\\C<rsub|2>>>|<cell|<text|<name|Let>><rsup|i>>>|<row|<cell|<frac|\<Gamma\><around*|(|<wide|\<b-x\>|^>|)>=<around*|[|\<phi\>|]>a\\C<space|1cm>\<rho\><text|
    a fresh renaming of >fv<around*|(|a\\C|)>
    |\<Gamma\>\<vdash\><wide|\<b-x\>|^>:\<rho\><around*|(|a|)>\\\<rho\><around*|(|C|)>\<oplus\><around*|{|v\<leqslant\>\<rho\><around*|(|\<phi\><around*|(|v|)>|)>\|v\<in\>dom<around*|(|\<phi\>|)>|}>>>|<cell|<text|<name|Let-Var>><rsup|i>>>>>>
  </equation*>

  Note also that these typing rules correspond to the primitives defined in
  section <reference|primops>. Indeed, the typechecker is an implementation
  of that chapter's monad <math|\<cal-M\>> where the action of the monad is
  to collect a constraint graph and each primitive is implemented as one of
  the above typing rules and simply adds more constraints to the graph.

  <\with|par-mode|left>
    \;

    <\bibliography|bib|plain|/home/stephen/papers/papers.bib>
      <\bib-list|10>
        <bibitem*|1><label|bib-hopcroftmin>A.<nbsp>V. Aho, J.<nbsp>E.
        Hopcroft, and J.<nbsp>D. Ullman. <newblock><with|font-shape|italic|The
        Design and Analysis of Computer Algorithms>. <newblock>Addison-Wesley
        Publishing Company, 1974.

        <bibitem*|2><label|bib-subrec>Roberto<nbsp>M. Amadio and Luca
        Cardelli. <newblock>Subtyping recursive types.
        <newblock><with|font-shape|italic|ACM Trans. Program. Lang. Syst.>,
        15(4):575--631, 1993.

        <bibitem*|3><label|bib-c3dylan>K.<nbsp>Barrett, B.<nbsp>Cassels,
        P.<nbsp>Haahr, D.A. Moon, K.<nbsp>Playford, and P.T. Withington.
        <newblock>A monotonic superclass linearization for Dylan.
        <newblock>pages 69--82, 1996.

        <bibitem*|4><label|bib-abstracttypes>P.<nbsp>Cousot. <newblock>Types
        as abstract interpretations. <newblock>In
        <with|font-shape|italic|Proceedings of the 24th ACM SIGPLAN-SIGACT
        symposium on Principles of programming languages>, pages 316--331.
        ACM, 1997.

        <bibitem*|5><label|bib-getwellsoon>R.<nbsp>Dolan, C.<nbsp>Dolan, and
        K.<nbsp>Dolan. <newblock>Get well soon. <newblock>Card, 2011.
        <newblock>after appendectomy.

        <bibitem*|6><label|bib-alex>C.<nbsp>Dornan, I.<nbsp>Jones, and
        S.<nbsp>Marlow. <newblock>Alex: A lexical analyser generator for
        Haskell. <newblock><with|font-shape|italic|University of Glasgow>,
        1995.

        <bibitem*|7><label|bib-scalastructural>G.<nbsp>Dubochet and
        M.<nbsp>Odersky. <newblock>Compiling structural types on the JVM: a
        comparison of reflective and generative techniques from Scala's
        perspective. <newblock>In <with|font-shape|italic|Proceedings of the
        4th workshop on the Implementation, Compilation, Optimization of
        Object-Oriented Languages and Programming Systems>, pages 34--41.
        ACM, 2009.

        <bibitem*|8><label|bib-isoopinference>J.<nbsp>Eifrig, S.<nbsp>Smith,
        and V.<nbsp>Trifonov. <newblock>Sound polymorphic type inference for
        objects. <newblock><with|font-shape|italic|ACM SIGPLAN Notices>,
        30(10):169--184, 1995.

        <bibitem*|9><label|bib-ooprectypes>Jonathan Eifrig, Scott Smith, and
        Valery Trifonov. <newblock>Type Inference for Recursively Constrained
        Types and its Application to OOP.
        <newblock><with|font-shape|italic|Electronic Notes in Theoretical
        Computer Science>, 1:132 -- 153, 1995. <newblock>MFPS XI,
        Mathematical Foundations of Programming Semantics, Eleventh Annual
        Conference.

        <bibitem*|10><label|bib-decidablesub>Alexandre Frey.
        <newblock>Satisfying subtype inequalities in polynomial space.
        <newblock><with|font-shape|italic|Static Analysis>, 1302:265--277,
        1997. <newblock>10.1007/BFb0032747.

        <bibitem*|11><label|bib-whiteoak>J.<nbsp>Gil and I.<nbsp>Maman.
        <newblock>Whiteoak: introducing structural typing into java.
        <newblock><with|font-shape|italic|ACM SIGPLAN Notices>,
        43(10):73--90, 2008.

        <bibitem*|12><label|bib-happy>A.<nbsp>Gill and S.<nbsp>Marlow.
        <newblock>Happy: The parser generator for Haskell.
        <newblock><with|font-shape|italic|University of Glasgow>, 1995.

        <bibitem*|13><label|bib-arrows>J.<nbsp>Hughes. <newblock>Generalising
        monads to arrows. <newblock><with|font-shape|italic|Science of
        computer programming>, 37(1-3):67--111, 2000.

        <bibitem*|14><label|bib-imperativefunc>S.L.P. Jones and
        P.<nbsp>Wadler. <newblock>Imperative functional programming.
        <newblock>1993.

        <bibitem*|15><label|bib-ranknhaskell>S.P. Jones, D.<nbsp>Vytiniotis,
        S.<nbsp>Weirich, and M.<nbsp>Shields. <newblock>Practical type
        inference for arbitrary-rank types.
        <newblock><with|font-shape|italic|Journal of Functional Programming>,
        17(01):1--82, 2007.

        <bibitem*|16><label|bib-kaesinference>Stefan Kaes. <newblock>Type
        inference in the presence of overloading, subtyping and recursive
        types. <newblock>In <with|font-shape|italic|LFP '92: Proceedings of
        the 1992 ACM conference on LISP and functional programming>, pages
        193--204, New York, NY, USA, 1992. ACM.

        <bibitem*|17><label|bib-subrecfast>Dexter Kozen, Jens Palsberg, and
        Michael<nbsp>I. Schwartzbach. <newblock>Efficient recursive
        subtyping. <newblock>In <with|font-shape|italic|POPL '93: Proceedings
        of the 20th ACM SIGPLAN-SIGACT symposium on Principles of programming
        languages>, pages 419--428, New York, NY, USA, 1993. ACM.

        <bibitem*|18><label|bib-llvm>Chris Lattner and Vikram Adve.
        <newblock>LLVM: A Compilation Framework for Lifelong Program Analysis
        & Transformation. <newblock>In <with|font-shape|italic|Proceedings of
        the 2004 International Symposium on Code Generation and Optimization
        (CGO'04)>, Palo Alto, California, Mar 2004.

        <bibitem*|19><label|bib-leroypoly>X.<nbsp>Leroy.
        <newblock>Polymorphism by name for references and continuations.
        <newblock>In <with|font-shape|italic|Proceedings of the 20th ACM
        SIGPLAN-SIGACT Symposium on Principles of Programming Languages>,
        pages 220--231. ACM, 1993.

        <bibitem*|20><label|bib-unitynomstruct>D.<nbsp>Malayeri and
        J.<nbsp>Aldrich. <newblock>Integrating nominal and structural
        subtyping. <newblock><with|font-shape|italic|ECOOP
        2008--Object-Oriented Programming>, pages 260--284, 2008.

        <bibitem*|21><label|bib-moggimonads>E.<nbsp>Moggi and University
        of<nbsp>Edinburgh. Laboratory for Foundation<nbsp>of
        Computer<nbsp>Science. <newblock><with|font-shape|italic|An abstract
        view of programming languages>. <newblock>University of Edinburgh,
        Laboratory for Foundation of Computer Science, 1990.

        <bibitem*|22><label|bib-regulartypes>P.<nbsp>Morris,
        T.<nbsp>Altenkirch, and C.<nbsp>McBride. <newblock>Exploring the
        regular tree types. <newblock><with|font-shape|italic|Types for
        Proofs and Programs>, pages 252--267, 2006.

        <bibitem*|23><label|bib-acinferenceclosure>J.<nbsp>Palsberg.
        <newblock>Efficient inference of object types. <newblock>In
        <with|font-shape|italic|Logic in Computer Science, 1994. LICS'94.
        Proceedings., Symposium on>, pages 186--195. IEEE, 1995.

        <bibitem*|24><label|bib-constrainedtypes>J.<nbsp>Palsberg and
        S.<nbsp>Smith. <newblock>Constrained types and their expressiveness.
        <newblock><with|font-shape|italic|ACM Transactions on Programming
        Languages and Systems (TOPLAS)>, 18(5):519--527, 1996.

        <bibitem*|25><label|bib-flowtypes>Jens Palsberg and Patrick O'Keefe.
        <newblock>A type system equivalent to flow analysis.
        <newblock><with|font-shape|italic|ACM Trans. Program. Lang. Syst.>,
        17(4):576--599, 1995.

        <bibitem*|26><label|bib-arrowcomp>R.<nbsp>Paterson. <newblock>Arrows
        and computation. <newblock><with|font-shape|italic|The Fun of
        Programming>, pages 201--222, 2003.

        <bibitem*|27><label|bib-haskellweak>S.<nbsp>Peyton<nbsp>Jones,
        S.<nbsp>Marlow, and C.<nbsp>Elliott. <newblock>Stretching the storage
        manager: weak pointers and stable names in Haskell.
        <newblock><with|font-shape|italic|Implementation of Functional
        Languages>, pages 37--58, 2000.

        <bibitem*|28><label|bib-pottiersimplifying>F.<nbsp>Pottier.
        <newblock>Simplifying subtyping constraints. <newblock>In
        <with|font-shape|italic|Proceedings of the first ACM SIGPLAN
        international conference on Functional programming>, pages 122--133.
        ACM, 1996.

        <bibitem*|29><label|bib-pottierphd>François Pottier. <newblock>Type
        inference in the presence of subtyping: from theory to practice.
        <newblock>PhD Thesis, INRIA, 1998.

        <bibitem*|30><label|bib-pottierframework>François Pottier.
        <newblock>A framework for type inference with subtyping.
        <newblock><with|font-shape|italic|SIGPLAN Not.>, 34(1):228--238,
        1999.

        <bibitem*|31><label|bib-ranknml>C.V. Russo and D.<nbsp>Vytiniotis.
        <newblock>QML: explicit first-class polymorphism for ML. <newblock>In
        <with|font-shape|italic|Proceedings of the 2009 ACM SIGPLAN workshop
        on ML>, pages 3--14. ACM, 2009.

        <bibitem*|32><label|bib-sparsetables>R.E. Tarjan and A.C.C. Yao.
        <newblock>Storing a sparse table.
        <newblock><with|font-shape|italic|Communications of the ACM>,
        22(11):606--611, 1979.

        <bibitem*|33><label|bib-toftepoly>M.<nbsp>Tofte. <newblock>Type
        inference for polymorphic references.
        <newblock><with|font-shape|italic|Information and computation>,
        89(1):1--34, 1990.

        <bibitem*|34><label|bib-subconst>Valery Trifonov and Scott Smith.
        <newblock>Subtyping constrained types.
        <newblock><with|font-shape|italic|Static Analysis>, 1145:349--365,
        1996.

        <bibitem*|35><label|bib-wadlermonads>P.<nbsp>Wadler. <newblock>Monads
        for functional programming. <newblock><with|font-shape|italic|Advanced
        Functional Programming>, pages 24--52, 1995.

        <bibitem*|36><label|bib-valuerestriction>A.K. Wright.
        <newblock>Polymorphism for imperative languages without imperative
        types. <newblock>Technical report, Rice University Dept. of Computer
        Science, 1993.

        <bibitem*|37><label|bib-valuerestriction2>A.K. Wright.
        <newblock>Simple imperative polymorphism.
        <newblock><with|font-shape|italic|Lisp and symbolic computation>,
        8(4):343--355, 1995.
      </bib-list>
    </bibliography>
  </with>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|par-hyphen|normal>
    <associate|par-mode|justify>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|7>>
    <associate|auto-10|<tuple|1.3.2|10>>
    <associate|auto-11|<tuple|1.3.3|11>>
    <associate|auto-12|<tuple|1.3.4|11>>
    <associate|auto-13|<tuple|1.4|11>>
    <associate|auto-14|<tuple|1.4.1|12>>
    <associate|auto-15|<tuple|1.4.2|12>>
    <associate|auto-16|<tuple|1.4.2|13>>
    <associate|auto-17|<tuple|2|14>>
    <associate|auto-18|<tuple|2.1|14>>
    <associate|auto-19|<tuple|2.1.1|15>>
    <associate|auto-2|<tuple|1.1|7>>
    <associate|auto-20|<tuple|2.2|15>>
    <associate|auto-21|<tuple|2.2.1|16>>
    <associate|auto-22|<tuple|2.2.2|17>>
    <associate|auto-23|<tuple|2.3|17>>
    <associate|auto-24|<tuple|2.3.1|18>>
    <associate|auto-25|<tuple|2.4|18>>
    <associate|auto-26|<tuple|2.5|18>>
    <associate|auto-27|<tuple|2.5.1|19>>
    <associate|auto-28|<tuple|2.6|20>>
    <associate|auto-29|<tuple|3|21>>
    <associate|auto-3|<tuple|1.1.1|7>>
    <associate|auto-30|<tuple|3.1|21>>
    <associate|auto-31|<tuple|3.2|22>>
    <associate|auto-32|<tuple|3.3|22>>
    <associate|auto-33|<tuple|3.3.1|23>>
    <associate|auto-34|<tuple|3.3.2|23>>
    <associate|auto-35|<tuple|3.4|23>>
    <associate|auto-36|<tuple|3.4.1|24>>
    <associate|auto-37|<tuple|3.5|24>>
    <associate|auto-38|<tuple|3.6|25>>
    <associate|auto-39|<tuple|3.6.1|25>>
    <associate|auto-4|<tuple|1.1.2|8>>
    <associate|auto-40|<tuple|3.6.2|26>>
    <associate|auto-41|<tuple|3.7|27>>
    <associate|auto-42|<tuple|3.7.1|28>>
    <associate|auto-43|<tuple|3.7.2|28>>
    <associate|auto-44|<tuple|3.8|29>>
    <associate|auto-45|<tuple|4|31>>
    <associate|auto-46|<tuple|4.1|31>>
    <associate|auto-47|<tuple|4.1.1|31>>
    <associate|auto-48|<tuple|4.2|32>>
    <associate|auto-49|<tuple|4.2.1|33>>
    <associate|auto-5|<tuple|1.1.3|8>>
    <associate|auto-50|<tuple|4.3|33>>
    <associate|auto-51|<tuple|4.3.1|33>>
    <associate|auto-52|<tuple|4.3.2|33>>
    <associate|auto-53|<tuple|4.4|34>>
    <associate|auto-54|<tuple|4.4.1|34>>
    <associate|auto-55|<tuple|4.5|35>>
    <associate|auto-56|<tuple|4.5.1|35>>
    <associate|auto-57|<tuple|4.5.2|36>>
    <associate|auto-58|<tuple|4.5.3|37>>
    <associate|auto-59|<tuple|4.5.4|38>>
    <associate|auto-6|<tuple|1.1.4|9>>
    <associate|auto-60|<tuple|4.6|39>>
    <associate|auto-61|<tuple|5|40>>
    <associate|auto-62|<tuple|5.1|40>>
    <associate|auto-63|<tuple|5.1.1|40>>
    <associate|auto-64|<tuple|5.1.2|41>>
    <associate|auto-65|<tuple|5.2|42>>
    <associate|auto-66|<tuple|5.3|42>>
    <associate|auto-67|<tuple|5.3.1|42>>
    <associate|auto-68|<tuple|6|44>>
    <associate|auto-69|<tuple|6.1|44>>
    <associate|auto-7|<tuple|1.2|9>>
    <associate|auto-70|<tuple|6.2|45>>
    <associate|auto-71|<tuple|6.3|46>>
    <associate|auto-72|<tuple|6.4|46>>
    <associate|auto-73|<tuple|6.5|47>>
    <associate|auto-74|<tuple|7|48>>
    <associate|auto-75|<tuple|7.1|48>>
    <associate|auto-76|<tuple|7.2|49>>
    <associate|auto-77|<tuple|7.2.1|49>>
    <associate|auto-78|<tuple|7.2.2|50>>
    <associate|auto-79|<tuple|7.2.3|51>>
    <associate|auto-8|<tuple|1.3|10>>
    <associate|auto-80|<tuple|7.3|51>>
    <associate|auto-81|<tuple|7.4|52>>
    <associate|auto-82|<tuple|7.5|52>>
    <associate|auto-83|<tuple|7.6|53>>
    <associate|auto-84|<tuple|8|55>>
    <associate|auto-85|<tuple|8.1|55>>
    <associate|auto-86|<tuple|8.2|55>>
    <associate|auto-87|<tuple|A|57>>
    <associate|auto-88|<tuple|B|59>>
    <associate|auto-89|<tuple|B.1|62>>
    <associate|auto-9|<tuple|1.3.1|10>>
    <associate|auto-90|<tuple|B.1|57>>
    <associate|auto-91|<tuple|B.1|59>>
    <associate|auto-92|<tuple|B.1|62>>
    <associate|bib-abstracttypes|<tuple|4|62>>
    <associate|bib-acinferenceclosure|<tuple|23|62>>
    <associate|bib-alex|<tuple|6|62>>
    <associate|bib-arrowcomp|<tuple|26|63>>
    <associate|bib-arrows|<tuple|13|62>>
    <associate|bib-c3dylan|<tuple|3|62>>
    <associate|bib-constrainedtypes|<tuple|24|63>>
    <associate|bib-decidablesub|<tuple|10|62>>
    <associate|bib-flowtypes|<tuple|25|63>>
    <associate|bib-getwellsoon|<tuple|5|62>>
    <associate|bib-happy|<tuple|12|62>>
    <associate|bib-haskellweak|<tuple|27|63>>
    <associate|bib-hopcroftmin|<tuple|1|62>>
    <associate|bib-imperativefunc|<tuple|14|62>>
    <associate|bib-isoopinference|<tuple|8|62>>
    <associate|bib-kaesinference|<tuple|16|62>>
    <associate|bib-leroypoly|<tuple|19|62>>
    <associate|bib-llvm|<tuple|18|62>>
    <associate|bib-moggimonads|<tuple|21|62>>
    <associate|bib-objectcalculus|<tuple|1|?>>
    <associate|bib-ooprectypes|<tuple|9|62>>
    <associate|bib-pottierframework|<tuple|30|63>>
    <associate|bib-pottierphd|<tuple|29|63>>
    <associate|bib-pottiersimplifying|<tuple|28|63>>
    <associate|bib-ranknhaskell|<tuple|15|62>>
    <associate|bib-ranknml|<tuple|31|63>>
    <associate|bib-regulartypes|<tuple|22|62>>
    <associate|bib-scalastructural|<tuple|7|62>>
    <associate|bib-sparsetables|<tuple|32|63>>
    <associate|bib-subconst|<tuple|34|63>>
    <associate|bib-subrec|<tuple|2|62>>
    <associate|bib-subrecfast|<tuple|17|62>>
    <associate|bib-toftepoly|<tuple|33|63>>
    <associate|bib-unitynomstruct|<tuple|20|62>>
    <associate|bib-valuerestriction|<tuple|36|63>>
    <associate|bib-valuerestriction2|<tuple|37|63>>
    <associate|bib-wadlermonads|<tuple|35|63>>
    <associate|bib-whiteoak|<tuple|11|62>>
    <associate|chapsemantics|<tuple|4|31>>
    <associate|classes|<tuple|4.3|33>>
    <associate|closure|<tuple|2.6|20>>
    <associate|constructorlattice|<tuple|2.5.1|19>>
    <associate|display|<tuple|3.8|29>>
    <associate|footnote-1|<tuple|1|2>>
    <associate|footnote-1.1|<tuple|1.1|8>>
    <associate|footnote-1.2|<tuple|1.2|?>>
    <associate|footnote-1.3|<tuple|1.3|?>>
    <associate|footnote-1.4|<tuple|1.4|?>>
    <associate|footnote-1.5|<tuple|1.5|?>>
    <associate|footnote-1.6|<tuple|1.6|?>>
    <associate|footnote-10|<tuple|10|17>>
    <associate|footnote-10.1|<tuple|10.1|?>>
    <associate|footnote-10.2|<tuple|10.2|?>>
    <associate|footnote-10.3|<tuple|10.3|?>>
    <associate|footnote-11|<tuple|11|17>>
    <associate|footnote-12|<tuple|12|18>>
    <associate|footnote-13|<tuple|13|18>>
    <associate|footnote-14|<tuple|14|22>>
    <associate|footnote-15|<tuple|15|23>>
    <associate|footnote-16|<tuple|16|24>>
    <associate|footnote-2|<tuple|2|5>>
    <associate|footnote-2.1|<tuple|2.1|16>>
    <associate|footnote-2.2|<tuple|2.2|20>>
    <associate|footnote-2.3|<tuple|2.3|?>>
    <associate|footnote-2.4|<tuple|2.4|?>>
    <associate|footnote-3|<tuple|3|7>>
    <associate|footnote-3.1|<tuple|3.1|21>>
    <associate|footnote-3.2|<tuple|3.2|22>>
    <associate|footnote-3.3|<tuple|3.3|23>>
    <associate|footnote-3.4|<tuple|3.4|27>>
    <associate|footnote-3.5|<tuple|3.5|28>>
    <associate|footnote-4|<tuple|4|8>>
    <associate|footnote-4.1|<tuple|4.1|32>>
    <associate|footnote-4.2|<tuple|4.2|34>>
    <associate|footnote-4.3|<tuple|4.3|34>>
    <associate|footnote-4.4|<tuple|4.4|36>>
    <associate|footnote-4.5|<tuple|4.5|37>>
    <associate|footnote-4.6|<tuple|4.6|38>>
    <associate|footnote-5|<tuple|5|9>>
    <associate|footnote-5.1|<tuple|5.1|40>>
    <associate|footnote-5.2|<tuple|5.2|40>>
    <associate|footnote-5.3|<tuple|5.3|28>>
    <associate|footnote-5.4|<tuple|5.4|31>>
    <associate|footnote-5.5|<tuple|5.5|32>>
    <associate|footnote-5.6|<tuple|5.6|32>>
    <associate|footnote-6|<tuple|6|14>>
    <associate|footnote-6.1|<tuple|6.1|45>>
    <associate|footnote-6.2|<tuple|6.2|35>>
    <associate|footnote-7|<tuple|7|14>>
    <associate|footnote-7.1|<tuple|7.1|49>>
    <associate|footnote-7.2|<tuple|7.2|51>>
    <associate|footnote-7.3|<tuple|7.3|52>>
    <associate|footnote-8|<tuple|8|15>>
    <associate|footnote-8.1|<tuple|8.1|44>>
    <associate|footnote-8.2|<tuple|8.2|46>>
    <associate|footnote-8.3|<tuple|8.3|46>>
    <associate|footnote-9|<tuple|9|16>>
    <associate|footnote-A.1|<tuple|A.1|57>>
    <associate|footnote-B.1|<tuple|B.1|59>>
    <associate|footnr-1|<tuple|1|2>>
    <associate|footnr-1.1|<tuple|1.1|8>>
    <associate|footnr-1.2|<tuple|1.2|?>>
    <associate|footnr-1.3|<tuple|1.3|?>>
    <associate|footnr-1.4|<tuple|1.4|?>>
    <associate|footnr-1.5|<tuple|1.5|?>>
    <associate|footnr-1.6|<tuple|1.6|?>>
    <associate|footnr-10|<tuple|10|17>>
    <associate|footnr-10.1|<tuple|10.1|?>>
    <associate|footnr-10.2|<tuple|10.2|?>>
    <associate|footnr-10.3|<tuple|10.3|?>>
    <associate|footnr-11|<tuple|11|17>>
    <associate|footnr-12|<tuple|12|18>>
    <associate|footnr-13|<tuple|13|18>>
    <associate|footnr-14|<tuple|14|22>>
    <associate|footnr-15|<tuple|15|23>>
    <associate|footnr-16|<tuple|16|24>>
    <associate|footnr-2|<tuple|2|5>>
    <associate|footnr-2.1|<tuple|2.1|16>>
    <associate|footnr-2.2|<tuple|2.2|19>>
    <associate|footnr-2.3|<tuple|2.3|?>>
    <associate|footnr-2.4|<tuple|2.4|?>>
    <associate|footnr-3|<tuple|3|7>>
    <associate|footnr-3.1|<tuple|3.1|21>>
    <associate|footnr-3.2|<tuple|3.2|22>>
    <associate|footnr-3.3|<tuple|3.3|23>>
    <associate|footnr-3.4|<tuple|3.4|27>>
    <associate|footnr-3.5|<tuple|3.5|28>>
    <associate|footnr-4|<tuple|4|8>>
    <associate|footnr-4.1|<tuple|4.1|32>>
    <associate|footnr-4.2|<tuple|4.2|34>>
    <associate|footnr-4.3|<tuple|4.3|34>>
    <associate|footnr-4.4|<tuple|4.4|36>>
    <associate|footnr-4.5|<tuple|4.5|37>>
    <associate|footnr-4.6|<tuple|4.6|38>>
    <associate|footnr-5|<tuple|5|9>>
    <associate|footnr-5.1|<tuple|5.1|40>>
    <associate|footnr-5.2|<tuple|5.2|40>>
    <associate|footnr-5.3|<tuple|5.3|28>>
    <associate|footnr-5.4|<tuple|5.4|31>>
    <associate|footnr-5.5|<tuple|5.5|32>>
    <associate|footnr-5.6|<tuple|5.6|32>>
    <associate|footnr-6|<tuple|6|14>>
    <associate|footnr-6.1|<tuple|6.1|45>>
    <associate|footnr-6.2|<tuple|6.2|35>>
    <associate|footnr-7|<tuple|7|14>>
    <associate|footnr-7.1|<tuple|7.1|49>>
    <associate|footnr-7.2|<tuple|7.2|51>>
    <associate|footnr-7.3|<tuple|7.3|52>>
    <associate|footnr-8|<tuple|8|15>>
    <associate|footnr-8.1|<tuple|8.1|44>>
    <associate|footnr-8.2|<tuple|8.2|46>>
    <associate|footnr-8.3|<tuple|8.3|46>>
    <associate|footnr-9|<tuple|9|16>>
    <associate|footnr-A.1|<tuple|A.1|57>>
    <associate|footnr-B.1|<tuple|B.1|59>>
    <associate|futurework|<tuple|8.2|55>>
    <associate|generalised|<tuple|4.4|34>>
    <associate|grammar|<tuple|A.1|57>>
    <associate|minimisation|<tuple|3.6.2|26>>
    <associate|mutability|<tuple|4.1.1|31>>
    <associate|nomstruct|<tuple|4.5|35>>
    <associate|objectlattice|<tuple|4.5.3|37>>
    <associate|primops|<tuple|7.6|53>>
    <associate|rcdenotation|<tuple|2.3.1|18>>
    <associate|subc|<tuple|2.5|18>>
    <associate|subsumptionalg|<tuple|3.7|27>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      whiteoak

      scalastructural

      unitynomstruct

      subrec

      subrecfast

      regulartypes

      constrainedtypes

      flowtypes

      acinferenceclosure

      subconst

      isoopinference

      ooprectypes

      pottierframework

      pottierphd

      pottiersimplifying

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

      isoopinference

      pottierphd

      pottierframework

      pottierphd

      subconst

      pottierphd

      subconst

      pottierphd

      pottierphd

      pottierframework

      subconst

      haskellweak

      pottierphd

      isoopinference

      pottiersimplifying

      kaesinference

      pottiersimplifying

      hopcroftmin

      subconst

      pottierphd

      pottierphd

      pottierphd

      pottierphd

      pottiersimplifying

      pottierphd

      subconst

      pottierphd

      pottierphd

      subrecfast

      pottierphd

      decidablesub

      ranknml

      ranknhaskell

      valuerestriction

      valuerestriction2

      toftepoly

      leroypoly

      valuerestriction

      valuerestriction2

      wadlermonads

      moggimonads

      imperativefunc

      happy

      alex

      llvm

      arrowcomp

      arrows

      sparsetables

      abstracttypes

      c3dylan

      getwellsoon

      getwellsoon
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>Background <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      <with|par-left|<quote|1.5fn>|1.1.1<space|2spc>Type systems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1.5fn>|1.1.2<space|2spc>Subtyping and
      object-orientation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1.5fn>|1.1.3<space|2spc>Nominative and structural
      types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1.5fn>|1.1.4<space|2spc>``Polymorphism''
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      1.2<space|2spc>Outline of syntax and semantics
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      1.3<space|2spc><with|font-shape|<quote|small-caps>|Brick>'s type system
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      <with|par-left|<quote|1.5fn>|1.3.1<space|2spc>Constructing types
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1.5fn>|1.3.2<space|2spc>Constraints and subtyping
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1.5fn>|1.3.3<space|2spc>Integrating nominative
      and structural typing <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1.5fn>|1.3.4<space|2spc>The type system and
      inference engine <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      1.4<space|2spc>Language implementation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>

      <with|par-left|<quote|1.5fn>|1.4.1<space|2spc>Traditional language
      implementations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1.5fn>|1.4.2<space|2spc><with|font-shape|<quote|small-caps>|Brick>'s
      implementation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <vspace*|2fn><\with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>>
        <\with|par-mode|<quote|center>>
          Part I:

          Language Design
        </with>
      </with> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Type
      inference as constraint solving> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      2.1<space|2spc>Constructors and Variance
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>

      <with|par-left|<quote|1.5fn>|2.1.1<space|2spc><with|mode|<quote|math>|\<top\>>
      and <with|mode|<quote|math>|\<bot\>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      2.2<space|2spc>Ground types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>

      <with|par-left|<quote|1.5fn>|2.2.1<space|2spc>Equirecursive and
      isorecursive data types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <with|par-left|<quote|1.5fn>|2.2.2<space|2spc>Subtyping between ground
      types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      2.3<space|2spc>rc types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>

      <with|par-left|<quote|1.5fn>|2.3.1<space|2spc>Denotation of an rc type
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      2.4<space|2spc>Constraints and well-typedness
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      2.5<space|2spc>Structural decomposition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>

      <with|par-left|<quote|1.5fn>|2.5.1<space|2spc>Formal definition of
      constructor lattice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      2.6<space|2spc>Closure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      type inference engine> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29><vspace|0.5fn>

      3.1<space|2spc>The small terms invariant
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>

      3.2<space|2spc>Merging constraints <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>

      3.3<space|2spc>The mono-polarity invariant and garbage collection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>

      <with|par-left|<quote|1.5fn>|3.3.1<space|2spc>Small constructed types
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      <with|par-left|<quote|1.5fn>|3.3.2<space|2spc>Garbage collection of
      constraint sets <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      3.4<space|2spc>Representing the constraint set
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>

      <with|par-left|<quote|1.5fn>|3.4.1<space|2spc>Implementation detail
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      3.5<space|2spc>The incremental closure algorithm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>

      3.6<space|2spc>Type simplification and optimisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>

      <with|par-left|<quote|1.5fn>|3.6.1<space|2spc>Canonisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>>

      <with|par-left|<quote|1.5fn>|3.6.2<space|2spc>Minimisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>>

      3.7<space|2spc>rc type subsumption <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>

      <with|par-left|<quote|1.5fn>|3.7.1<space|2spc>Subsumption
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>>

      <with|par-left|<quote|1.5fn>|3.7.2<space|2spc>Entailment
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>>

      3.8<space|2spc>Display <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Semantics
      and object model> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45><vspace|0.5fn>

      4.1<space|2spc>Structures <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>

      <with|par-left|<quote|1.5fn>|4.1.1<space|2spc>Mutability and typing
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>>

      4.2<space|2spc>Optional type annotations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48>

      <with|par-left|<quote|1.5fn>|4.2.1<space|2spc>Checking type annotations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49>>

      4.3<space|2spc>Classes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>

      <with|par-left|<quote|1.5fn>|4.3.1<space|2spc>Class members
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-51>>

      <with|par-left|<quote|1.5fn>|4.3.2<space|2spc>Constructors
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-52>>

      4.4<space|2spc>Generalised and ungeneralised bindings
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>

      <with|par-left|<quote|1.5fn>|4.4.1<space|2spc>The value restriction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54>>

      4.5<space|2spc>Integration of nominative and structural typing
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>

      <with|par-left|<quote|1.5fn>|4.5.1<space|2spc>A potential problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>>

      <with|par-left|<quote|1.5fn>|4.5.2<space|2spc>Formal model of classes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>>

      <with|par-left|<quote|1.5fn>|4.5.3<space|2spc>The object constructor
      lattice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58>>

      <with|par-left|<quote|1.5fn>|4.5.4<space|2spc>Interface intersection
      types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59>>

      <vspace*|2fn><\with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>>
        <\with|par-mode|<quote|center>>
          Part II:

          Language Implementation
        </with>
      </with> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-60><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Implementation
      tools> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-61><vspace|0.5fn>

      5.1<space|2spc>Haskell <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-62>

      <with|par-left|<quote|1.5fn>|5.1.1<space|2spc>Laziness
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-63>>

      <with|par-left|<quote|1.5fn>|5.1.2<space|2spc>Monads
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-64>>

      5.2<space|2spc>Happy and Alex <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-65>

      5.3<space|2spc>LLVM <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-66>

      <with|par-left|<quote|1.5fn>|5.3.1<space|2spc>LLVM IR
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-67>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Extending
      an interpreter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-68><vspace|0.5fn>

      6.1<space|2spc>Meta-circular interpreters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-69>

      6.2<space|2spc>Monadic interpreters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-70>

      6.3<space|2spc>Generalising <with|font-family|<quote|tt>|math-font-family|<quote|ttt>|eval>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-71>

      6.4<space|2spc>Generalising <with|font-family|<quote|tt>|math-font-family|<quote|ttt>|eval>
      further <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-72>

      6.5<space|2spc>Generalising <with|font-family|<quote|tt>|math-font-family|<quote|ttt>|eval>
      even further <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-73>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>A
      compiler from an interpreter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-74><vspace|0.5fn>

      7.1<space|2spc>A code generation monad
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-75>

      7.2<space|2spc>Representing flow control
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-76>

      <with|par-left|<quote|1.5fn>|7.2.1<space|2spc>Coalescing
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-77>>

      <with|par-left|<quote|1.5fn>|7.2.2<space|2spc>Iteration
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-78>>

      <with|par-left|<quote|1.5fn>|7.2.3<space|2spc>Aside: Arrows
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-79>>

      7.3<space|2spc>Implementation of structures
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-80>

      7.4<space|2spc>Implementation of closures
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-81>

      7.5<space|2spc>A typechecker from an interpreter
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-82>

      7.6<space|2spc>Primitive operations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-83>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Conclusions
      and future work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-84><vspace|0.5fn>

      8.1<space|2spc>Current state of the implementation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-85>

      8.2<space|2spc>Future work <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-86>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix
      A<space|2spc>BNF grammar for the syntax of
      <with|font-shape|<quote|small-caps>|Brick>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-87><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix
      B<space|2spc>Detailed typing rules for
      <with|font-shape|<quote|small-caps>|Brick>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-88><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-89><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
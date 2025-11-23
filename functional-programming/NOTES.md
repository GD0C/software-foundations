| Parser Type           | Category                | Power           | Why Use It                                | Pros                                                 | Cons                                      | Typical Use Cases                             |
| --------------------- | ----------------------- | --------------- | ----------------------------------------- | ---------------------------------------------------- | ----------------------------------------- | --------------------------------------------- |
| **Recursive Descent** | Top-down                | Medium          | Hand-written, easy control                | Simple to write, readable, direct mapping to grammar | No left recursion, backtracking tricky    | DSLs, small languages, interpreters           |
| **LL(k)**             | Top-down                | Medium          | Predictive parsing                        | Clear errors, deterministic, fast                    | Must transform grammar, no left recursion | Teaching, DSLs, parser generators             |
| **PEG / Packrat**     | Top-down                | Medium–High     | Regex-like grammar, unambiguous by design | Linear time, unlimited lookahead                     | High memory use, ordered choice quirks    | Modern DSLs, markup, configs                  |
| **Pratt Parser**      | Top-down                | Special-purpose | Expression parsing                        | Easiest way to parse operators, tiny code            | Only for expressions                      | Expression-heavy languages (JS, Go, Zig, Lua) |
| **LR(0), LR(1)**      | Bottom-up               | High            | Industrial grammars                       | Strong grammar coverage, deterministic               | Hard to write by hand, big tables         | Compilers, parser generators                  |
| **SLR**               | Bottom-up               | Medium          | Simple LR variant                         | Small tables, easier to implement                    | More conflicts than LALR/LR(1)            | Simple languages                              |
| **LALR(1)**           | Bottom-up               | High            | Yacc/Bison style                          | Good power + smaller tables                          | Still opaque conflicts                    | Real languages historically (C, Go, Ruby)     |
| **GLR**               | Bottom-up (generalized) | Very High       | Ambiguous grammars                        | Handles ANY CFG                                      | Worst-case cubic time                     | Natural language, complex syntax              |
| **Earley**            | Generalized             | Very High       | Ambiguous grammars                        | Handles ANY CFG, simple algorithm                    | Slow for normal PLs                       | NLP, grammar analysis                         |
| **CYK**               | Generalized             | Very High       | Formal grammar theory                     | Very clean DP algorithm                              | Requires CNF + O(n³)                      | Theory, validation, research                  |




| **Language Class**                                   | **Decidable?**              | **RE (Turing-recognizable)?** | **Examples**                                                         | **Notes / Why**                                                            |
| ---------------------------------------------------- | --------------------------- | ----------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| **Regular Languages (RL)**                           | ✔ **Decidable**             | ✔                             | `a*`, `(ab)*`, token patterns, regexes                               | Finite automata. Basis of **lexing**. Very important in compilers.         |
| **Context-Free Languages (CFL)**                     | ✔ **Decidable**             | ✔                             | Balanced parentheses, simple arithmetic grammars                     | Recognized by **pushdown automata**. Basis of **parsing**.                 |
| **Deterministic CFLs (DCFL)**                        | ✔                           | ✔                             | LL(1), LR(1) grammars                                                | Important for efficient deterministic parsing (LL/LR).                     |
| **Deterministic Context-Sensitive Languages (DCSL)** | ✔ (but extremely expensive) | ✔                             | Some type systems, certain logical constraints                       | Rarely implemented directly; theoretical.                                  |
| **Context-Sensitive Languages (CSL)**                | ✔                           | ✔                             | Languages requiring linear bounded memory; some semantic constraints | Recognized by **linear bounded automata**. Not used directly in compilers. |
| **Indexed Languages**                                | ✔                           | ✔                             | Tree-adjoining grammars                                              | More powerful than CFLs; niche use in natural language processing.         |
| **Recursive (Decidable) Languages**                  | ✔ **By definition**         | ✔                             | All languages where a TM halts on all inputs                         | “Computable languages.”                                                    |
| **Recursively Enumerable (RE)**                      | ✘ (not always)              | ✔ **By definition**           | Halting problem variants, accepted by TM that might loop             | TM may loop on rejection.                                                  |
| **Co-RE**                                            | ✘                           | ✘                             | Complements of RE but not decidable                                  | Useful for reductions.                                                     |
| **RE ∩ co-RE = Recursive**                           | ✔                           | ✔                             | Problems decidable by halting                                        | ACTUALLY decidable languages.                                              |
| **Non-RE Languages**                                 | ✘                           | ✘                             | Complement of the Halting Problem, diagonalization languages         | No TM can even *recognize* them.                                           |



| **Language / Problem**                     | **Decidable?**               | **RE?** | Explanation                                                           |                             |
| ------------------------------------------ | ---------------------------- | ------- | --------------------------------------------------------------------- | --------------------------- |
| **HALT = { ⟨M,w⟩                           | M halts on w }**             | ✘       | ✔                                                                     | Classic halting problem.    |
| **HALT* (Does M halt on *all* inputs?)**   | ✘                            | ✘       | Totality problem.                                                     |                             |
| **ATM = { ⟨M,w⟩                            | M accepts w }**              | ✘       | ✔                                                                     | Acceptance halting problem. |
| **Complement(ATM)**                        | ✘                            | ✘       | Not Turing-recognizable.                                              |                             |
| **Equivalence of CFGs (EQUIV-CFG)**        | ✘                            | ✘       | No algorithm to compare grammar equivalence. Important for PL theory. |                             |
| **CFG Intersection Emptiness**             | ✔ for 2 CFGs (but expensive) | n/a     | But emptiness of 3+ CFL intersection is undecidable.                  |                             |
| **TM equivalence**                         | ✘                            | ✘       | No algorithm for “do these two programs do the same thing?”           |                             |
| **Type checking for full-dependent types** | ✘                            | Depends | Many dependently typed systems are *purposefully* undecidable.        |                             |





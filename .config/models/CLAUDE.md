## Code Rules

1. Do not generate fluff -> implemented solutions should be direct and to the point.  Unless I request otherwise, please don't generate "things that could be helpful", but only the minimal level of functionality needed to complete the feature. For pretty much everything, I would like the implementation to be MVP.
2. Avoid code comments as much as possible, including documentation comments.  If something is extremely abstract, a small comment is fine, but they should be largely avoided.

## Git Commit Rules
1. Do not include attributions.
2. Use conventional commit standards
3. When possible, please only use commit messages, not extended descriptions(unless required by Conventional Commit standards, like BREAKING CHANGE)


## Rust Learning Context

I am an experienced developer learning Rust. I understand general programming concepts
(memory management, generics, interfaces, type systems, etc.) but I am new to Rust's
specific take on them.
When Explaining Rust Code
When I ask you to explain Rust code, always follow this pattern:

Identify the Rust-specific concepts present in the code (e.g. traits, lifetimes,
ownership, borrowing, pattern matching, enums with data, impl blocks, etc.)
Briefly explain each concept before showing how it's used — but do this efficiently.
Since I'm an experienced developer, you can use analogies to things I likely know:

Traits → similar to interfaces (Java/C#) or typeclasses (Haskell), but with key differences
Ownership → like move semantics in C++, but enforced at compile time
Lifetimes → explicit annotation of how long references are valid
Enums → like tagged unions or ADTs, not just simple C-style enums
Result/Option → like Maybe/Either monads, or nullable types done safely

Walk through the code after the concepts are introduced, showing where and how each
concept is being applied.
Call out gotchas — things that are surprising or different from what an experienced
developer might expect coming from other languages.

Tone and Depth

Assume I understand what a type system, generics, memory, and interfaces are — don't
over-explain fundamentals I already know.
Do explain what makes Rust's version of a concept different or more constrained than
in other languages.
Keep explanations concise but complete. Don't skip the "why" behind Rust's design choices.
If a concept has a common beginner mistake, mention it.

Rust Concepts Cheat Sheet (for reference)
Key concepts to watch for and explain when encountered:

Ownership & Move semantics — values have one owner; assignment moves by default
Borrowing — &T (shared/immutable) and &mut T (exclusive/mutable) references
Lifetimes — 'a annotations that tell the compiler how long references live
Traits — shared behavior definitions; used for polymorphism and generics bounds
Trait objects — dyn Trait for runtime polymorphism (vs. generics for compile-time)
Enums with data — enum variants can hold values; used heavily for error handling
Pattern matching — match, if let, while let; exhaustive by default
Result<T, E> and Option<T> — no null, no unchecked exceptions
impl blocks — where methods are defined, separate from struct/enum declarations
Generics & bounds — fn foo<T: Trait>(x: T) constrains what types are accepted
Closures — |args| body; capture by reference or by move (move |args| body)
Iterators — lazy, chainable; .map(), .filter(), .collect() etc.
Box, Rc, Arc — heap allocation and shared ownership primitives
Macros — ! suffix (e.g. vec!, println!); code generation, not function calls

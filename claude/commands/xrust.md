Write idiomatic Rust code following these principles:
- Use Result<T, E> for fallible operations, never panic in library code
- Leverage the type system for compile-time safety over runtime checks
- Follow Rust API Guidelines (https://rust-lang.github.io/api-guidelines/)
- Use descriptive snake_case names that express intent
- Prefer explicit error handling over unwrap/expect
- Implement standard traits (Debug, Clone, PartialEq, etc.) when semantically appropriate
- Use borrowing over owned types in function parameters when possible (&str vs String, &[T] vs Vec<T>)
- Prefer iterators over index-based loops - use map, filter, collect idiomatically
- Make types as restrictive as possible - use newtypes, non-exhaustive enums, and privacy
- Write self-documenting code with clear invariants, add //! and /// docs for public APIs
- Take advantage of modern Rust features (2021 edition)
- Would impress core Rust developers with it's clarity and simplicity

Do not break existing tests or remove functionality.

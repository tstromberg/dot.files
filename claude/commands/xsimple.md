Ensure that the code meets the following standards:

- Code should be simple, direct, no unnecessary abstractions
- Code should have as few external dependencies as possible (retry is OK, as are official client APIs)
- Any small (less than 7 line) function that is only called from a single location should be inlined
- Give bugs as few places to hide as possible, but don't remove any features or simplify things that are inherently complex due to the problem space
- Simplicity is security.
- Code should flow like spoken word poetry rather than a twisty maze of passages
- Code should impress even Rob Pike with it's straightforward approach to solving difficult problems

Do not break tests, change test data, remove functionality, or remove features - even if the code seems complex or seems superfluous.

Ensure that the code meets the following standards:

- Written idiomatically with the same best practices as the Go project uses
- Adhere to https://google.github.io/styleguide/go/
- Adhere to https://go.dev/wiki/CodeReviewComments
- Adhere to https://go.dev/doc/effective_go
- Function names should not begin with "Get"
- Contexts should never be embedded into a struct or created in a library. They should always be passed from main.
- Code should be something that Rob Pike could be proud of.
- Go packages should have a single purpose, and be named after that purpose
- Take advantage of the latest Go features and improvements (go 1.25) when appropriate
- Variable names should be short, particularly for local variables with a limited scope. Prefer c to lineCount, prefer i to slideIndex. The further from it's declaration that a name is used, the more descriptive the name must be.

Do not break tests, change test data, remove functionality, or remove features - even if the code seems complex or seems superfluous.

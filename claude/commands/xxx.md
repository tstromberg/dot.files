Ensure that the code meets the following standards:

## Code Philosophy and Best Practices

- Code should be written for simplicity, scalability, security, and reliability

### On Go

- Go code should be written with best practices in a way that emulates what the Go project itself uses; prioritizing advice mentioned on go.dev
- Code should adhere to advice on https://google.github.io/styleguide/go/
- Code should adhere to advice on https://go.dev/wiki/CodeReviewComments
- Code should adhere to advice on https://go.dev/doc/effective_go
- Code should be something that Rob Pike could be proud of.
- Contexts should never be embedded into a struct or created within a library. They should always be passed from main. The only exception is if we are trying to be a drop-in replacement for an API someone else designed.

### On Reliability

- Code should not contain any bugs
- Code should be optimized for speed and resource usage, but without adding complexity
- The app/service should degrade gracefully when a dependent API call fails
- Code should be written with tests and unit testing in mind
- Tests should always pass.
- Code should have great logging to make it easier to debug and better understand the decisions it's making.

### On Security

- Look for security bugs: both obvious and subtle.
- Expect that security professionals will be inspecting and attacking this service
- Simplicity is security.

## On Lint

"make lint" should also pass without errors.

## On Simplicity

- Consider what Rob Pike would do to improve this code
- Make the code so simple that bugs have nowhere to hide.
- Code should have as few external dependencies as possible
- Any small (less than 7 line) function that is only called from a single location should be inlined
- Simplicity is security.

Do not break tests, change test data, remove functionality, or remove features - even if the code seems complex or seems superfluous.

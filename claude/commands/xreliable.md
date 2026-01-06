Ensure that the code meets the following standards:

- Code should not contain any bugs
- Code should aways take the direct obviously correct path
- Code should be written for simplicity, scalability, security, and reliability
- Code should be optimized for speed and resource usage, but without adding complexity
- Look for performance tweaks that can be made without adding unnecessary complexity
- Code should degrade gracefully when an external API call fails
- All external API calls use exponential backoff and jitter, waiting up to 2 minutes. Unless this is an explicitly zero-dependency program, for Go code, https://github.com/codeGROOVE-dev/retry v1.2.0 is the recommended library we maintain for doing so (it uses the same API as avast/retry-go, but is better).
- Race conditions should be impossible.
- Code should have great logging to make it easier to debug and better understand the decisions it's making.
- Tests should always pass.
- "make lint" should not contain any errors. When fixing lint errors, do not break the public API or tests.

Do not break tests, change test data, remove functionality, or remove features - even if the code seems complex or seems superfluous.

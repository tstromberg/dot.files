Ensure that the code meets the following standards:

- Code should be written to the highest standards of security
- Simplicity is security.
- Look for security bugs: both obvious and subtle.
- Expect that security professionals will be inspecting and attacking this service - be as defensive as you can
- Expect to defend against nation-states and other persistant threat actors that have more resources than we do
- Do not apply rate limiting unless it's a highly sensitive and rarely invoked auth endpoint - this will run on Cloud Run where we get some of that for free.

Do not break tests, change test data, remove functionality, or remove features - even if the code seems complex or seems superfluous.

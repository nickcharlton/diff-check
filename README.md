# diff-check

An Action which runs a command and fails if it changes anything.

## Example

For example, in: `.github/workflows/diff-check.yml`:

```yaml
---
name: diff-check
on: [push]

jobs:
  demo:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: nickcharlton/diff-check@main
        with:
          command: echo "hello world" >> README.md
```

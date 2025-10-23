# BATS Template

Template for Bash Automated Testing System (BATS) tests.

Based on the [BATS tutorial](https://bats-core.readthedocs.io/en/stable/tutorial.html#).

## Project Structure

```
bats-template/
├── src/                          # Source scripts to be tested
│   ├── project.sh               # Main project script (example)
│   ├── server.sh                # Echo server for network testing
│   └── helper.sh                # Helper functions
├── test/                        # Test files
│   ├── test.bats               # Main test suite
│   ├── server.bats             # Server-specific tests
│   ├── helper.bats             # Helper function tests
│   └── test_helper/            # Test helper libraries
│       ├── bats-assert/        # Assertion helpers
│       ├── bats-support/       # Support utilities
│       └── common-setup.bash   # Common test setup
└── README.md                   # This file
```

## Prerequisites

- nmap (macOS): `brew install nmap` (includes ncat)

## Usage

Run tests:
```bash
./test/bats/bin/bats test/
```

Run tests with parallel execution:
```bash
./test/bats/bin/bats --jobs 4 test/
```

Run specific test files:
```bash
./test/bats/bin/bats test/test.bats
./test/bats/bin/bats test/server.bats
```

Run tests with different output formats:
```bash
./test/bats/bin/bats --formatter tap test/
./test/bats/bin/bats --formatter junit test/
```

Filter tests by name:
```bash
./test/bats/bin/bats --filter "server" test/
```

Run only failed tests (requires previous run logs):
```bash
mkdir -p .bats/run-logs/
./test/bats/bin/bats --filter-status failed test/
```

## Scripts

- `project.sh`: Example script with welcome message
- `server.sh`: Echo server (start-echo-server, stop-echo-server)
- `helper.sh`: Utility functions

## Test Structure

```bash
@test "Test description" {
    run your_script
    assert_success
    assert_output "expected output"
}
```

## Common Assertions

- `assert_success` / `assert_failure`
- `assert_output "text"` / `assert_output --partial "text"`
- `refute_output "text"`

## Test Tags

Focus on specific tests during development:
```bash
# bats test_tags=bats:focus
@test "Some test" {
  ...
}
```

## Resources

- [BATS Core](https://github.com/bats-core/bats-core)
- [BATS Tutorial](https://bats-core.readthedocs.io/en/stable/tutorial.html#)
- [BATS Usage](https://bats-core.readthedocs.io/en/stable/usage.html)

setup() {
    load 'test_helper/common-setup'
    _common_setup
}

teardown() {
    rm -f /tmp/bats-tutorial-project-ran
}

# @test "Example 0: can run our script" {
#     # notice the missing ./
#     # As we added src/ to $PATH, we can omit the relative path to `src/project.sh`.
#     project.sh
# }

# @test "Example 1: Check exact welcome message" {
#   # run project.sh
#   # assert_output 'Welcome to our project!'
# }

get_projectsh_welcome_message() {
    project.sh  2>&1 | grep Welcome
}

@test "Example 2: Check welcome message" {
    run get_projectsh_welcome_message
    assert_output 'Welcome to our project!'
}

@test "Example 3: Check welcome message" {
    run project.sh
    assert_output --partial 'Welcome to our project!'
}

@test "Example 4: Show welcome message on first invocation" {
    run project.sh
    assert_output --partial 'Welcome to our project!'

    run project.sh
    refute_output --partial 'Welcome to our project!'
}

@test "Example 5: Skip some test" {
    if [[ -e /tmp/bats-tutorial-project-ran ]]; then
        skip 'The FIRST_RUN_FILE already exists'
    fi

    run project.sh
    assert_output --partial 'Welcome to our project!'

    run project.sh
    refute_output --partial 'Welcome to our project!'
}

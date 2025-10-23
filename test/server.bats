setup_file() {
    load 'test_helper/common-setup'
    _common_setup
    PORT=$(server.sh start-echo-server 2>&1 >/dev/null)
    export PORT
}

teardown_file() {
    server.sh stop-echo-server
}

@test "server is reachable" {
    nc -z localhost "$PORT"
}

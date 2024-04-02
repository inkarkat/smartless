#!/usr/bin/env bats

roundtrip()
{
    reverseAnsi "${1:?}" | rev | reverseAnsi | rev
}

@test "overlap changes the contents" {
    run reverseAnsi "${BATS_TEST_DIRNAME}/overlap.txt"
    [ "$status" -eq 0 ]
    [ "$output" != "$(cat "${BATS_TEST_DIRNAME}/overlap.txt")" ]
}

@test "overlap roundtrip" {
    run roundtrip "${BATS_TEST_DIRNAME}/overlap.txt"
    [ "$status" -eq 0 ]
    [ "$output" = "$(cat "${BATS_TEST_DIRNAME}/overlap.txt")" ]
}

@test "overlap2 changes the contents" {
    run reverseAnsi "${BATS_TEST_DIRNAME}/overlap2.txt"
    [ "$status" -eq 0 ]
    [ "$output" != "$(cat "${BATS_TEST_DIRNAME}/overlap2.txt")" ]
}

@test "overlap2 roundtrip" {
    run roundtrip "${BATS_TEST_DIRNAME}/overlap2.txt"
    [ "$status" -eq 0 ]
    [ "$output" = "$(cat "${BATS_TEST_DIRNAME}/overlap2.txt")" ]
}

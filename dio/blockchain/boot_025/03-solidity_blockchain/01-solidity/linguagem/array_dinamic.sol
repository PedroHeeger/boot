// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Types {

    int[] data;

    function array_example() public returns (int[] memory) {

        data = [int(-60), 70, -80, 90, 100, 140];
        return (data);
    }
}
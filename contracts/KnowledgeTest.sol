//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {

    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferAll(address payable recipient) public  {
        require(msg.sender == owner, "ONLY_OWNER");
        (bool sent, bytes memory data) = recipient.call{value: address(this).balance}("");
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string calldata s1, string calldata s2) public pure returns (string memory) {
        return string.concat(s1, s2);
    }
}


// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/** */

/** @title Raffle
 *  @author Avrakadabra
 *  @notice This contract is for creating a sample raflle
 *  @dev Implements Chainlink VRFv2.5
 */

/** @custom:experimental This is an experimental contract. */

// constant vai immutable. Jos constant niin halvoin kaasukuluilta, kun immutable niin also cheap. Jos ei tarvitse muutoksia niin immutable. ja
contract Raffle {
    /** ERRORS */
    error Raffle_SendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee;
    // @dev The duration of the lottery in seconds
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    /* Events */

    event Raffle_entered(address indexed player);

    constructor(uint256 entrancefee, uint256 interval) {
        i_entranceFee = entrancefee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        // require(msg.value >=i_entranceFee, "Not enough ETH to enter the raffle");
        if (msg.value < i_entranceFee) {
            revert Raffle_SendMoreToEnterRaffle();
        }

        s_players.push(payable(msg.sender));
        emit Raffle_entered(msg.sender);
    }

    // 1. Get a random number
    // 2. Use that random number to pick a winner
    // 3. Be automatically called

    function pickWinner() external {
        block.timestamp - lastTimeStamp > i_interval;
    }

    // Getter functions

    function getEntrancefee() external view returns (uint256) {
        return i_entranceFee;
    }
}

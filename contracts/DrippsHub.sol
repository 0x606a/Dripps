// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/utils/Counters.sol";

contract DrippsHub {
    using Counters for Counters.Counter;

    /// Event ID counter
    Counters.Counter private _eventIdCounter;

    /// Event stract
    struct Event {
        address host;
        uint capacity;
        uint time;
        string metadata;
    }

    /// Events mapping
    mapping(uint => Event) events;

    /// Participants
    mapping(uint => address) praticipants;

    function createEvent() public returns(bool) {
        ///
        _eventIdCounter.increment();
    }

    function applyEvent(uint _eventId) public returns(uint) {
        ///
    }

    function attendEvent(uint _eventId) public returns(bool) {
        ///
    }

}
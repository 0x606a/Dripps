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
        uint time;
        uint capacity;
        string metadata;
        // address[] praticipants;
    }

    /// Events mapping
    mapping(uint => Event) events;

    /// Participants
    mapping(uint => address[]) praticipants;

    function createEvent(uint _time, uint _capacity, string memory _metadata) public returns(uint) {
        
        require(_time >= block.timestamp, "ER01");
        require(_capacity > 0, "ER02");
        
        uint eventId = _eventIdCounter.current();

        events[eventId] = Event(msg.sender, _time, _capacity, _metadata);
        
        _eventIdCounter.increment();

        return eventId;
    }

    function applyEvent(uint _eventId) public returns(uint) {
        ///
    }

    function attendEvent(uint _eventId) public returns(bool) {
        ///
    }

}
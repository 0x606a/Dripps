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
        // address[] applicants;
    }

    /// Events mapping
    mapping(uint => Event) events;

    /// Participants
    mapping(uint => address[]) applicants;

    event EventCreated();
    event NewApplicant();
    event NewParticipant();

    function createEvent(uint _time, uint _capacity, string memory _metadata) public returns(uint) {
        
        require(_time >= block.timestamp, "ER01");
        require(_capacity > 0, "ER02");
        
        uint eventId = _eventIdCounter.current();

        events[eventId] = Event(msg.sender, _time, _capacity, _metadata);
        
        _eventIdCounter.increment();

        return eventId;
    }

    function applyEvent(uint _eventId) public returns(uint) {
        
        /// Check that event time is in future
        require(events[_eventId].time >= block.timestamp, "ER03");
        
        /// Check that event capacity is not reached
        uint ticketId = applicants[_eventId].length;
        require(events[_eventId].capacity > ticketId, "ER04");

        /// Check payement
        /// Apply donation

        /// Add caller to applicants list
        applicants[_eventId].push(msg.sender);

        return ticketId;
    }

    function attendEvent(uint _eventId) public returns(bool) {
        ///
    }

}
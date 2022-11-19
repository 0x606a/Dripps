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
    }

    /// Events mapping
    mapping(uint => Event) events;

    /// Applicants - those who got access token to the event
    mapping(uint => address[]) applicants;
    mapping(uint => address[]) applicants;

    /// Participants - those who presented themself on event
    mapping(uint => address[]) participants;
    
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

    function attendEvent(uint _eventId, uint _ticketId) public returns(bool) {
        
        /// Check that event time came
        require(block.timestamp > events[_eventId].time, "ER05");

        /// Check that caller is owner of _ticketId
        require(applicants[_eventId][_ticketId] == msg.sender, "ER06");

        /// Check that caller is not on participants list yet

        /// Add caller to participants list. Access to POAP minting.
        participants[_eventId].push(msg.sender);

        return true;
    }

}
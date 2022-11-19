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

    /// Currently used for apllicants count
    mapping(uint => address[]) public applicantsByTicket;
    /// TicketIds of applicants
    mapping(uint => mapping(address => uint)) public ticketsByAddr;

    /// Participants - those who presented themself on event
    // mapping(uint => address[]) participants;
    mapping(uint => mapping(address => bool)) participants;
    
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
        uint currentParticipantsAmount = applicantsByTicket[_eventId].length;
        require(events[_eventId].capacity > currentParticipantsAmount, "ER04");

        /// Check that caller is not applicant yet
        require(ticketsByAddr[_eventId][msg.sender] == uint(0), "ER05");

        /// Check payement
        /// Apply donation

        /// Add caller to applicants list
        applicantsByTicket[_eventId].push(msg.sender);
        /// Make sure TicketId count starts from 1, since it's part of our logic verification
        ticketsByAddr[_eventId][msg.sender] = currentParticipantsAmount + 1;

        /// Return ticketId
        return currentParticipantsAmount + 1;
    }

    function attendEvent(uint _eventId) public returns(bool) {
        
        /// Check that event time came
        require(block.timestamp > events[_eventId].time, "ER06");

        /// Check that caller is applicant
        require(ticketsByAddr[_eventId][msg.sender] != uint(0), "ER07");
        
        /// Check that caller is not on participants list yet
        require(!participants[_eventId][msg.sender], "ER08");

        /// Add caller to participants list (Access to POAP minting)
        participants[_eventId][msg.sender] = true;

        return true;
    }

}
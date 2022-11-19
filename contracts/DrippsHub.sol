// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract DrippsHub {
    
    /// Event ID counter

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
    }

    function applyEvent(uint _eventId) public returns(uint) {
        ///
    }

    function attendEvent(uint _eventId) public returns(bool) {
        ///
    }

}
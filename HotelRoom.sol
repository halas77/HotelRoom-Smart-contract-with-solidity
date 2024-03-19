// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Todo

// Book Function
    // - send eth
    // - check for valid eth amount
    // - check for occupy or not


contract HotelRoom {

    enum Statuses {
        Vacant,
        Occupied
    }

    address payable public owner;

    Statuses public  currentStatus;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }


    modifier onlyVacant () {
        require(currentStatus == Statuses.Vacant, "The room is already occupied.");
        _;
    }

    modifier checkAmount(uint _amount){
        require(msg.value >= _amount, "Pleaase provide effcient amount.");
        _;
    }


    function book() payable public onlyVacant checkAmount(2 ether) {
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
    }

}
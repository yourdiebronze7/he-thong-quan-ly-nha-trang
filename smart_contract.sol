// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RentalManagement {
    struct Rental {
        uint id;
        address owner;
        string details;
        bool isAvailable;
    }
    
    Rental[] internal rentals;

    event RentalRegistered(uint id, address owner, string details, bool isAvailable);

    function registerRental(string memory _details) public {
        uint rentalId = rentals.length;
        rentals.push(Rental(rentalId, msg.sender, _details, true));
        emit RentalRegistered(rentalId, msg.sender, _details, true);
    }

    function fetchRental(uint _id) public view returns (Rental memory) {
        require(_id < rentals.length, "Rental does not exist.");
        return rentals[_id];
    }

    function getTotalRentals() public view returns (uint) {
        return rentals.length;
    }
}
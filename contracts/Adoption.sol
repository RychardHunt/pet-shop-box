pragma solidity ^0.4.19;


/**
* @title Adoption
* @dev The Adoption contract allows the adoption of up to 16 pets.
*/
contract Adoption {

    /**
    * @dev Creates a record of addresses of pet adopters.
    */
    address[16] public adopters;

    /**
    * @dev Allows messenger sender to adopt a pet and updates the sender address to index of adopted pet in adopters.
    * Returns petId as confirmation of adoption.
    */
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);
        adopters[petId] = msg.sender;
        return petId;
    }

    /**
    * @dev Retrieve addresses of adopters.
    */
    function getAdopters() public view returns (address[16]) {
        return adopters;
    }







}

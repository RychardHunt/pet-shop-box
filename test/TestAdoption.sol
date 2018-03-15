pragma solidity ^0.4.19;

/**
* @dev Imports global Truffle test utilities and contract tests are being conducted on.
*/
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";


/**
* @title TestAdoption
* @dev The TestAdoption contract conducts unit tests for the Adoption contract.
*/
contract TestAdoption {

    /**
    * @dev Get already deployed contract.
    */
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    /**
    * @dev Tests the adopt() function.
    */
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(8);
        uint expected = 8;
        Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
    }

    /**
    * @dev Tests retrieval of a single pet's owner.
    */
    function testGetAdopterAddressByPetId() public {
        // Expected owner is this contract
        address expected = this;
        address adopter = adoption.adopters(8);
        Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
    }

    /**
    * @dev Tests retrieval of all pet owners.
    */
    function testGetAdopterAddressByPetIdInArray() public {
        // Expected owner is this contract
        address expected = this;
        // Store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();
        Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
    }




}

pragma solidity ^0.4.17;

contract SecretInformationTest {
    
    uint public deployTime;
    string private info;
    
    function SecretInformationTest() public {
        info = 'some secret information';
        deployTime = block.timestamp;
    }
    
    function getInformation() public view returns (string) {
        uint currentTime = block.timestamp;
        require (currentTime > deployTime + 10 seconds);
        return info;
    }
}

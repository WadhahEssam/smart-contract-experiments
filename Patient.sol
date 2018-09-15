pragma solidity ^0.4.17;

contract Patient {
    string public name;
    string[] public drugs;

    
    constructor (string patienName) public {
        name = patienName;
    }
    
    function addDrug(string drugName) public {
        drugs.push(drugName);
    }
    
}
contract Factory {
    address[] public newContracts;

    function createContract (string name) {
        address newContract = new Contract(name);
        newContracts.push(newContract);
    } 
}

contract Contract {
    string public Name;

    function Contract (string name) {
        Name = name;
    }
}
pragma solidity ^0.4.17;

contract Campaign {

    // this struct is creating a defintion only not a variable
    struct Request {
        string description; // what is this money used for
        uint value;         // the value that the manager is willing to send to the vendor
        address recipient;  // the address of the vendor
        bool complete;      // this will specify if the request has been finalized or not 
    }
        
    address public manager;
    uint public minimumContribution;
    address[] public approvers;
    Request[] public requests;
    
    modifier restrected() {
        require(msg.sender == manager);
        _;
    }
            
    constructor(uint m) public {
        manager = msg.sender;
        minimumContribution = m;
    }
    
    function contribute() public payable {
        require(msg.value >= minimumContribution);
        approvers.push(msg.sender);
    }
    
    // called by the manager to create a request for buying something
    function createRequest(string description, uint value, address recipient) public restrected {
        
        // creating instance of the struct 
        Request newRequest = Request({
           description: description,
           value: value,
           recipient: recipient,
           complete: false
        });
         
        // anther way of defining struct instances
        // Request newRequest = Request(description, value, recipient, false); // they should be in order
        
        requests.push(newRequest);
    }
    
}
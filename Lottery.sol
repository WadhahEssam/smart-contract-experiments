pragma solidity ^0.4.17;

contract Campaign {

    // this struct is creating a defintion only not a variable
    struct Request {
        string description;                     // what is this money used for
        uint value;                             // the value that the manager is willing to send to the vendor
        address recipient;                      // the address of the vendor
        bool complete;                          // this will specify if the request has been finalized or not 
        mapping(address => bool) approvals;     // mapping to get if a certin address approved a request or not
        uint approvalCount;                     // number of people who approved this request 
    }
        
    address public manager;
    uint public minimumContribution;
    mapping(address => bool) public approvers;
    uint public approversCount; 
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
        
        // adding a new mapping to approvers
        // close to javascript objects 
        approvers[msg.sender] = true; 
        approversCount++; 
    }
    
    // called by the manager to create a request for buying something
    function createRequest(string description, uint value, address recipient) public restrected {
        
        // creating instance of the struct 
        // notice that you don't have to initilize the approvals field
        // and that is because we only have to initilize the value types
        // and then we will be able to access the reference types 
        Request memory newRequest = Request({
            description: description,
            value: value,
            recipient: recipient,
            complete: false,
            approvalCount: 0
        });
         
        // anther way of defining struct instances
        // Request newRequest = Request(description, value, recipient, false); // they should be in order
        requests.push(newRequest);
    }
    
    // approvers can only vote for one time 
    // you might think that the most obvious way
    // of implementing the votes, is to put an array
    // inside the Request stuct that have all the voters 
    // and a counter of who voted for yes and anther 
    // variable to store the number of who didn't voted
    // but this is totally bad way of doing it, because 
    // you will have loop throw the whole array of approvers 
    // every time which will cost a lot of gas 
    // so we will use mappping in order to solve this 
    // cuz with mapping you don't have to loop throw elements
    function approveRequest(uint requestIndex) public {
        Request storage request = requests[requestIndex];
        
        // check weather he is one of the campaign approveRequest
        // and check if he already approved the request or not
        require(approvers[msg.sender] && !request.approvals[msg.sender] ); 
            
        // if every thing is good add him to the request approvers 
        // and increase the approvalCount by one.
        request.approvals[msg.sender] = true;
        request.approvalCount++;
    }
    
    function finalizeRequest(uint requestIndex) public restrected {
        Request storage request = requests[requestIndex]; 
        
        // make sure that the request is complete
        require(!request.complete);
        
        // make sure that at least 50% of the people have voted yes
        require(request.approvalCount > (approversCount / 2));
        
        // send the money to the vendor's address 
        request.recipient.transfer(request.value);
        
        // mark the request as complete so manager can't 
        // finalize it more than one time
        request.complete = true;        
    }
    
    // returns the current balance of the campaign
    function contributionAmount() public view returns(uint) {
        return this.balance;     
    }
    
    
}













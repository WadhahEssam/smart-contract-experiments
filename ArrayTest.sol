pragma solidity ^0.4.17;

contract ArrayTest {
    
    // the function that is generated with this element is
    // not returning the entire array
    uint[] public myArray;
    
    function ArrayTest() public {
        myArray.push(54169417);
        myArray.push(786786);
        myArray.push(786787890);
    }
    
    // this technique of retrieving back the whole array
    // works if you have simple array of ints or units or 
    // even strings, but it doesn't work with more complex
    // arrays like array of arrays or array of struct
    function getArray() public view returns (uint[]) {
        return myArray;
    }
    
    function addNumber(uint number) public {
        myArray.push(number);
    }
    
    function getArrayLength() public view returns (uint) {
        return myArray.length;
    }
    
    function getFirstElement() public view returns (uint) {
        return myArray[0];
    }
    
}

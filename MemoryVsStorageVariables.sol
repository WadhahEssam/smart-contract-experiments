pragma solidity ^0.4.17;

contract Numbers {
    int[] public numbers;
    
    constructor() public {
        numbers.push(23);
        numbers.push(20);
        
        // if you use the keyword storage this will make the 
        // variable points at the same exact place that numbers 
        // variable is pointing that means if you change
        // storageArraty numbers will change too
        int[] storage storageArray = numbers;
        
        // if you use the keyword memory this means that solidity
        // will make a copy of the numbers variable and put it 
        // in the memory and let the memoryArray reference this 
        // copy variable
        int[] memory memoryArray = numbers;
        
        // this will change the numbers sorage variable first's value
        storageArray[0] = 1;
        
        // this will not change the numbers variable instead it will change
        // only the copy that is in the memory 
        memoryArray[0] = 2;
        
        // lets do anther intersting test 
        changeArray(numbers);
        changeArray2(numbers);
        
    }
    
    function changeArray(int[] numbersArray) private {
        // by default arguments are assumed memory variables. 
        // so this modification is not going to affect the main 
        // numbers variable cuz the numbersArray is a copy of 
        // the storage numbers variable.
        numbersArray[1] = 100000;
    }
    
    function changeArray2(int[] storage numbersArray) private {
        // if you want the argumenst to be passed as a 
        // storage variables and not only a memory copy 
        // you should declare that in the function delaration 
        // so now the main numbers variable is going to change
        numbersArray[1] = 20000;
    }
    
    
    
}
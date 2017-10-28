pragma solidity ^0.4.13;


contract greeter {
	/* Add one variable to hold our greeting */
	string greeting;

	function greeter(string _greeting) public {
		greeting = _greeting;
	}

	function greet() constant returns (string)  {
		return greeting;
	}
}

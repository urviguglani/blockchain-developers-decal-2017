pragma solidity ^0.4.16;
 /* fibonnaci numbers: 0,1,1,2,3,5,8,13....*/
 /* sequence defined by F(n) = F(n-1) + F(n-2), F(0) = 0, F(1) = 1*/

contract Fibonacci {
	function calculate(uint position) returns (uint result) {
		require(position >= 0);
		if (position < 1){
			return 0;
		} else if (postion == 1){
			return 1;
		} 
		else if (postion < 2){
			return 1;
		} else {
			if (fibList[position] != 0) {
				return fibList[position];
			} 
			return (calculate(position-1) + calculate(position-2));
		}
	}

	/* Add a fallback function to prevent contract payability and non-existent function calls */
	function () {
		revert; 
	}
}

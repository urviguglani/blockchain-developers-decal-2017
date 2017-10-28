pragma solidity ^0.4.15;

import "./AuctionInterface.sol";

/** @title GoodAuction */
contract GoodAuction is AuctionInterface {
	/* New data structure, keeps track of refunds owed to ex-highest bidders */
	mapping(address => uint) refunds;

	/* Bid function, shifts to push paradigm
	 * Must return true on successful send and/or bid, bidder
	 * reassignment
	 * Must return false on failure and allow people to
	 * retrieve their funds
	 */
	function bid() payable external returns(bool) {
		if (msg.value <= highestBid){
			refunds[msg.sender] = msg.value;
			return false; 
		}

		if (highestBidder != 0){
			refunds[highestBidder] = highestBid;
		}
		highestBidder = msg.sender;
		highestBid = msg.value;
		return true; 

	}

	/* New withdraw function, shifts to push paradigm */
	function withdrawRefund() external returns(bool) {
		uint refund = refunds[msg.sender];
		refunds[msg.sender] = 0; 
		if (!msg.sender.send(refund)){
			refunds[msg.sender] = refund;
			return false;
		}
		return true; 
	}

	/* Allow users to check the amount they can withdraw */
	function getMyBalance() constant external returns(uint) {
		return refunds[msg.sender];
	}

	/* Give people their funds back */
	function () payable {
		revert();
	}
}
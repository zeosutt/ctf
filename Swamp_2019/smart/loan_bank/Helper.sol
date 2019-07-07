contract Helper {
    uint256 CONVERSION_RATE = 10**18 * 1 ether;

    function weiToToken(uint256 amount) public view returns (uint256) {
        return amount * CONVERSION_RATE;
    }

    function tokenToWei(uint256 amount) public view returns (uint256) {
        return amount / CONVERSION_RATE;
    }
}

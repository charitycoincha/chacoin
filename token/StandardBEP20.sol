// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./lib/BEP20.sol";

import "../service/ServicePayer.sol";

/**
 * @title StandardBEP20
 * @dev Implementation of the StandardBEP20
 */
contract StandardBEP20 is BEP20 {

    constructor (
        string memory name_,
        string memory symbol_,
        uint256 initialBalance_,
        address charityAddress_,
        uint transferFee_
    )
        BEP20(name_, symbol_, transferFee_, charityAddress_)
        payable
    {
        require(initialBalance_ > 0, "supply cannot be zero");

        _setupDecimals(18);
        _mint(_msgSender(), initialBalance_ * 60 / 100);
        _mint(charityAddress_, initialBalance_ * 40 / 100);
    }
}

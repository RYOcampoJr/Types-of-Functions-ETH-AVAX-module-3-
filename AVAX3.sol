// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MetaTokenCu is ERC20, ERC20Burnable, Ownable {
    uint256 public constant MAX_SUPPLY = 1000000 * (10 ** 18);
    
    constructor(address initialOwner)
        ERC20("MetaTokenCu", "MTCU")
        Ownable(initialOwner)
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= MAX_SUPPLY, "Exceeds max supply");
        _mint(to, amount);
    }

    function transferTokens(address to, uint256 amount) public {
        _transfer(_msgSender(), to, amount);
    }

    function burn(uint256 amount) public override {
    super.burn(amount);
    }
}

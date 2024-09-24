// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >0.5.0;

contract WETH {
    string public name     = "Wrapped Ether";
    string public symbol   = "WETH"; 
    uint8  public decimals = 18;
     uint256 public totalsupply;

    event  Approval(address indexed src, address indexed guy, uint wad);
    event  Transfer(address indexed src, address indexed dst, uint wad);
    event  Deposit(address indexed dst, uint wad);
    event  Withdrawal(address indexed src, uint wad);

    mapping (address => uint)                       public  balanceOf;
    mapping (address => mapping (address => uint))  public  allowance;

    receive() external  payable {
        deposit();
    }
    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    function withdraw(uint wad) public {
    require(balanceOf[msg.sender] >= wad, "Insufficient balance");
    balanceOf[msg.sender] -= wad;
    payable(msg.sender).transfer(wad); // Cast msg.sender to address payable
    emit Withdrawal(msg.sender, wad);  // Use emit keyword for events
}


    function totalSupply() public view returns (uint) {
    return address(this).balance;
}

    function approve(address guy, uint wad) public returns (bool) {
        allowance[msg.sender][guy] = wad;
        emit Approval(msg.sender, guy, wad);  
        return true;
    }

     // --- Math ---
    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x);
    }
    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x);
    }

    function mint(address usr, uint wad) external  {
        balanceOf[usr] = add(balanceOf[usr], wad);
        totalsupply    = add(totalsupply, wad);
        emit Transfer(address(0), usr, wad);
    }

    function transfer(address dst, uint wad) public returns (bool) {
        return transferFrom(msg.sender, dst, wad);
    }

    function transferFrom(address src, address dst, uint wad)
    public
    returns (bool)
{
    require(balanceOf[src] >= wad, "Insufficient balance");

    if (src != msg.sender && allowance[src][msg.sender] != type(uint256).max) {
        require(allowance[src][msg.sender] >= wad, "Allowance exceeded");
        allowance[src][msg.sender] -= wad;
    }

    balanceOf[src] -= wad;
    balanceOf[dst] += wad;

    emit Transfer(src, dst, wad);  // Use emit keyword for events

    return true;
}

}
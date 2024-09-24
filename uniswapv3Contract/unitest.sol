// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >0.7.0;
import 'uniswapv3Contract/v3-periphery/TransferHelper.sol';
import 'uniswapv3Contract/IUniswapV3Pool.sol';
import './ERC721Permit.sol';

contract uniexample {

  
  address public immutable DAI = 0xdBEFf2ff97C176Fc891148cf2c4169CdcC38eF52;
  address public immutable WETH = 0x45373635641f5C51bf1029FdF2A225674D61AD45 ;

      uint24 public constant poolFee = 3000;
struct MintParams {
        address token0;
        address token1;
        uint24 fee;
        int24 tickLower;
        int24 tickUpper;
        uint256 amount0Desired;
        uint256 amount1Desired;
        uint256 amount0Min;
        uint256 amount1Min;
        address recipient;
        uint256 deadline;
    }
      function mintNewPosition( uint256 amount0ToMint, uint256 amount1ToMint)
        external
       
    {
      

        // transfer tokens to contract
        TransferHelper.safeTransferFrom(DAI, msg.sender, address(this), amount0ToMint);
        TransferHelper.safeTransferFrom(WETH, msg.sender, address(this), amount1ToMint);
         


       
    }

    // function mint(MintParams calldata params)
    //     external
    //     payable
    //     override
    //     // checkDeadline(params.deadline)
    //     returns (
    //         uint256 tokenId,
    //         uint128 liquidity,
    //         uint256 amount0,
    //         uint256 amount1
    //     )
    // {
        // IUniswapV3Pool pool;
        // (liquidity, amount0, amount1, pool) = addLiquidity(
        //     AddLiquidityParams({
        //         token0: params.token0,
        //         token1: params.token1,
        //         fee: params.fee,
        //         recipient: address(this),
        //         tickLower: params.tickLower,
        //         tickUpper: params.tickUpper,
        //         amount0Desired: params.amount0Desired,
        //         amount1Desired: params.amount1Desired,
        //         amount0Min: params.amount0Min,
        //         amount1Min: params.amount1Min
        //     })
        // );

    //    _mint(params.recipient, (tokenId = _nextId++));
    // }




 




}


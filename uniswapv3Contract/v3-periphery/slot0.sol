// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'uniswapv3Contract/IUniswapV3Pool.sol';

contract UniswapV3Helper {
    IUniswapV3Pool public pool;

    constructor(address _pool) {
        pool = IUniswapV3Pool(_pool);
    }

    /**
     * @notice Retrieves the current sqrtPriceX96 from the pool's slot0
     * @return sqrtPriceX96 The current sqrt price as a Q64.96 fixed-point number
     */
    function getSqrtPriceX96() external view returns (uint160) {
        (uint160 sqrtPriceX96, , , , , , ) = pool.slot0();
        return sqrtPriceX96;
    }

    /**
     * @notice Retrieves multiple fields from the pool's slot0
     * @return tick Current tick of the pool
     * @return feeProtocol Current fee protocol
     */
    function getTickAndFeeProtocol() external view returns (int24 tick, uint8 feeProtocol) {
        (, int24 _tick, , , , uint8 _feeProtocol, ) = pool.slot0();
        return (_tick, _feeProtocol);
    }

   
    function getAllSlot0() external view returns (
        uint160 sqrtPriceX96,
        int24 tick,
        uint16 observationIndex,
        uint16 observationCardinality,
        uint16 observationCardinalityNext,
        uint8 feeProtocol,
        bool unlocked
    ) {
        return pool.slot0();
    }
}

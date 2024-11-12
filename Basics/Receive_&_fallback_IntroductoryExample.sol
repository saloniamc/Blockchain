//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FallbackExample {
    uint256 public result;

    // will be trigerred if we click transact from low level interactons **without passing any parameter to calldata

    receive() external payable {
        result = 1;
    }

    // when sent with some data into call data, fallback executes
     fallback() external payable {
        result = 2;
    }
}

// Ether is sent to contract
//                       is msg.data empty?
//                          /      \
//                        YES       NO
//                        /          \
//            receive() present?      fallback() will execute
//                  /      \
//                YES       NO
//                /          \
//            receive()       fallback()
//          will execute      will execute


// The receive function is specifically designed to handle Ether transfers without data and is automatically 
// invoked when Ether. The fallback function is used for handling calls with data or when the receive function is
// not defined. The fallback function can also handle Ether transfers with data.
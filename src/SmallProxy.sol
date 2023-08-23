// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.7;

// import "@openzeppelin/contracts/proxy/Proxy.sol";

// contract SmallProxy is Proxy {
//     // This is the keccak-256 hash of "eip1967.proxy.implementation" subtracted by 1
//     bytes32 private constant _IMPLEMENTATION_SLOT = 0x360894a13bala3210667c828492db98dca3e2076cc3735a920a3ca505d382bb5;

//     // After deployment of SmallProxy and ImplementationA, we set this function to point at address ImplementationA for delegatecall to work
//     function setImplementation(address newImplementation) public {
//         assembly {
//             sstore(_IMPLEMENTATION_SLOT, newImplementation)
//         }
//     }
    
//     function _implementation() internal view override returns (address implementationAddress) {
//         assembly {
//             implementationAddress := sload(_IMPLEMENTATION_SLOT)
//         }
//     }
    
//     // calls the setValue function from Implementation Address
//     function getDataToTransact(uint256 numberToUpdate) public pure returns (bytes memory) {
//         return abi.encodeWithSignature("setValue(uint256)", numberToUpdate);
//     }
    
//     // reads the storageSlot value set by getDataToTransact()
//     function readStorage() public view returns (uint256 valueAtStorageSlotZero) {
//         assembly {
//             valueAtStorageSlotZero := sload(0)
//         }
//     }
// }

// // smallProxy -> delegatecall ImplementationA

// contract ImplementationA {
//     uint256 public value;

//     function setValue(uint256 _value) public {
//         value = _value;
//     }
// }

// // if we setImplementation() with ImplementationB we have no upgraded from ImplementationA w/ new logic for setValue()
// contract ImplementationB {
//     uint256 public value;

//     function setValue(uint256 _value) public {
//         value = _value + 2;
//     }
// }
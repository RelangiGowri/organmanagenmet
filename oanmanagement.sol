// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract  DocumentVerification{
    struct Application{
        address owner;
         string documentHash;
        bool isverified;
    }
mapping(string=>Application)public applications;

event Documentverify(string documentHash);
       
function submitDocument(string memory documentHash)public {
    applications[documentHash]=Application(msg.sender,documentHash,false);
}
function verifyDocument(string memory documentHash,address user)public
    {
    require(applications[documentHash].owner==user,"Document not found");
    applications[documentHash].isverified=true;
    emit Documentverify(documentHash);
}
}
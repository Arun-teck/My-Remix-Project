// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
contract IPFSStorage{
    string public fileName;
    string public fileCID;
    address public uploader;   

    event FileUploaded(address indexed uploader, string name, string cid);   
    
function uploadFile(string memory _name, string memory _CID) public {
    fileName = _name;
    fileCID = _CID;   
    uploader = msg.sender;   
    emit FileUploaded(uploader,fileName,fileCID);
    }
    function getFile() public view returns (string memory,string memory,address) {
        return(fileName,fileCID,uploader);
}

}
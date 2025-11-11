// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

contract VotingSystem {
    struct Candidate{
        string name;
        uint voteCount;
    }

    mapping(address => bool)public hasVoted;
    Candidate[] public candidates;
    address public admin;

    event VoteCated(address indexed voter, string candidateName);

    constructor(string[] memory candidateNames){
        admin = msg.sender;
        for(uint i = 0; i < candidateNames.length; i++){
            candidates.push(Candidate(candidateNames[i],0));
        }
    }
    function vote(uint candidateIndex) public {
        require(!hasVoted[msg.sender],"Already voted!");
        require(candidateIndex < candidates.length, "Invalid candidate!");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount += 1;

        emit VoteCated(msg.sender, candidates[candidateIndex].name);
    }
    function getCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }
    function getWinner() public view returns (string memory winnerName, uint winnerVotes) {
    uint max = 0;
    uint winnerIndex = 0;
    for (uint i = 0; i < candidates.length; i++) {
        if (candidates[i].voteCount > max) {
            max = candidates[i].voteCount;
            winnerIndex = i;
        }
    }
    return (candidates[winnerIndex].name, candidates[winnerIndex].voteCount);
  }
}
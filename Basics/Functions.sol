 // storage variable
    uint256 public favouriteNumber;

    // uint256 public favouriteNumber;  changes the favorite numbers's visibility to public
    // uint256 favouriteNumber  is same as uint256 internal favouriteNumber;
    // This function changes the "state" of the blockchain

    function store(uint256 _favouriteNumber) public{
        favouriteNumber = _favouriteNumber;
    }


    // view, pure : notates functions that you dont actually have to send transaction to call them 
    // hence we dont need to spend any gas. 
    // view function : means we are juust going to read the "state" from the blockchain and not 
    //changing the "state"

    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }


    // pure keyword disallows from updating state as well as  even redaing from the state or storage
    //  return favouriteNumber; wont be allowed here as it it is reading from the favorite number 
    // and reading is not allowed in pure func.

    function retrievepure() public pure returns(uint256){
        return 7;      
    }


    // but when another function calls this retrieve function it costs gas .
     function storeCheck(uint256 _favouriteNumber) public{
        favouriteNumber = _favouriteNumber;
        retrieve();
    }
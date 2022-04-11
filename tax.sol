// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract taxx {

    struct record{
        uint _id;
        string _firstname;
        string _lastname;
        uint _asset;
        uint _taxdue;
    }

    record[] tax;
    uint recordcount=0;
    uint tdue=0;
    address owner;
    
    function taxdue(uint ass) private returns(uint) {
        tdue=0;
        if (ass>=200000) {
            if (ass>=1000000) {
                tdue=tdue+((ass-1000000))/5;
            }
            tdue=tdue+((ass-200000))/20;
        }
        return tdue;
    }
 
    function addrecord(string memory _firstname,string memory _lastname,uint _asset) public {
        uint dues = taxdue(_asset);
         tax.push(record(recordcount,_firstname,_lastname,_asset,dues));
        recordcount+=1;
    }
    

    function checkTaxDue(uint _count) public view returns(uint) {
        return tax[_count]._taxdue;
    }


    
}
/*
ETH/USD price ticker leveraging CryptoCompare API
This contract keeps in storage an updated ETH/USD price,
which is updated every 10 minutes.
*/
pragma solidity ^0.4.1;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";
/*
"oraclize_" prepended methods indicate inheritance from "usingOraclize"
*/
contract EthUsdPriceTicker is usingOraclize {
uint public ethUsd;
event newOraclizeQuery(string description);
event newCallbackResult(string result);
function EthUsdPriceTicker() payable {
// signals TLSN proof generation and storage on IPFS
oraclize_setProof(proofType_TLSNotary | proofStorage_IPFS);
// requests query
queryTicker();
}
function __callback(bytes32 _queryId, string _result, bytes _proof) public {
if (msg.sender != oraclize_cbAddress()) throw;
newCallbackResult(_result);
/*
* Parse the result string into an unsigned integer for on-chain use.
* Uses inherited "parseInt" helper from "usingOraclize", allowing for
* a string result such as "123.45" to be converted to uint 12345.
*/
ethUsd = parseInt(_result, 2);
// called from callback since we're polling the price
queryTicker();
}
function queryTicker() public payable {
if (oraclize_getPrice("URL") > this.balance) {
newOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
} else {
newOraclizeQuery("Oraclize query was sent, standing by for the answer...");
// query params are (delay in seconds, datasource type,
// datasource argument)
// specifies JSONPath, to fetch specific portion of JSON API result
oraclize_query(60 , "URL","json(https://min-api.cryptocompare.com/data/price?\fsym=ETH&tsyms=USD,EUR,GBP).USD");
}
}
}
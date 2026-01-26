# Deploy AuctionNoble and NobleBurner
deploy rpc key:
    forge script script/DeployAuctionNoble.s.sol --rpc-url {{rpc}} --private-key {{key}} --broadcast -vvv

# Set ETHERSCAN_API_KEY in your environment for verification
deploy-and-verify rpc key:
    forge script script/DeployAuctionNoble.s.sol --rpc-url {{rpc}} --private-key {{key}} --verify --broadcast -vvv

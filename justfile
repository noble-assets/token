set dotenv-load

# Deploy AuctionNoble
deploy:
    forge script script/DeployAuctionNoble.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast -vvv

# Set ETHERSCAN_API_KEY in your environment for verification
deploy-and-verify:
    forge script script/DeployAuctionNoble.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --verify --broadcast -vvv

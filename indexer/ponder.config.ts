import { createConfig } from "ponder";

import { NobleAbi } from "./abis/Noble";

export default createConfig({
  chains: { mainnet: { id: 1, rpc: process.env.PONDER_RPC_URL_1 } },
  contracts: {
    Noble: {
      abi: NobleAbi,
      address: "0xe995e5A3A4BF15498246D7620CA39f7409397326",
      chain: "mainnet",
      startBlock: 23290998,
    },
  },
});

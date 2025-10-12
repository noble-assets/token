import { ponder } from "ponder:registry";
import { transfer } from "ponder:schema";

ponder.on("Noble:Transfer", async ({ context, event }) => {
  await context.db.insert(transfer).values({
    id: event.id,
    transaction: event.transaction.hash,
    block: Number(event.block.number),

    sender: event.args.from,
    recipient: event.args.to,
    amount: event.args.value / 10n ** 18n,
  });
});

import { onchainTable } from "ponder";

export const transfer = onchainTable("transfer", (t) => ({
  id: t.text().primaryKey(),
  transaction: t.hex().notNull(),
  block: t.integer().notNull(),

  sender: t.hex().notNull(),
  recipient: t.hex().notNull(),
  amount: t.bigint().notNull(),
}));

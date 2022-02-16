/*
  Warnings:

  - You are about to drop the `CheckList` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CheckList_checkpoints` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "CheckList";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_CheckList_checkpoints";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "_Check_checkpoints" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    FOREIGN KEY ("A") REFERENCES "Check" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("B") REFERENCES "CheckPoint" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_Check_checkpoints_AB_unique" ON "_Check_checkpoints"("A", "B");

-- CreateIndex
CREATE INDEX "_Check_checkpoints_B_index" ON "_Check_checkpoints"("B");

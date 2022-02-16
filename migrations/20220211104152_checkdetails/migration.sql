/*
  Warnings:

  - You are about to drop the `_Check_checkpoints` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CheckedDetail_check` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX "_Check_checkpoints_B_index";

-- DropIndex
DROP INDEX "_Check_checkpoints_AB_unique";

-- DropIndex
DROP INDEX "_CheckedDetail_check_B_index";

-- DropIndex
DROP INDEX "_CheckedDetail_check_AB_unique";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_Check_checkpoints";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_CheckedDetail_check";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "_Check_checkPoints" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    FOREIGN KEY ("A") REFERENCES "Check" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("B") REFERENCES "CheckPoint" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_CheckedDetail_checkPoints" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    FOREIGN KEY ("A") REFERENCES "CheckPoint" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("B") REFERENCES "CheckedDetail" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_CheckedDetail" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" DATETIME,
    "readingMain" INTEGER,
    "readingGen" INTEGER,
    "worksDone" TEXT NOT NULL DEFAULT '',
    "check" INTEGER,
    "user" INTEGER,
    "equipment" INTEGER,
    CONSTRAINT "CheckedDetail_check_fkey" FOREIGN KEY ("check") REFERENCES "Check" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "CheckedDetail_user_fkey" FOREIGN KEY ("user") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "CheckedDetail_equipment_fkey" FOREIGN KEY ("equipment") REFERENCES "CraneEquipment" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_CheckedDetail" ("date", "equipment", "id", "readingGen", "readingMain", "user", "worksDone") SELECT "date", "equipment", "id", "readingGen", "readingMain", "user", "worksDone" FROM "CheckedDetail";
DROP TABLE "CheckedDetail";
ALTER TABLE "new_CheckedDetail" RENAME TO "CheckedDetail";
CREATE INDEX "CheckedDetail_check_idx" ON "CheckedDetail"("check");
CREATE INDEX "CheckedDetail_user_idx" ON "CheckedDetail"("user");
CREATE INDEX "CheckedDetail_equipment_idx" ON "CheckedDetail"("equipment");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "_Check_checkPoints_AB_unique" ON "_Check_checkPoints"("A", "B");

-- CreateIndex
CREATE INDEX "_Check_checkPoints_B_index" ON "_Check_checkPoints"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CheckedDetail_checkPoints_AB_unique" ON "_CheckedDetail_checkPoints"("A", "B");

-- CreateIndex
CREATE INDEX "_CheckedDetail_checkPoints_B_index" ON "_CheckedDetail_checkPoints"("B");

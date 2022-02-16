/*
  Warnings:

  - You are about to drop the `_CheckPoint_checkPointGroups` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX "_CheckPoint_checkPointGroups_B_index";

-- DropIndex
DROP INDEX "_CheckPoint_checkPointGroups_AB_unique";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_CheckPoint_checkPointGroups";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_CheckPoint" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL DEFAULT '',
    "checkPointGroups" INTEGER,
    CONSTRAINT "CheckPoint_checkPointGroups_fkey" FOREIGN KEY ("checkPointGroups") REFERENCES "CheckPointGroup" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_CheckPoint" ("id", "name") SELECT "id", "name" FROM "CheckPoint";
DROP TABLE "CheckPoint";
ALTER TABLE "new_CheckPoint" RENAME TO "CheckPoint";
CREATE INDEX "CheckPoint_checkPointGroups_idx" ON "CheckPoint"("checkPointGroups");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

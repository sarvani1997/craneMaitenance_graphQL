/*
  Warnings:

  - You are about to drop the column `checkPointGroups` on the `CheckPoint` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "Part" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL DEFAULT ''
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_CheckPoint" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL DEFAULT '',
    "checkPointGroup" INTEGER,
    CONSTRAINT "CheckPoint_checkPointGroup_fkey" FOREIGN KEY ("checkPointGroup") REFERENCES "CheckPointGroup" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_CheckPoint" ("id", "name") SELECT "id", "name" FROM "CheckPoint";
DROP TABLE "CheckPoint";
ALTER TABLE "new_CheckPoint" RENAME TO "CheckPoint";
CREATE INDEX "CheckPoint_checkPointGroup_idx" ON "CheckPoint"("checkPointGroup");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

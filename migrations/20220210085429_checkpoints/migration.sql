-- CreateTable
CREATE TABLE "CheckPointGroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL DEFAULT ''
);

-- CreateTable
CREATE TABLE "CheckPoint" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL DEFAULT ''
);

-- CreateTable
CREATE TABLE "_CheckPoint_checkPointGroups" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    FOREIGN KEY ("A") REFERENCES "CheckPoint" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("B") REFERENCES "CheckPointGroup" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_CheckPoint_checkPointGroups_AB_unique" ON "_CheckPoint_checkPointGroups"("A", "B");

-- CreateIndex
CREATE INDEX "_CheckPoint_checkPointGroups_B_index" ON "_CheckPoint_checkPointGroups"("B");

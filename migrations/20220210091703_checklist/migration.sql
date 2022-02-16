-- CreateTable
CREATE TABLE "CheckList" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "check" INTEGER,
    CONSTRAINT "CheckList_check_fkey" FOREIGN KEY ("check") REFERENCES "Check" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_CheckList_checkpoints" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    FOREIGN KEY ("A") REFERENCES "CheckList" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("B") REFERENCES "CheckPoint" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE INDEX "CheckList_check_idx" ON "CheckList"("check");

-- CreateIndex
CREATE UNIQUE INDEX "_CheckList_checkpoints_AB_unique" ON "_CheckList_checkpoints"("A", "B");

-- CreateIndex
CREATE INDEX "_CheckList_checkpoints_B_index" ON "_CheckList_checkpoints"("B");

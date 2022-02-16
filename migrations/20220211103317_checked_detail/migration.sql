-- CreateTable
CREATE TABLE "CheckedDetail" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" DATETIME,
    "readingMain" INTEGER,
    "readingGen" INTEGER,
    "worksDone" TEXT NOT NULL DEFAULT '',
    "user" INTEGER,
    "equipment" INTEGER,
    CONSTRAINT "CheckedDetail_user_fkey" FOREIGN KEY ("user") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "CheckedDetail_equipment_fkey" FOREIGN KEY ("equipment") REFERENCES "CraneEquipment" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_CheckedDetail_check" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    FOREIGN KEY ("A") REFERENCES "Check" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("B") REFERENCES "CheckedDetail" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE INDEX "CheckedDetail_user_idx" ON "CheckedDetail"("user");

-- CreateIndex
CREATE INDEX "CheckedDetail_equipment_idx" ON "CheckedDetail"("equipment");

-- CreateIndex
CREATE UNIQUE INDEX "_CheckedDetail_check_AB_unique" ON "_CheckedDetail_check"("A", "B");

-- CreateIndex
CREATE INDEX "_CheckedDetail_check_B_index" ON "_CheckedDetail_check"("B");

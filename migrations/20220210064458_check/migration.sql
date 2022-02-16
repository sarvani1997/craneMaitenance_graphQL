-- CreateTable
CREATE TABLE "Check" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL DEFAULT '',
    "checkHours" INTEGER,
    "checkDays" INTEGER,
    "shutdownRequired" BOOLEAN NOT NULL DEFAULT false
);

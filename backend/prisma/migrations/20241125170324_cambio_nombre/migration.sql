/*
  Warnings:

  - You are about to drop the `princesa_princeso` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "princesa_princeso" DROP CONSTRAINT "princesa_princeso_id_princesa_fkey";

-- DropForeignKey
ALTER TABLE "princesa_princeso" DROP CONSTRAINT "princesa_princeso_id_principe_fkey";

-- DropTable
DROP TABLE "princesa_princeso";

-- CreateTable
CREATE TABLE "princesa_principe" (
    "id_princesa" INTEGER NOT NULL,
    "id_principe" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "princesa_principe_id_princesa_id_principe_key" ON "princesa_principe"("id_princesa", "id_principe");

-- AddForeignKey
ALTER TABLE "princesa_principe" ADD CONSTRAINT "princesa_principe_id_princesa_fkey" FOREIGN KEY ("id_princesa") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesa_principe" ADD CONSTRAINT "princesa_principe_id_principe_fkey" FOREIGN KEY ("id_principe") REFERENCES "Principe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

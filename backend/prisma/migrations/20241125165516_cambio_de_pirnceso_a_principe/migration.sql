/*
  Warnings:

  - You are about to drop the column `id_princeso` on the `princesa_princeso` table. All the data in the column will be lost.
  - You are about to drop the `Princeso` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[id_princesa,id_principe]` on the table `princesa_princeso` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id_principe` to the `princesa_princeso` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "princesa_princeso" DROP CONSTRAINT "princesa_princeso_id_princeso_fkey";

-- DropIndex
DROP INDEX "princesa_princeso_id_princesa_id_princeso_key";

-- AlterTable
ALTER TABLE "princesa_princeso" DROP COLUMN "id_princeso",
ADD COLUMN     "id_principe" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Princeso";

-- CreateTable
CREATE TABLE "Principe" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "origen" TEXT NOT NULL,
    "virtud" TEXT NOT NULL,
    "habilidad" TEXT NOT NULL,
    "alias" TEXT NOT NULL,

    CONSTRAINT "Principe_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "princesa_princeso_id_princesa_id_principe_key" ON "princesa_princeso"("id_princesa", "id_principe");

-- AddForeignKey
ALTER TABLE "princesa_princeso" ADD CONSTRAINT "princesa_princeso_id_principe_fkey" FOREIGN KEY ("id_principe") REFERENCES "Principe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

/*
  Warnings:

  - You are about to drop the column `nemesis` on the `Princesa` table. All the data in the column will be lost.
  - You are about to drop the column `origen` on the `Princesa` table. All the data in the column will be lost.
  - Added the required column `cuento` to the `Princesa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `precio` to the `Princesa` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Princesa" DROP COLUMN "nemesis",
DROP COLUMN "origen",
ADD COLUMN     "cuento" TEXT NOT NULL,
ADD COLUMN     "precio" TEXT NOT NULL;

/*
  Warnings:

  - Changed the type of `precio` on the `Princesa` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "Princesa" DROP COLUMN "precio",
ADD COLUMN     "precio" INTEGER NOT NULL;

/*
  Warnings:

  - Changed the type of `habilidad` on the `Principe` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "Principe" DROP COLUMN "habilidad",
ADD COLUMN     "habilidad" INTEGER NOT NULL;

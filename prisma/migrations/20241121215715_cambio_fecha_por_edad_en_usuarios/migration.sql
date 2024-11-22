/*
  Warnings:

  - You are about to drop the column `fecha_de_nacimiento` on the `Usuario` table. All the data in the column will be lost.
  - Added the required column `edad` to the `Usuario` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Usuario" DROP COLUMN "fecha_de_nacimiento",
ADD COLUMN     "edad" INTEGER NOT NULL,
ALTER COLUMN "cantidad_de_princesas" SET DEFAULT 0;

/*
  Warnings:

  - The primary key for the `princesas_principes` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `princesas_principes` table. All the data in the column will be lost.
  - The primary key for the `princesas_villanos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `princesas_villanos` table. All the data in the column will be lost.
  - The primary key for the `usuarios_principes` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `usuarios_principes` table. All the data in the column will be lost.
  - The primary key for the `usuarios_villanos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `usuarios_villanos` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[princesa_id,principe_id]` on the table `princesas_principes` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[princesa_id,villano_id]` on the table `princesas_villanos` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[usuario_id,principe_id]` on the table `usuarios_principes` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[usuario_id,villano_id]` on the table `usuarios_villanos` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "princesas_principes" DROP CONSTRAINT "princesas_principes_princesa_id_fkey";

-- DropForeignKey
ALTER TABLE "princesas_principes" DROP CONSTRAINT "princesas_principes_principe_id_fkey";

-- DropForeignKey
ALTER TABLE "princesas_villanos" DROP CONSTRAINT "princesas_villanos_princesa_id_fkey";

-- DropForeignKey
ALTER TABLE "princesas_villanos" DROP CONSTRAINT "princesas_villanos_villano_id_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_principes" DROP CONSTRAINT "usuarios_principes_principe_id_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_principes" DROP CONSTRAINT "usuarios_principes_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_villanos" DROP CONSTRAINT "usuarios_villanos_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_villanos" DROP CONSTRAINT "usuarios_villanos_villano_id_fkey";

-- AlterTable
ALTER TABLE "princesas_principes" DROP CONSTRAINT "princesas_principes_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "princesas_principes_pkey" PRIMARY KEY ("princesa_id", "principe_id");

-- AlterTable
ALTER TABLE "princesas_villanos" DROP CONSTRAINT "princesas_villanos_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "princesas_villanos_pkey" PRIMARY KEY ("princesa_id", "villano_id");

-- AlterTable
ALTER TABLE "usuarios_principes" DROP CONSTRAINT "usuarios_principes_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "usuarios_principes_pkey" PRIMARY KEY ("usuario_id", "principe_id");

-- AlterTable
ALTER TABLE "usuarios_villanos" DROP CONSTRAINT "usuarios_villanos_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "usuarios_villanos_pkey" PRIMARY KEY ("usuario_id", "villano_id");

-- CreateIndex
CREATE UNIQUE INDEX "princesas_principes_princesa_id_principe_id_key" ON "princesas_principes"("princesa_id", "principe_id");

-- CreateIndex
CREATE UNIQUE INDEX "princesas_villanos_princesa_id_villano_id_key" ON "princesas_villanos"("princesa_id", "villano_id");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_principes_usuario_id_principe_id_key" ON "usuarios_principes"("usuario_id", "principe_id");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_villanos_usuario_id_villano_id_key" ON "usuarios_villanos"("usuario_id", "villano_id");

-- AddForeignKey
ALTER TABLE "usuarios_principes" ADD CONSTRAINT "usuarios_principes_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_principes" ADD CONSTRAINT "usuarios_principes_principe_id_fkey" FOREIGN KEY ("principe_id") REFERENCES "Principe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_villanos" ADD CONSTRAINT "usuarios_villanos_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_villanos" ADD CONSTRAINT "usuarios_villanos_villano_id_fkey" FOREIGN KEY ("villano_id") REFERENCES "Villano"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_villanos" ADD CONSTRAINT "princesas_villanos_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_villanos" ADD CONSTRAINT "princesas_villanos_villano_id_fkey" FOREIGN KEY ("villano_id") REFERENCES "Villano"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_principes" ADD CONSTRAINT "princesas_principes_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_principes" ADD CONSTRAINT "princesas_principes_principe_id_fkey" FOREIGN KEY ("principe_id") REFERENCES "Principe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

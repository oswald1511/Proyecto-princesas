/*
  Warnings:

  - The primary key for the `usuarios_princesas` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `usuarios_princesas` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[usuario_id,princesa_id]` on the table `usuarios_princesas` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Usuario" ALTER COLUMN "imagen" SET DEFAULT 'https://i.postimg.cc/pXN36BZt/DALL-E-2024-12-06-01-16-02-Pixel-art-of-a-simple-circular-default-profile-picture-featuring-a-gra.webp';

-- AlterTable
ALTER TABLE "usuarios_princesas" DROP CONSTRAINT "usuarios_princesas_pkey",
DROP COLUMN "id";

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_princesas_usuario_id_princesa_id_key" ON "usuarios_princesas"("usuario_id", "princesa_id");

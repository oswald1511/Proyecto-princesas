/*
  Warnings:

  - You are about to drop the `UsuarioPrincesa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `princesa_principe` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `princesa_villano` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `usuario_principe` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `usuario_villano` table. If the table is not empty, all the data it contains will be lost.
  - Changed the type of `habilidad` on the `Princesa` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "UsuarioPrincesa" DROP CONSTRAINT "UsuarioPrincesa_princesa_id_fkey";

-- DropForeignKey
ALTER TABLE "UsuarioPrincesa" DROP CONSTRAINT "UsuarioPrincesa_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "princesa_principe" DROP CONSTRAINT "princesa_principe_id_principe_fkey";

-- DropForeignKey
ALTER TABLE "princesa_principe" DROP CONSTRAINT "princesa_principe_princesa_id_fkey";

-- DropForeignKey
ALTER TABLE "princesa_villano" DROP CONSTRAINT "princesa_villano_id_villano_fkey";

-- DropForeignKey
ALTER TABLE "princesa_villano" DROP CONSTRAINT "princesa_villano_princesa_id_fkey";

-- DropForeignKey
ALTER TABLE "usuario_principe" DROP CONSTRAINT "usuario_principe_id_principe_fkey";

-- DropForeignKey
ALTER TABLE "usuario_principe" DROP CONSTRAINT "usuario_principe_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "usuario_villano" DROP CONSTRAINT "usuario_villano_id_villano_fkey";

-- DropForeignKey
ALTER TABLE "usuario_villano" DROP CONSTRAINT "usuario_villano_usuario_id_fkey";

-- AlterTable
ALTER TABLE "Princesa" DROP COLUMN "habilidad",
ADD COLUMN     "habilidad" INTEGER NOT NULL;

-- DropTable
DROP TABLE "UsuarioPrincesa";

-- DropTable
DROP TABLE "princesa_principe";

-- DropTable
DROP TABLE "princesa_villano";

-- DropTable
DROP TABLE "usuario_principe";

-- DropTable
DROP TABLE "usuario_villano";

-- CreateTable
CREATE TABLE "usuarios_princesas" (
    "id" SERIAL NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "princesa_id" INTEGER NOT NULL,

    CONSTRAINT "usuarios_princesas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuarios_principes" (
    "id" SERIAL NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "principe_id" INTEGER NOT NULL,

    CONSTRAINT "usuarios_principes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuarios_villanos" (
    "id" SERIAL NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "villano_id" INTEGER NOT NULL,

    CONSTRAINT "usuarios_villanos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "princesas_villanos" (
    "id" SERIAL NOT NULL,
    "princesa_id" INTEGER NOT NULL,
    "villano_id" INTEGER NOT NULL,

    CONSTRAINT "princesas_villanos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "princesas_principes" (
    "id" SERIAL NOT NULL,
    "princesa_id" INTEGER NOT NULL,
    "principe_id" INTEGER NOT NULL,

    CONSTRAINT "princesas_principes_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "usuarios_princesas" ADD CONSTRAINT "usuarios_princesas_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_princesas" ADD CONSTRAINT "usuarios_princesas_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_principes" ADD CONSTRAINT "usuarios_principes_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_principes" ADD CONSTRAINT "usuarios_principes_principe_id_fkey" FOREIGN KEY ("principe_id") REFERENCES "Principe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_villanos" ADD CONSTRAINT "usuarios_villanos_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_villanos" ADD CONSTRAINT "usuarios_villanos_villano_id_fkey" FOREIGN KEY ("villano_id") REFERENCES "Villano"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_villanos" ADD CONSTRAINT "princesas_villanos_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Villano"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_villanos" ADD CONSTRAINT "princesas_villanos_villano_id_fkey" FOREIGN KEY ("villano_id") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_principes" ADD CONSTRAINT "princesas_principes_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_principes" ADD CONSTRAINT "princesas_principes_principe_id_fkey" FOREIGN KEY ("principe_id") REFERENCES "Principe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

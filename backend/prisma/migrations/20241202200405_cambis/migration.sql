/*
  Warnings:

  - You are about to drop the column `id_princesa` on the `princesa_principe` table. All the data in the column will be lost.
  - You are about to drop the column `id_princesa` on the `princesa_villano` table. All the data in the column will be lost.
  - You are about to drop the column `id_usuario` on the `usuario_principe` table. All the data in the column will be lost.
  - You are about to drop the column `id_usuario` on the `usuario_villano` table. All the data in the column will be lost.
  - You are about to drop the `usuario_princesa` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `princesa_id` to the `princesa_principe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `princesa_id` to the `princesa_villano` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuario_id` to the `usuario_principe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuario_id` to the `usuario_villano` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "princesa_principe" DROP CONSTRAINT "princesa_principe_id_princesa_fkey";

-- DropForeignKey
ALTER TABLE "princesa_villano" DROP CONSTRAINT "princesa_villano_id_princesa_fkey";

-- DropForeignKey
ALTER TABLE "usuario_princesa" DROP CONSTRAINT "usuario_princesa_id_princesa_fkey";

-- DropForeignKey
ALTER TABLE "usuario_princesa" DROP CONSTRAINT "usuario_princesa_id_usuario_fkey";

-- DropForeignKey
ALTER TABLE "usuario_principe" DROP CONSTRAINT "usuario_principe_id_usuario_fkey";

-- DropForeignKey
ALTER TABLE "usuario_villano" DROP CONSTRAINT "usuario_villano_id_usuario_fkey";

-- DropIndex
DROP INDEX "princesa_principe_id_princesa_id_principe_key";

-- DropIndex
DROP INDEX "princesa_villano_id_princesa_id_villano_key";

-- DropIndex
DROP INDEX "usuario_principe_id_usuario_id_principe_key";

-- DropIndex
DROP INDEX "usuario_villano_id_usuario_id_villano_key";

-- AlterTable
ALTER TABLE "princesa_principe" DROP COLUMN "id_princesa",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "princesa_id" INTEGER NOT NULL,
ADD CONSTRAINT "princesa_principe_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "princesa_villano" DROP COLUMN "id_princesa",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "princesa_id" INTEGER NOT NULL,
ADD CONSTRAINT "princesa_villano_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "usuario_principe" DROP COLUMN "id_usuario",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "usuario_id" INTEGER NOT NULL,
ADD CONSTRAINT "usuario_principe_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "usuario_villano" DROP COLUMN "id_usuario",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "usuario_id" INTEGER NOT NULL,
ADD CONSTRAINT "usuario_villano_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "usuario_princesa";

-- CreateTable
CREATE TABLE "UsuarioPrincesa" (
    "id" SERIAL NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "princesa_id" INTEGER NOT NULL,

    CONSTRAINT "UsuarioPrincesa_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "UsuarioPrincesa" ADD CONSTRAINT "UsuarioPrincesa_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UsuarioPrincesa" ADD CONSTRAINT "UsuarioPrincesa_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario_principe" ADD CONSTRAINT "usuario_principe_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario_villano" ADD CONSTRAINT "usuario_villano_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesa_villano" ADD CONSTRAINT "princesa_villano_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Villano"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesa_principe" ADD CONSTRAINT "princesa_principe_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

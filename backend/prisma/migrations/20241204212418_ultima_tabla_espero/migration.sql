/*
  Warnings:

  - You are about to drop the column `origen` on the `Principe` table. All the data in the column will be lost.
  - Added the required column `imagen` to the `Princesa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cuento` to the `Principe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `imagen` to the `Principe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `precio` to the `Principe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `imagen` to the `Villano` table without a default value. This is not possible if the table is not empty.
  - Added the required column `precio` to the `Villano` table without a default value. This is not possible if the table is not empty.

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
ALTER TABLE "usuarios_princesas" DROP CONSTRAINT "usuarios_princesas_princesa_id_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_princesas" DROP CONSTRAINT "usuarios_princesas_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_principes" DROP CONSTRAINT "usuarios_principes_principe_id_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_principes" DROP CONSTRAINT "usuarios_principes_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_villanos" DROP CONSTRAINT "usuarios_villanos_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_villanos" DROP CONSTRAINT "usuarios_villanos_villano_id_fkey";

-- AlterTable
ALTER TABLE "Princesa" ADD COLUMN     "imagen" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Principe" DROP COLUMN "origen",
ADD COLUMN     "cuento" TEXT NOT NULL,
ADD COLUMN     "imagen" TEXT NOT NULL,
ADD COLUMN     "precio" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Usuario" ADD COLUMN     "dinero_por_click" INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE "Villano" ADD COLUMN     "imagen" TEXT NOT NULL,
ADD COLUMN     "precio" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "usuarios_princesas" ADD CONSTRAINT "usuarios_princesas_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_princesas" ADD CONSTRAINT "usuarios_princesas_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Princesa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_principes" ADD CONSTRAINT "usuarios_principes_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_principes" ADD CONSTRAINT "usuarios_principes_principe_id_fkey" FOREIGN KEY ("principe_id") REFERENCES "Principe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_villanos" ADD CONSTRAINT "usuarios_villanos_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_villanos" ADD CONSTRAINT "usuarios_villanos_villano_id_fkey" FOREIGN KEY ("villano_id") REFERENCES "Villano"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_villanos" ADD CONSTRAINT "princesas_villanos_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Villano"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_villanos" ADD CONSTRAINT "princesas_villanos_villano_id_fkey" FOREIGN KEY ("villano_id") REFERENCES "Princesa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_principes" ADD CONSTRAINT "princesas_principes_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Princesa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesas_principes" ADD CONSTRAINT "princesas_principes_principe_id_fkey" FOREIGN KEY ("principe_id") REFERENCES "Principe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

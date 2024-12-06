-- DropIndex
DROP INDEX "usuario_princesa_id_usuario_id_princesa_key";

-- AlterTable
ALTER TABLE "usuario_princesa" ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "usuario_princesa_pkey" PRIMARY KEY ("id");

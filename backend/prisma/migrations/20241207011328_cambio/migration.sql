-- DropForeignKey
ALTER TABLE "usuarios_princesas" DROP CONSTRAINT "usuarios_princesas_princesa_id_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_princesas" DROP CONSTRAINT "usuarios_princesas_usuario_id_fkey";

-- AlterTable
ALTER TABLE "usuarios_princesas" ADD CONSTRAINT "usuarios_princesas_pkey" PRIMARY KEY ("usuario_id", "princesa_id");

-- AddForeignKey
ALTER TABLE "usuarios_princesas" ADD CONSTRAINT "usuarios_princesas_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_princesas" ADD CONSTRAINT "usuarios_princesas_princesa_id_fkey" FOREIGN KEY ("princesa_id") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

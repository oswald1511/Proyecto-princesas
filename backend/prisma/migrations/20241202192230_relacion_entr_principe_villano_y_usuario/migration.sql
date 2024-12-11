-- CreateTable
CREATE TABLE "usuario_principe" (
    "id_usuario" INTEGER NOT NULL,
    "id_principe" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "usuario_villano" (
    "id_usuario" INTEGER NOT NULL,
    "id_villano" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "usuario_principe_id_usuario_id_principe_key" ON "usuario_principe"("id_usuario", "id_principe");

-- CreateIndex
CREATE UNIQUE INDEX "usuario_villano_id_usuario_id_villano_key" ON "usuario_villano"("id_usuario", "id_villano");

-- AddForeignKey
ALTER TABLE "usuario_principe" ADD CONSTRAINT "usuario_principe_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario_principe" ADD CONSTRAINT "usuario_principe_id_principe_fkey" FOREIGN KEY ("id_principe") REFERENCES "Principe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario_villano" ADD CONSTRAINT "usuario_villano_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario_villano" ADD CONSTRAINT "usuario_villano_id_villano_fkey" FOREIGN KEY ("id_villano") REFERENCES "Villano"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- CreateTable
CREATE TABLE "Usuario" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "princesscoin" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "edad" INTEGER NOT NULL,
    "cantidad_de_princesas" INTEGER NOT NULL DEFAULT 0,
    "princesa_fav" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Princesa" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "origen" TEXT NOT NULL,
    "virtud" TEXT NOT NULL,
    "nemesis" TEXT NOT NULL,
    "habilidad" TEXT NOT NULL,
    "principe" TEXT NOT NULL,

    CONSTRAINT "Princesa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Villano" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "nivel_de_maldad" INTEGER NOT NULL,
    "tiene_magia" BOOLEAN NOT NULL,
    "alias" TEXT NOT NULL,
    "debilidad" TEXT NOT NULL,

    CONSTRAINT "Villano_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Princeso" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "origen" TEXT NOT NULL,
    "virtud" TEXT NOT NULL,
    "habilidad" TEXT NOT NULL,
    "alias" TEXT NOT NULL,

    CONSTRAINT "Princeso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuario_princesa" (
    "id_usuario" INTEGER NOT NULL,
    "id_princesa" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "princesa_villano" (
    "id_princesa" INTEGER NOT NULL,
    "id_villano" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "princesa_princeso" (
    "id_princesa" INTEGER NOT NULL,
    "id_princeso" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "usuario_princesa_id_usuario_id_princesa_key" ON "usuario_princesa"("id_usuario", "id_princesa");

-- CreateIndex
CREATE UNIQUE INDEX "princesa_villano_id_princesa_id_villano_key" ON "princesa_villano"("id_princesa", "id_villano");

-- CreateIndex
CREATE UNIQUE INDEX "princesa_princeso_id_princesa_id_princeso_key" ON "princesa_princeso"("id_princesa", "id_princeso");

-- AddForeignKey
ALTER TABLE "usuario_princesa" ADD CONSTRAINT "usuario_princesa_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario_princesa" ADD CONSTRAINT "usuario_princesa_id_princesa_fkey" FOREIGN KEY ("id_princesa") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesa_villano" ADD CONSTRAINT "princesa_villano_id_princesa_fkey" FOREIGN KEY ("id_princesa") REFERENCES "Villano"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesa_villano" ADD CONSTRAINT "princesa_villano_id_villano_fkey" FOREIGN KEY ("id_villano") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesa_princeso" ADD CONSTRAINT "princesa_princeso_id_princesa_fkey" FOREIGN KEY ("id_princesa") REFERENCES "Princesa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "princesa_princeso" ADD CONSTRAINT "princesa_princeso_id_princeso_fkey" FOREIGN KEY ("id_princeso") REFERENCES "Princeso"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

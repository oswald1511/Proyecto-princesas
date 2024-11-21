-- CreateTable
CREATE TABLE "Usuario" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "princesscoin" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "fecha_de_nacimiento" TIMESTAMP(3) NOT NULL,
    "cantidad_de_princesas" INTEGER NOT NULL,
    "princesa_fav" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Princesas" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "origen" TEXT NOT NULL,
    "virtud" TEXT NOT NULL,
    "nemesis" TEXT NOT NULL,
    "habilidad" TEXT NOT NULL,
    "principe" TEXT NOT NULL,

    CONSTRAINT "Princesas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Villanos" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "nivel_de_maldad" INTEGER NOT NULL,
    "tiene_magia" BOOLEAN NOT NULL,
    "alias" TEXT NOT NULL,
    "debilidad" TEXT NOT NULL,

    CONSTRAINT "Villanos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Princesos" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "origen" TEXT NOT NULL,
    "virtud" TEXT NOT NULL,
    "habilidad" TEXT NOT NULL,
    "alias" TEXT NOT NULL,

    CONSTRAINT "Princesos_pkey" PRIMARY KEY ("id")
);

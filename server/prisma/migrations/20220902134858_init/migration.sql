-- CreateTable
CREATE TABLE "Knowledge" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "field" TEXT NOT NULL,
    "learned" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Knowledge_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Resource" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "learned" BOOLEAN NOT NULL DEFAULT false,
    "knowledgeId" INTEGER NOT NULL,

    CONSTRAINT "Resource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "done" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tech" (
    "id" SERIAL NOT NULL,
    "projectId" INTEGER NOT NULL,
    "knowledgeId" INTEGER NOT NULL,

    CONSTRAINT "Tech_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Resource" ADD CONSTRAINT "Resource_knowledgeId_fkey" FOREIGN KEY ("knowledgeId") REFERENCES "Knowledge"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tech" ADD CONSTRAINT "Tech_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tech" ADD CONSTRAINT "Tech_knowledgeId_fkey" FOREIGN KEY ("knowledgeId") REFERENCES "Knowledge"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

/*
  Warnings:

  - You are about to drop the column `email` on the `Barbershop` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `Barbershop` table. All the data in the column will be lost.
  - You are about to drop the column `servicesId` on the `Booking` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `Booking` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `User` table. All the data in the column will be lost.
  - Added the required column `name` to the `Barbershop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Barbershop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `serviceId` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Booking" DROP CONSTRAINT "Booking_servicesId_fkey";

-- AlterTable
ALTER TABLE "Barbershop" DROP COLUMN "email",
DROP COLUMN "updateAt",
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Booking" DROP COLUMN "servicesId",
DROP COLUMN "updateAt",
ADD COLUMN     "serviceId" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "updateAt",
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AddForeignKey
ALTER TABLE "Booking" ADD CONSTRAINT "Booking_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "BarbershopService"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

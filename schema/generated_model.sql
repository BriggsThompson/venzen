BEGIN;
CREATE TABLE `attribute` (`attributeId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `key` varchar(200) NOT NULL, `value` varchar(1000) NOT NULL, `createTimestamp` datetime NOT NULL);
CREATE TABLE `capacity` (`capacityId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `type` varchar(200) NOT NULL, `createTimestamp` datetime NOT NULL);
CREATE TABLE `cost` (`costId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `deposit` numeric(10, 0) NOT NULL, `cleaningFee` numeric(10, 0) NOT NULL, `startRange` datetime NULL, `endRange` datetime NULL, `dayOfWeek` varchar(50) NOT NULL, `details` varchar(500) NOT NULL, `nonProfitDiscount` varchar(50) NOT NULL, `createTimestamp` datetime NOT NULL);
CREATE TABLE `detail` (`detailId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `title` varchar(100) NOT NULL, `description` varchar(100) NOT NULL, `createTimestamp` datetime NOT NULL);
CREATE TABLE `inclusion` (`inclusionId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `inclusion` varchar(1000) NOT NULL, `count` integer NULL, `createTimestamp` datetime NOT NULL);
CREATE TABLE `requirement` (`requirementId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `requirement` varchar(1000) NOT NULL, `createTimestamp` datetime NOT NULL);
CREATE TABLE `space` (`spaceId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(200) NOT NULL, `description` longtext NOT NULL, `squareFootage` integer NULL, `width` integer NULL, `length` integer NULL, `height` integer NULL, `createTimestamp` datetime NOT NULL);
CREATE TABLE `space_attribute` (
	`spaceAttributeId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
	`spaceId` integer NOT NULL,
	`value` varchar(100) NOT NULL,
    `details` longtext NOT NULL,
    `createTimestamp` datetime NOT NULL,
    `attributeId` integer NOT NULL
);
CREATE TABLE `space_capacity` (`spaceCapacityId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `capacity` integer NOT NULL, `capacityId` integer NOT NULL, `spaceId` integer NOT NULL);
CREATE TABLE `space_image` (`spaceImageId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `image` varchar(1000) NOT NULL, `order` integer NULL, `createTimestamp` datetime NOT NULL, `spaceId` integer NOT NULL);
CREATE TABLE `venue` (`venueId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(200) NOT NULL, `description` longtext NOT NULL, `mission` longtext NOT NULL, `address` varchar(1000) NOT NULL, `address2` varchar(1000) NOT NULL, `city` varchar(100) NOT NULL, `state` varchar(50) NOT NULL, `zipcode` varchar(50) NOT NULL, `phoneNumber` varchar(50) NOT NULL, `email` varchar(100) NOT NULL, `createTimestamp` datetime NOT NULL);
CREATE TABLE `venue_attribute` (`venueAttributeId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `value` varchar(100) NOT NULL, `details` longtext NOT NULL, `createTimestamp` datetime NOT NULL, `attributeId` integer NOT NULL, `venueId` integer NOT NULL);
CREATE TABLE `venue_image` (`venueImageId` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `image` varchar(1000) NOT NULL, `order` integer NULL, `createTimestamp` datetime NOT NULL, `venueId` integer NOT NULL);
ALTER TABLE `space` ADD COLUMN `venueId` integer NOT NULL;
ALTER TABLE `space` ALTER COLUMN `venueId` DROP DEFAULT;
ALTER TABLE `requirement` ADD COLUMN `spaceId` integer NOT NULL;
ALTER TABLE `requirement` ALTER COLUMN `spaceId` DROP DEFAULT;
ALTER TABLE `inclusion` ADD COLUMN `spaceId` integer NOT NULL;
ALTER TABLE `inclusion` ALTER COLUMN `spaceId` DROP DEFAULT;
ALTER TABLE `detail` ADD COLUMN `spaceId` integer NOT NULL;
ALTER TABLE `detail` ALTER COLUMN `spaceId` DROP DEFAULT;
ALTER TABLE `cost` ADD COLUMN `spaceId` integer NOT NULL;
ALTER TABLE `cost` ALTER COLUMN `spaceId` DROP DEFAULT;
ALTER TABLE `space_attribute` ADD CONSTRAINT `space_attr_attributeId_230be4cfd0fbdd3b_fk_attribute_attributeId` FOREIGN KEY (`attributeId`) REFERENCES `attribute` (`attributeId`);
CREATE INDEX `space_attribute_32abf905` ON `space_attribute` (`attributeId`);
ALTER TABLE `space_attribute` ADD CONSTRAINT `space_attr_attributeId_230be4cfd0fbdd3b_fk_space_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`);
CREATE INDEX `space_space_32abf905` ON `space_attribute` (`spaceId`);
ALTER TABLE `space_capacity` ADD CONSTRAINT `space_capacit_capacityId_6dbf9da66bf1cde5_fk_capacity_capacityId` FOREIGN KEY (`capacityId`) REFERENCES `capacity` (`capacityId`);
ALTER TABLE `space_capacity` ADD CONSTRAINT `space_capacity_spaceId_307f2f16234fecfa_fk_space_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`);
CREATE INDEX `space_capacity_af83d012` ON `space_capacity` (`capacityId`);
CREATE INDEX `space_capacity_7be16bdf` ON `space_capacity` (`spaceId`);
ALTER TABLE `space_image` ADD CONSTRAINT `space_image_spaceId_bd9295a5bc1b2da_fk_space_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`);
CREATE INDEX `space_image_7be16bdf` ON `space_image` (`spaceId`);
ALTER TABLE `venue_attribute` ADD CONSTRAINT `venue_attr_attributeId_1424a6e12559342c_fk_attribute_attributeId` FOREIGN KEY (`attributeId`) REFERENCES `attribute` (`attributeId`);
ALTER TABLE `venue_attribute` ADD CONSTRAINT `venue_attribute_venueId_65a78ab4e208cfb7_fk_venue_venueId` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`);
CREATE INDEX `venue_attribute_32abf905` ON `venue_attribute` (`attributeId`);
CREATE INDEX `venue_attribute_7b5042ae` ON `venue_attribute` (`venueId`);
ALTER TABLE `venue_image` ADD CONSTRAINT `venue_image_venueId_3b40d763b5972e44_fk_venue_venueId` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`);
CREATE INDEX `venue_image_7b5042ae` ON `venue_image` (`venueId`);
CREATE INDEX `space_7b5042ae` ON `space` (`venueId`);
ALTER TABLE `space` ADD CONSTRAINT `space_venueId_28aff3814784e67d_fk_venue_venueId` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`);
CREATE INDEX `requirement_7be16bdf` ON `requirement` (`spaceId`);
ALTER TABLE `requirement` ADD CONSTRAINT `requirement_spaceId_617dde6eff5fd2c5_fk_space_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`);
CREATE INDEX `inclusion_7be16bdf` ON `inclusion` (`spaceId`);
ALTER TABLE `inclusion` ADD CONSTRAINT `inclusion_spaceId_4deb0fe63e1028a2_fk_space_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`);
CREATE INDEX `detail_7be16bdf` ON `detail` (`spaceId`);
ALTER TABLE `detail` ADD CONSTRAINT `detail_spaceId_21807173aa4aa3e8_fk_space_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`);
CREATE INDEX `cost_7be16bdf` ON `cost` (`spaceId`);
ALTER TABLE `cost` ADD CONSTRAINT `cost_spaceId_4d9b02f95c751b4e_fk_space_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`);

COMMIT;
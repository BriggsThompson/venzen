#CREATE SCHEMA `venzen` DEFAULT CHARACTER SET utf8 ;
SET FOREIGN_KEY_CHECKS=0;


drop table if exists `venue_type`;
create table venue_type (
    venueTypeId mediumint primary key not null auto_increment,
    `type` varchar(200) not null,
    createTimestamp datetime not null
);

drop table if exists `venue`;
create table venue (
    venueId mediumint primary key not null auto_increment,
    venueTypeId mediumint not null,
    name varchar(200) not null,
    description text null,
    mission text null,
    address varchar(1000) null,
    address2 varchar(1000) null,
    city varchar(100) null,
    state varchar(50) null,
    zipcode varchar(50) null,
    phoneNumber varchar(50) null,
    email varchar(100) null,
    createTimestamp datetime not null,
    CONSTRAINT `FK_venue_venueTypeId`	FOREIGN KEY (`venueTypeId`)	REFERENCES `venue_type` (`venueTypeId`)
);

drop table if exists `space`;
create table space (
    spaceId mediumint primary key not null auto_increment,
    venueId mediumint not null,
    name varchar(200) not null,
    description text null,
    squareFootage mediumInt null,
    width mediumInt null,
    length mediumInt null,
    height mediumInt null,
    deposit decimal not null,
    cleaningFee decimal not null,
    costStartRange decimal null,
    costEndRange decimal null,
    costDetails varchar(500) null,
    nonProfitDiscount varchar(50) null,
    createTimestamp datetime not null,
    CONSTRAINT `FK_space_venueId`	FOREIGN KEY (`venueId`)	REFERENCES `venue` (`venueId`)
);

drop table if exists `attribute`;
create table attribute (
    attributeId mediumint primary key not null auto_increment,
    `type` varchar(200) not null,
    createTimestamp datetime not null
);

drop table if exists `event_type`;
create table event_type (
    eventTypeId mediumint primary key not null auto_increment,
    `type` varchar(200) not null,
    createTimestamp datetime not null
);

drop table if exists `venue_event`;
create table venue_event (
  venueEventId mediumint primary key not null auto_increment,
  venueId mediumint not null,
  eventTypeId mediumint not null,
  createTimestamp datetime not null,
  CONSTRAINT `FK_venue_event_venueId`	FOREIGN KEY (`venueId`)	REFERENCES `venue` (`venueId`),
  CONSTRAINT `FK_venue_event_eventTypeId`	FOREIGN KEY (`eventTypeId`)	REFERENCES `event_type` (`eventTypeId`)
);


drop table if exists `capacity`;
create table capacity (
    capacityId mediumint primary key not null auto_increment,
    spaceId mediumint not null,
    `type` enum('Cocktail', 'Seated For Dining', 'Theater Style', 'Workout Activity') not null,
    capacity mediumint not null,
    createTimestamp datetime not null,
    CONSTRAINT `FK_capacity_attributes_spaceId`	FOREIGN KEY (`spaceId`)	REFERENCES `space` (`spaceId`)
);

drop table if exists `space_attribute`;
create table space_attribute (
    spaceAttributeId mediumint primary key not null auto_increment,
    spaceId mediumint not null,
    attributeId mediumint not null,
    createTimestamp datetime not null,
    CONSTRAINT `FK_space_attribute_spaceId`	FOREIGN KEY (`spaceId`)	REFERENCES `space` (`spaceId`),
    CONSTRAINT `FK_space_attribute_attributeId`	FOREIGN KEY (`attributeId`)	REFERENCES `attribute` (`attributeId`)
);

drop table if exists `venue_attribute`;
create table venue_attribute (
    venueAttributeId mediumint primary key not null auto_increment,
    venueId mediumint not null ,
    attributeId mediumint not null,
    createTimestamp datetime not null,
    CONSTRAINT `FK_venue_attribute_venueId`	FOREIGN KEY (`venueId`)	REFERENCES `venue` (`venueId`),
    CONSTRAINT `FK_venue_attribute_attributeId`	FOREIGN KEY (`attributeId`)	REFERENCES `attribute` (`attributeId`)
);

drop table if exists `venue_image`;
create table venue_image (
    venueImageId mediumint primary key not null auto_increment,
    venueId mediumint not null,
    image varchar(1000) null,
    `order` mediumint null,
    createTimestamp datetime not null,
    CONSTRAINT `FK_venue_images_venueId`	FOREIGN KEY (`venueId`)	REFERENCES `venue` (`venueId`)
);

drop table if exists `space_image`;
create table space_image (
    spaceImageId mediumint primary key not null auto_increment,
    spaceId mediumint not null,
    image varchar(1000) null,
    `order` mediumint null,
    createTimestamp datetime not null,
    CONSTRAINT `FK_space_images_spaceId`	FOREIGN KEY (`spaceId`)	REFERENCES `space` (`spaceId`)
);

drop table if exists `requirement`;
create table requirement (
    requirementId mediumint primary key not null auto_increment,
    spaceId mediumint not null,
    requirement varchar(1000) not null,
    createTimestamp datetime not null,
    CONSTRAINT `FK_requirement_spaceId`	FOREIGN KEY (`spaceId`)	REFERENCES `space` (`spaceId`)
);

drop table if exists `inclusion`;
create table inclusion (
    inclusionId mediumint primary key not null auto_increment,
    spaceId mediumint not null,
    inclusion varchar(1000) not null,
    count mediumint null,
    createTimestamp datetime not null,
    CONSTRAINT `FK_inclusion_spaceId`	FOREIGN KEY (`spaceId`)	REFERENCES `space` (`spaceId`)
);

drop table if exists `detail`;
create table detail (
    detailId mediumint primary key not null auto_increment,
    spaceId mediumint not null,
    title varchar(100) not null,
    description varchar(100) not null,
    createTimestamp datetime not null,
    CONSTRAINT `FK_detail_spaceId`	FOREIGN KEY (`spaceId`)	REFERENCES `space` (`spaceId`)
);


SET FOREIGN_KEY_CHECKS=1;






insert into venue_type(type, createTimestamp)
values ('Banquet Hall', now());

insert into venue_type(type, createTimestamp)
values ('Bar', now());

insert into venue_type(type, createTimestamp)
values ('Cafe', now());

insert into venue_type(type, createTimestamp)
values ('Country Club', now());

insert into venue_type(type, createTimestamp)
values ('Raw Space', now());

insert into venue_type(type, createTimestamp)
values ('Gallery', now());

insert into venue_type(type, createTimestamp)
values ('Hotel', now());

insert into venue_type(type, createTimestamp)
values ('Restaurant', now());

insert into venue_type(type, createTimestamp)
values ('Studio', now());

insert into venue_type(type, createTimestamp)
values ('Winery', now());

insert into venue_type(type, createTimestamp)
values ('Brewery', now());

insert into venue_type(type, createTimestamp)
values ('Athletic Facility', now());

insert into venue_type(type, createTimestamp)
values ('Spa', now());

insert into attribute (type, createTimestamp)
values ('Billiards', now());

insert into attribute (type, createTimestamp)
values ('Darts', now());

insert into attribute (type, createTimestamp)
values ('Arcade', now());

insert into attribute (type, createTimestamp)
values ('Bowling', now());

insert into attribute (type, createTimestamp)
values ('Chef\'s Table', now());

insert into attribute (type, createTimestamp)
values ('Corkage Permitted', now());

insert into attribute (type, createTimestamp)
values ('Cyclorama', now());

insert into attribute (type, createTimestamp)
values ('Handicap Accessible', now());

insert into attribute (type, createTimestamp)
values ('Karaoke', now());

insert into attribute (type, createTimestamp)
values ('BYO Food/Beverage', now());

insert into attribute (type, createTimestamp)
values ('Outdoors', now());

insert into attribute (type, createTimestamp)
values ('HDTV', now());

insert into attribute (type, createTimestamp)
values ('Stage', now());

insert into attribute (type, createTimestamp)
values ('WIFI', now());

insert into attribute (type, createTimestamp)
values ('Wine Cellar', now());

insert into attribute (type, createTimestamp)
values ('A/V Equipment', now());

insert into attribute (type, createTimestamp)
values ('Catering Available', now());

insert into attribute (type, createTimestamp)
values ('Bar Service', now());

insert into attribute (type, createTimestamp)
values ('Indoors', now());

insert into attribute (type, createTimestamp)
values ('Smoking Area', now());

insert into attribute (type, createTimestamp)
values ('Pool', now());

insert into attribute (type, createTimestamp)
values ('Theater', now());

insert into attribute (type, createTimestamp)
values ('Roof Top', now());

insert into attribute (type, createTimestamp)
values ('Valet Parking', now());

insert into attribute (type, createTimestamp)
values ('Street Parking', now());

insert into event_type (type, createTimestamp)
values ('Birthday Party', now());

insert into event_type (type, createTimestamp)
values ('Class', now());

insert into event_type (type, createTimestamp)
values ('Corporate Event', now());

insert into event_type (type, createTimestamp)
values ('Dinner Party', now());

insert into event_type (type, createTimestamp)
values ('Filming Location', now());

insert into event_type (type, createTimestamp)
values ('Launch Party', now());

insert into event_type (type, createTimestamp)
values ('Meeting', now());

insert into event_type (type, createTimestamp)
values ('Fundraiser', now());

insert into event_type (type, createTimestamp)
values ('Photo Shoot', now());

insert into event_type (type, createTimestamp)
values ('Social Event', now());

insert into event_type (type, createTimestamp)
values ('Reception', now());


insert into venue (name, description, mission, address, address2, city, state, zipcode, phoneNumber, email, createTimestamp)
values ('The Contemporary Austin', 'Host your next event in exquisite style at The Contemporary Austin’s downtown location! A well-recognized, beautiful historic building, The Jones Center offers inspiring surroundings that foster creativity and showcase sophistication right on Austin’s famed Congress Avenue in the heart of downtown. The building opened in 1877 as Tobin Drug Store. In 1915, it became the Queen Theater, and morphed again in 1955 into the Lerner Department Store. At last, in 1996 it became Arthouse at the Jones Center and underwent an ambitious renovation and expansion in 2010. In 2011, the Austin Museum of Art (AMOA) merged with Arthouse to form AMOA-Arthouse—now reborn as The Contemporary Austin under new leadership and a refreshed mission and vision.',
		'The Contemporary Austin reflects the spectrum of contemporary art through exhibitions, commissions, education, and the collection.', '700 Congress Avenue', null, 'Austin', 'TX', '78701', '512-458-8191 x 255', 'siterentals@thecontemporaryaustin.org', now());

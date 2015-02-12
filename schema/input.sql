#select * from venue

insert into venue (name, description, mission, address, address2, city, state, zipcode, phoneNumber, email, createTimestamp)
values ('The Contemporary Austin', 'Host your next event in exquisite style at The Contemporary Austin’s downtown location! A well-recognized, beautiful historic building, The Jones Center offers inspiring surroundings that foster creativity and showcase sophistication right on Austin’s famed Congress Avenue in the heart of downtown. The building opened in 1877 as Tobin Drug Store. In 1915, it became the Queen Theater, and morphed again in 1955 into the Lerner Department Store. At last, in 1996 it became Arthouse at the Jones Center and underwent an ambitious renovation and expansion in 2010. In 2011, the Austin Museum of Art (AMOA) merged with Arthouse to form AMOA-Arthouse—now reborn as The Contemporary Austin under new leadership and a refreshed mission and vision.',
		'The Contemporary Austin reflects the spectrum of contemporary art through exhibitions, commissions, education, and the collection.', '700 Congress Avenue', null, 'Austin', 'TX', '78701', '512-458-8191 x 255', 'siterentals@thecontemporaryaustin.org', now());

insert into space (venueId, name, description, squareFootage, width, length, height, createTimestamp)
values (1, 'Roof Deck', 'The beautiful IPE decking, interspersed with laminated glass light floor panels, creates a magical glow with a stunning view of Austin’s skyline and the Texas State Capitol. The outdoor Roof Deck is an urban paradise perfect for cocktail parties, dinners, networking events, and many other unique events.',
		null, null, null, null, now());


insert into cost (spaceId, cost, deposit, cleaningFee, startRange, endRange, dayOfWeek, details, nonProfitDiscount, createTimestamp)
values (1, '4000', '1000', '100', 'March 17', 'May 5', 'Saturday', 'High Season (30x40 ft east tent included', '25%', now());
insert into cost (spaceId, cost, deposit, cleaningFee, startRange, endRange, dayOfWeek, details, nonProfitDiscount, createTimestamp)
values (1, '3500', '1000', '100', 'March 17', 'May 5', 'Friday', 'High Season (30x40 ft east tent included', '25%', now());
insert into cost (spaceId, cost, deposit, cleaningFee, startRange, endRange, dayOfWeek, details, nonProfitDiscount, createTimestamp)
values (1, '3000', '1000', '100', 'March 17', 'May 5', 'Thursday', 'High Season (30x40 ft east tent included', '25%', now());
insert into cost (spaceId, cost, deposit, cleaningFee, startRange, endRange, dayOfWeek, details, nonProfitDiscount, createTimestamp)
values (1, '2500', '1000', '100', 'March 17', 'May 5', 'Sunday-Wednesday', 'High Season (30x40 ft east tent included', '25%', now());


# fix ranges and day of week
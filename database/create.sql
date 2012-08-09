/** base tables for adversarial moderation system
 * @author christophersecord
 * @date 20120801
 * @language SQL
 * @platform mySQL
 */

/*
drop table moderation;
drop table comment;
drop table poster;
*/

/** poster
 */
create table poster (
	posterID int not null auto_increment primary key,
	score tinyint not null default 0
);

/** comment
 */
create table comment (
	commentID int not null auto_increment primary key,
	posterID int not null,
	content tinyint not null,
	score tinyint null,

	-- indicates that this comment is used as a test to determine moderator's alegence
	knownScore tinyint null,

	foreign key(posterID) references poster(posterID)
);

/** moderation
 */
create table moderation (
	posterID int not null,
	commentID int not null,
	score tinyint not null,

	primary key(posterID,commentID),
	foreign key(posterID) references poster(posterID),
	foreign key(commentID) references comment(commentID)
);

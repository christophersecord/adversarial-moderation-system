/** test data for adversarial moderation system
 * @author christophersecord
 * @date 20120801
 * @language SQL
 * @platform mySQL
 * intended to work on an empty (newly created) database
 */

-- posters 1 - 6
insert poster() values(); -- will be friendly   #1
insert poster() values(); -- will be friendly   #2
insert poster() values(); -- will be friendly   #3
insert poster() values(); -- will be unfriendly #4
insert poster() values(); -- will be unfriendly #5
insert poster() values(); -- will be unfriendly #6

-- comments 1 - 3 (test comments)
insert comment(posterID,content,knownscore) values(1,3,3); -- #1
insert comment(posterID,content,knownscore) values(1,7,7); -- #2
insert comment(posterID,content,knownscore) values(1,9,9); -- #3

-- comments 4 - 9
insert comment(posterID,content) values(1,7); -- friendly post 1   #4
insert comment(posterID,content) values(2,8); -- friendly post 2   #5
insert comment(posterID,content) values(3,9); -- friendly post 3   #6
insert comment(posterID,content) values(4,2); -- unfriendly post 1 #7
insert comment(posterID,content) values(5,3); -- unfriendly post 2 #8
insert comment(posterID,content) values(6,4); -- unfriendly post 3 #9

-- moderation by poster 1 accurate
insert moderation(posterID,commentID,score) values(1,1,1); -- test 3
insert moderation(posterID,commentID,score) values(1,5,9); -- 8
insert moderation(posterID,commentID,score) values(1,7,1); -- 2 
-- moderation by poster 2 accurate
insert moderation(posterID,commentID,score) values(2,2,9); -- test 7
insert moderation(posterID,commentID,score) values(2,6,9); -- 9
insert moderation(posterID,commentID,score) values(2,8,1); -- 3
-- moderation by poster 3 inaccurate
insert moderation(posterID,commentID,score) values(3,3,1); -- test 9
insert moderation(posterID,commentID,score) values(3,4,9); -- 7
insert moderation(posterID,commentID,score) values(3,9,1); -- 4
-- moderation by poster 4  unfriendly dishonest
insert moderation(posterID,commentID,score) values(4,1,9); -- test 3
insert moderation(posterID,commentID,score) values(4,5,1); -- 8
insert moderation(posterID,commentID,score) values(4,8,9); -- 3
-- moderation by poster 5  unfriendly dishonest
insert moderation(posterID,commentID,score) values(5,2,1); -- test 7
insert moderation(posterID,commentID,score) values(5,6,1); -- 7
insert moderation(posterID,commentID,score) values(5,9,9); -- 4
-- moderation by poster 6  unfriendly dishonest
insert moderation(posterID,commentID,score) values(6,3,1); -- test 7
insert moderation(posterID,commentID,score) values(6,7,9); -- 2
insert moderation(posterID,commentID,score) values(6,4,9); -- 7

-- assign poster scores
update poster
set score = computePosterScore(posterID);



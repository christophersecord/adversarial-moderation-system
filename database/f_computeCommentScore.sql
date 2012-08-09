/** function to compute the moderation score for an individual comment
 * @author christophersecord
 * @date 20120808
 * @language SQL
 * @platform mySQL
 */

/*
drop function computeCommentScore;
*/

delimiter //
create function computeCommentScore (inCommentID tinyint)
returns tinyint
begin

  declare tmpScore tinyint;

  select knownScore into tmpScore
  from comment
  where commentID = inCommentID;

  if (tmpScore is null) then
  select avg(score) into tmpScore
  from moderation
  where commentID = inCommentID
  and posterID in (
    select posterID
    from poster
    where score > 0
  )
  and commentID in (
    select commentID
    from comment
    where knownscore is null
  );
  end if;

  return tmpScore;

end //
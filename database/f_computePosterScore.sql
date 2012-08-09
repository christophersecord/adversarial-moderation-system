/** function to compute a poster's test score
 * @author christophersecord
 * @date 20120808
 * @language SQL
 * @platform mySQL
 */

/*
drop function computePosterScore;
*/

delimiter //
create function computePosterScore (inPosterID tinyint)
returns tinyint
begin

  declare tmpScore int;

  select sum(scoreDiff) into tmpScore 
    from (
      select
        case
          when c.knownscore > 5
          then m.score - c.knownscore
          else c.knownscore - m.score
        end as scoreDiff
      from comment c, moderation m
      where 
        c.commentID = m.commentID
        and knownscore is not null
        and m.posterID = inPosterID
    ) a;

  return tmpScore;

end //


 
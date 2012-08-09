<cfscript>
</cfscript>

<cfquery name="qComment" datasource="test">
	select commentID, posterID, content
	from ams.comment
	where 
		-- the score is above the acceptable threshold
		score > 5
	
		-- it's not a test comment
		and knownScore is null
		
		-- it's receieved at least X moderations
		and commentID in (
			select commentID
			from ams.moderation
			group by commentID
			having count(*) > 0
		)
	order by commentID
</cfquery>

<!--- ================================================================ --->
<cfoutput>
<!DOCTYPE html>
<html>
<head>
	<meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
	<title>AMS</title>
	<script type="text/javascript" src="rpsclient.js"></script>
	<style type="text/css">
		.content_1 {color:##f00;}
		.content_2 {color:##c00;}
		.content_3 {color:##900;}
		.content_4 {color:##600;}
		.content_5 {color:##303;}
		.content_6 {color:##006;}
		.content_7 {color:##009;}
		.content_8 {color:##00c;}
		.content_9 {color:##00f;}
	</style>
</head>

<body>

<p><a href="post/">post</a></p>
<ul>
	<cfloop query="qComment">
		<li class="content_#qComment.content#">
			#qComment.commentID#
			<strong>#qComment.content#</strong>
			by #qComment.posterID#
		</li>
	</cfloop>
</ul>
<p><a href="post/">post</a></p>

</body>
</html>
</cfoutput>

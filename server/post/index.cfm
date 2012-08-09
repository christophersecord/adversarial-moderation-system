<cfscript>
	function moderate (commentID, content) {
		tmp = "";
		
		tmp&= "<p>";
		
		tmp&= commentID;
		
		tmp &= " "
		
		tmp&= content;
		
		tmp&= "</p>";
		
		return tmp;
	}
</cfscript>

<!--- get a test post --->
<cfquery name="qTest" datasource="test">
	select commentID, content
	from ams.comment
	where knownScore is not null
	order by rand()
	limit 0,1
</cfquery>

<!--- get moderation posts --->
<cfquery name="qModerate" datasource="test">
	select commentID, content
	from ams.comment
	where knownScore is null
	order by rand()
	limit 0,3
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
	</style>
</head>

<body>

<form action="." method="post">
	
	<!--- test post --->
	<cfloop query="qTest">
		#moderate(qTest.commentID,qTest.content)#
	</cfloop>

	<!--- moderation posts --->
	<cfloop query="qModerate">
		#moderate(qModerate.commentID,qModerate.content)#
	</cfloop>
	
</form>

</body>
</html>
</cfoutput>

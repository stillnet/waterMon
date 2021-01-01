<html>
<head>
<title>Showers</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
body { font-family: arial;}
h2 { text-align: center; }
#showertable { margin: auto; }
#showertable thead th { padding-right: 50px;}
</style>
<body>

<cfquery name="showerdata" datasource="house">
SELECT *, extract(EPOCH FROM ("end" - "start")) as showertime FROM showers
ORDER BY showerid DESC
LIMIT 50
</cfquery>

<h2>Showers</h2>
<table id="showertable">
<thead>
    <tr><th><th>Start</th><th>Length</th></tr>
</thead>
<tbody>
<cfoutput query="showerdata">
    <tr>
    <td>
        <cfif DateFormat(start,"yyyymmdd") EQ DateFormat(now(),"yyyymmdd")>
            Today
        <cfelseif DateFormat(start,"yyyymmdd") EQ DateFormat(DateAdd("d",-1,now()),"yyyymmdd")>
            Yesteday
        <cfelse>
            #DateFormat(start,"mmm d")#
        </cfif>
    </td>
    <td title="#showerid#">#TimeFormat(start)#</td>
    <td>
        <cfif Val(showertime)>
            <cfset tmpTimeStruct = CreateTimeStruct(showertime,"s")/>
            #tmpTimeStruct.m#:#tmpTimeStruct.s#
        <cfelseif showerdata.currentRow EQ 1>
            &nbsp;&nbsp;🛁
        <cfelse>
            -----
        </cfif>
    </td>
    </tr>
</cfoutput>
</tbody>
</table>
</body>




<cfscript>
function CreateTimeStruct(timespan) {
    var timestruct = StructNew();
    var mask = "s";

    if (ArrayLen(Arguments) gte 2) mask = Arguments[2];

    // if timespan isn't an integer, convert mask towards s until timespan is an integer or mask is s
    while (Int(timespan) neq timespan AND mask neq "s") {
        if (mask eq "d") {
            timespan = timespan * 24;
            mask = "h";
        } else if (mask eq "h") {
            timespan = timespan * 60;
            mask = "m";
        } else if (mask eq "m") {
            timespan = timespan * 60;
            mask = "s";
        }
    }
    
    // only 4 allowed values for mask - if not one of those, return blank struct
    if (ListFind("d,h,m,s", mask)) {
        // compute seconds
        if (mask eq "s") {
            timestruct.s = NumberFormat((timespan mod 60) + (timespan - Int(timespan)),"00");
            timespan = int(timespan/60);
            mask = "m";
        } else timestruct.s = 0;
        // compute minutes
        if (mask eq "m") {
            timestruct.m = timespan mod 60;
            timespan = int(timespan/60);
            mask = "h";
        } else timestruct.m = 0;
        // compute hours, days
        if (mask eq "h") {
            timestruct.h = timespan mod 24;
            timestruct.d = int(timespan/24);
        } else {
            timestruct.h = 0;
            timestruct.d = timespan;
        }
    }
    
    return timestruct;
}
</cfscript>


<cfsilent>
<cfscript>
/*
			experimental coldfusion mx version of cf_xmlquery 
			note this only works if xpath is supplied 
			because xmlsearch() returns an array, 
			whereas the native cf dom object is a structure
			
			usage:
				<cf_xmlq 
					name = "myqueryname"
					xpath = "article_xml/photo"
					xml = "xmlstring">
*/

xmldoc = xmlparse(attributes.xml);
xpath = attributes.xpath;
queryname = attributes.name;
xpathed = XMLSearch(xmldoc,xpath);

/*		work out the columns, by getting the element name and the attributes of each element. 
		note if we trusted that the xml document was consistent (i.e. attributes in all elements
		are the same as the first) then we wouldn't need to check all elements, which would be faster. */

columns = '';

for (i = 1; i LTE arraylen(xpathed); i = i + 1) {
	currentelement = xpathed[i].XMLName;
	if (listfindnocase(columns,currentelement) eq 0) {
		columns = listappend(columns,xpathed[i].XMLName);
	}
	// now get the names of the attributes
	listofattributes = arraytolist(StructKeyArray(xpathed[i].XMLAttributes));
	for (j = 1; j LTE listlen(listofattributes); j = j + 1) {
		attributename = currentelement & '_' & listgetat(listofattributes,j);
		if (listfindnocase(columns,attributename) eq 0) {
			columns = listappend(columns,attributename);
		}
	}
	//	 perhaps we could get attributes and child nodes in one go, using the xmlnodes array,
	//	but for now we'll do them separately 
	arrayofchildren = xpathed[i].XMLChildren;
	for (k = 1; k LTE arraylen(arrayofchildren); k = k + 1) {
		childname = currentelement & '_' & arrayofchildren[k].XMLName;
		if (listfindnocase(columns,childname) eq 0) {
			columns = listappend(columns,childname);
		}
	}
}

// start to build up the query 

xquery = querynew(columns);

// now go through each element, getting values and building up the query 

for (i = 1; i LTE arraylen(xpathed); i = i + 1) {
	// first set the element value --->
	queryaddrow(xquery);
	currentelement = xpathed[i].XMLName;
	currentelementvalue = xpathed[i].XMLText;
	QuerySetCell(xquery, currentelement, currentelementvalue);
	// now all the attributes --->
	structofattributes = xpathed[i].XMLAttributes;
	for (j in structofattributes) {
		attributename = currentelement & '_' & j;
		QuerySetCell(xquery, attributename,structFind(structofattributes, j));
	}
	// now all the child elements --->
	arrayofchildren = xpathed[i].XMLChildren;
	for (k = 1; k LTE arraylen(arrayofchildren);k = k + 1) {
		childname = currentelement & '_' & arrayofchildren[k].XMLName;
		QuerySetCell(xquery, childname,arrayofchildren[k].XMLText);
	}
}
// set the name of the query for the calling page 
'caller.#attributes.name#' = xquery;
xquery = '';

</cfscript>
</cfsilent>
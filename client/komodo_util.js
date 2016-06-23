	function Update() {
	   var to = new String;
	   for (var i = 0; i < document.select.elements.length; i++) {
	      var e = document.select.elements[i];
	      if(e.name == 'to2' && e.checked) {
		 if(to == "") {
		    to = e.value;
		 } else {
		    to += "," + e.value;
		 }
	      }
	   }
	   document.select.to.value = to;
	}

	// tab to next box of phone number in IE
	function TabNext(obj,event,len,next_field) {
	   var phone_field_length=0;
	   if (event == "down") {
	      phone_field_length=obj.value.length;
	   } else if (event == "up") {
	      if (obj.value.length != phone_field_length) {
		 phone_field_length=obj.value.length;
		 if (phone_field_length == len) {
		    next_field.focus();
		 }
	       }
	   }
	}

	// submit form when state is selected on Premium Title Quote in order to show proper county list
	function submitform() {
		document.quote.new_state.value = document.quote.state.options[document.quote.state.selectedIndex].value;
		document.quote.submit();
	}

	// submit form when state is selected
	function submitstateselect() {
		document.stateselect.new_state.value = 'yes';
		document.stateselect.submit();
	}

	var tab    = new Array(5); // Create initial forms in each section
	tab[0]     = "tab01";
	tab[1]     = "tab11";
	tab[2]     = "tab21";
	tab[3]     = "tab31";
	tab[4]     = "tab41";
	var notab  = "";

	// Make the chosen tab visible
	function showtab(pick) {
		index  = parseInt(pick.charAt(3));
		pos    = parseInt(pick.substring(4,pick.length));


		if( pick != tab[index] ) {
			if( window.document.layers ) {
				handle = "window.document.layers";
				stylevar = "";
			} else {
				handle = "document.all";
				stylevar = ".style";
			}
			eval(handle+'["'+tab[index]+'"]'+stylevar+'.visibility="hidden"');
			eval(handle+'["'+pick+'"]'+stylevar+'.visibility="visible"');
			tab[index]=pick;
			if( pos != 1 ) reposition(pick,false);
		}

	}

	// Position the tab layers
	function reposition(current,resize) {
		if( resize == true ) { // repositions on browser resize
		    for( i = 0; i < 5; i++ ) {
			   start   = "tab" + i + 1;
			   if (tab[i] != start) {

			      if ( window.document.layers ) {
				  //eval('window.document.layers['+tab[i]+'].top = 424');
				  //eval('window.document.layers['+tab[i]+'].left = '+start+'.offsetLeft');
			      } else {
				      eval(tab[i]+'.style.pixelTop = '+start+'.offsetTop - 87');
				      eval(tab[i]+'.style.pixelLeft = '+start+'.offsetLeft');
			      }
			   }
		    }
	   } else { // repositions visible tabs
			index1 = parseInt(current.charAt(3));
			start = "tab" + index1 + 1;
			if ( window.document.layers ) {
			   //eval('window.document.layers['+current+'].top = 424');
			   //eval('window.document.layers['+current+'].left = '+start+'.offsetLeft');
			} else {
			   eval(current+'.style.pixelTop = '+start+'.offsetTop - 87');
			   eval(current+'.style.pixelLeft = '+start+'.offsetLeft');
			}
	   }
	}

	// Limit textarea size
	function textCounter(field, maxlimit) {
		if (field.value.length > maxlimit) // if too long...trim it!
		field.value = field.value.substring(0, maxlimit);
	}

	// Replace MS Word special chars
	function strReplace(field) {
		var rExp = new Array(10);
		rExp[0] = /’/gi;
		rExp[1] = /“/gi;
		rExp[2] = /”/gi;
		rExp[3] = /–/gi;
		rExp[4] = /&#61616;/gi;
		rExp[5] = /&#39;/gi;
		rExp[6] = /&amp;/gi;
		rExp[7] = /&apos;/gi;
		rExp[8] = /&gt;/gi;
		rExp[9] = /&lt;/gi;
		var rwith = new Array(10);
		rwith[0] = '\'';
		rwith[1] = '"';
		rwith[2] = '"';
		rwith[3] = '-';
		rwith[4] = '°';
		rwith[5] = '\'';
		rwith[6] = '&';
		rwith[7] = '\'';
		rwith[8] = '>';
		rwith[9] = '<';

		for (i = 0; i < rExp.length; i++) {
			field.value = field.value.replace(rExp[i],rwith[i]);
		}
	}

	// date validation for combined date fields
	function valiDateString(form,name) {
		var date  = eval("document." + form + "." + name + ".value");

		if(date == "") {
			return;
		}

		var month = date.substring(0, date.indexOf('/'));
		var day   = date.substring(date.indexOf('/') + 1, date.lastIndexOf('/'));
		var year  = date.substring(date.lastIndexOf('/') + 1);


		if((month < 1) || (month > 12)) {
			alert("Invalid Input\nMonth must be between 1 and 12\n");
			eval("document." + form + "." + name + ".focus()");
		} else if (
			(month == 1  ||
			month == 3  ||
			month == 5  ||
			month == 7  ||
			month == 8  ||
			month == 10 ||
			month == 12) && ((day < 1) || (day > 31)) ) {

			alert("Invalid Input\nDay must be between 1 & 31");
			eval("document." + form + "." + name + ".focus()");
		} else if (
			(month == 4  ||
			month == 6  ||
			month == 9  ||
			month == 11) &&  ((day < 1) || (day > 30)) ) {

			alert("Invalid Input\nDay must be between 1 & 30");
			eval("document." + form + "." + name + ".focus()");
		} else if ((month == 2) && (isLeapYear(year) == true) && ((day < 1) || (day > 29))) { // leap year
			alert("Invalid Input\nDay must be between 1 & 29");
			eval("document." + form + "." + name + ".focus()");
		} else if ((month == 2) && !(isLeapYear(year) == true) && ((day < 1) || (day > 28))) {
			alert("Invalid Input\nDay must be between 1 & 28");
			eval("document." + form + "." + name + ".focus()");
		} else if(year < 2002) {
			alert("Invalid Input\nYear must be greater then the current year.");
			eval("document." + form + "." + name + ".focus()");
		}
	}

	function isLeapYear(year) {
		return((year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0)));
	}

	function eoCheck(form) {
		var e_o_holder       = eval("document." + form + ".e_o_holder.value");
		var e_o_insurance_no = eval("document." + form + ".e_o_insurance_no.value");

		if((e_o_holder != "") || (e_o_insurance_no != "")) {
			eval("document." + form + ".e_o_insurance[0].checked = true");
		}
	}

	function eoCheckBox(form) {
		if(eval("document." + form + ".e_o_insurance[1].checked == true")) {
			eval("document." + form + ".e_o_holder.value = ''");
			eval("document." + form + ".e_o_insurance_no.value = ''");
			eval("document." + form + ".e_o_expire_date.value = ''");
		}
	}

	// search form date validation
	function valiDate(month,day,year,loc) {
		var selectedMonth = eval("document.search." + month + ".selectedIndex");
		var theyear = /^(19|20)[0-9]{2}$/;
		var theday = /^[0-9]{1,2}$/;
		if (  selectedMonth != "" && eval("document.search." + day + ".value != ''") && eval("document.search." + year + ".value != ''")) {
			if (!eval("document.search." + year + ".value.match(theyear)")) {
				alert("Invalid Input\n" +
					  "Year must be 19XX or 20XX\n");
				eval("document.search." + year + ".value = ''");
				eval("document.search." + year + ".focus()");
			} else if (
				 selectedMonth == 1  ||
				 selectedMonth == 3  ||
				 selectedMonth == 5  ||
				 selectedMonth == 7  ||
				 selectedMonth == 8  ||
				 selectedMonth == 10 ||
				 selectedMonth == 12
			) {
				if (!eval("document.search." + day + ".value.match(theday)") || eval("document.search." + day + ".value <= 0") || eval("document.search." + day + ".value > 31")) {
					alert("Invalid Input\n" +
						  "Day must be between 1 & 31\n");
					eval("document.search." + day + ".value = ''");
					eval("document.search." + day + ".focus()");
				}
			} else if (
				selectedMonth == 4 ||
				selectedMonth == 6 ||
				selectedMonth == 9 ||
				selectedMonth == 11
			) {
				if (!eval("document.search." + day + ".value.match(theday)") || eval("document.search." + day + ".value <= 0") || eval("document.search." + day + ".value > 30")) {
					alert("Invalid Input\n" +
						  "Day must be between 1 & 30\n");
					eval("document.search." + day + ".value = ''");
					eval("document.search." + day + ".focus()");
				}
			} else if (selectedMonth == 2 && (eval("document.search." + year + ".value % 4 == 0") && ((eval("document.search." + year + ".value % 100 != 0")) || (eval("document.search." + year + ".value % 400 == 0"))))) {
				if (!eval("document.search." + day + ".value.match(theday)") || eval("document.search." + day + ".value <= 0") || eval("document.search." + day + ".value > 29")) {
					alert("Invalid Input\n" +
						  "Day must be between 1 & 29\n");
					eval("document.search." + day + ".value = ''");
					eval("document.search." + day + ".focus()");
				}
			} else if (selectedMonth == 2){
				if (!eval("document.search." + day + ".value.match(theday)") || eval("document.search." + day + ".value <= 0") || eval("document.search." + day + ".value > 28")) {
					alert("Invalid Input\n" +
						  "Day must be between 1 & 28\n");
					eval("document.search." + day + ".value = ''");
					eval("document.search." + day + ".focus()");
				}
			}
		} else if ( selectedMonth == "" && (eval("document.search." + day + ".value != ''") && eval("document.search." + year + ".value != ''"))) {
				alert("Invalid Input\n" +
					  "Please enter a month");
				eval("document.search." + month + ".focus()");
		} else if ( selectedMonth != "" && (eval("document.search." + day + ".value == ''") && eval("document.search." + year + ".value != ''"))) {
				alert("Invalid Input\n" +
					  "Please enter a day");
				eval("document.search." + day + ".focus()");
		} else if (loc == '1' && selectedMonth != "" && (eval("document.search." + day + ".value != ''") && eval("document.search." + year + ".value == ''"))) {
				alert("Invalid Input\n" +
					  "Please enter a year");
				eval("document.search." + day + ".focus()");
		} //else if (loc == '1' && selectedMonth != "" && (eval("document.search." + day + ".value == ''") && eval("document.search." + year + ".value == ''"))) {
			//	eval("document.search." + day + ".focus()");
		//} else if (loc == '1' && selectedMonth != "" && (eval("document.search." + day + ".value != ''") && eval("document.search." + year + ".value == ''"))) {
		//		eval("document.search." + year + ".focus()");
		//} else if (loc == '1' && selectedMonth == "" && (eval("document.search." + day + ".value != ''") || eval("document.search." + year + ".value != ''"))) {
		//		eval("document.search." + month + ".focus()");
		//}


	}

	// change focus to given form obj
	function focusNext(next){
		eval("document.search." + next + ".focus()");
	}

	// search form date function
	// prevent user from changing month after validation
	function monthChange(month,day,year) {
		if ( eval("document.search." + day + ".value == ''") && eval("document.search." + year + ".value == ''") ) {
				eval("document.search." + month + ".focus()");
		} else {
				eval("document.search." + day   + ".value = ''");
				eval("document.search." + year  + ".value = ''");
				eval("document.search." + month + ".focus()");
		}
	}

	// format day
	function formatDay(day) {
		var dayval = eval("document.search." + day + ".value");
		if (eval("document.search." + day + ".value != ''") && eval("document.search." + day + ".value <= 9")) {
			eval("document.search." + day + ".value = '0' + " + dayval );
		}
	}

	// clear radio buttons if no judgements/liens checkbox is checked
	function clearRadio(section,radio) {
		if (eval("document.search." + section + ".checked")) {
			for (i=1; i <= 8; i++) {
				len = eval("document.search." + radio + i + ".length");
				for (j=0; j < len; j++) {
					eval("document.search." + radio + i + "[" + j + "]" + ".checked = false");
				}
			}
		}

	}


	var chkbox = new Array(3);
	chkbox[0] = -1;
	chkbox[1] = -1;
	chkbox[2] = -1;

	// limit # of infoproducts that can be chosen to 3
	function isChecked() {
		for (i = 0; i < document.order.order$info$.type.length; i++) {
				if (eval("document.order.order$info$.type[" + i + "].checked") && (chkbox[0] == i || chkbox[1] == i || chkbox[2] == i)) {
					continue;
				} else if (!eval("document.order.order$info$.type[" + i + "].checked")) {
					if (chkbox[0] == i) {
						chkbox[0] = -1;
					} else if (chkbox[1] == i) {
						chkbox[1] = -1;
					} else if (chkbox[2] == i) {
						chkbox[2] = -1;
					} else {
						continue;
					}
				} else if (eval("document.order.order$info$.type[" + i + "].checked")) {
					if (chkbox[0] == -1) {
						chkbox[0] = i;
						continue;
					} else if (chkbox[1] == -1) {
						chkbox[1] = i;
						continue;
					} else if (chkbox[2] == -1) {
						chkbox[2] = i;
						continue;
					} else {
						eval("document.order.order$info$.type[" + i + "].checked = false");
					}
				} else {
					continue;
				}
		}
	}

	// if not assigned is checked in mortgage section, disable all relevant form elements on that tab
	function disable(format,num) {
		if (eval("document.search.Mortgage_Not_Assigned$IGN" + num + ".checked")) {
			// disable all in section
			eval("document.search.Mortgage_Assigned_To$IGN" 				+ num + ".disabled = true");
			eval("document.search.Mortgage_Assigned_Book$IGN"				+ num + ".disabled = true");
			eval("document.search.Mortgage_Assigned_Page$IGN" 			+ num + ".disabled = true");
			eval("document.search.Mortgage_Assigned_Document_No$IGN" 		+ num + ".disabled = true");
			eval("document.search.Mortgage_Assigned_Recording_Month$IGN" 	+ num + ".disabled = true");
			eval("document.search.Mortgage_Assigned_Recording_Day$IGN" 		+ num + ".disabled = true");
			eval("document.search.Mortgage_Assigned_Recording_Year$IGN" 	+ num + ".disabled = true");
			eval("document.search.Mortgage_Assigned_Executed_Month$IGN" 	+ num + ".disabled = true");
			eval("document.search.Mortgage_Assigned_Executed_Day$IGN" 		+ num + ".disabled = true");
			eval("document.search.Mortgage_Assigned_Executed_Year$IGN" 	     + num + ".disabled = true");
			// clear all in section
			eval("document.search.Mortgage_Assigned_To$IGN" 				+ num + ".value = ''");
			eval("document.search.Mortgage_Assigned_Book$IGN"				+ num + ".value = ''");
			eval("document.search.Mortgage_Assigned_Page$IGN" 			+ num + ".value = ''");
			eval("document.search.Mortgage_Assigned_Document_No$IGN" 		+ num + ".value = ''")
			eval("document.search.Mortgage_Assigned_Recording_Month$IGN"	+ num + ".value = ''");
			eval("document.search.Mortgage_Assigned_Recording_Day$IGN" 		+ num + ".value = ''");
			eval("document.search.Mortgage_Assigned_Recording_Year$IGN" 	+ num + ".value = ''");
			eval("document.search.Mortgage_Assigned_Executed_Month$IGN" 	+ num + ".value = ''");
			eval("document.search.Mortgage_Assigned_Executed_Day$IGN" 		+ num + ".value = ''");
			eval("document.search.Mortgage_Assigned_Executed_Year$IGN" 	     + num + ".value = ''");
		} else {
			// enable all in section
			eval("document.search.Mortgage_Assigned_To$IGN" 				+ num + ".disabled = false");
			if(format != "3") {
				eval("document.search.Mortgage_Assigned_Book$IGN"				+ num + ".disabled = false");
				eval("document.search.Mortgage_Assigned_Page$IGN" 			+ num + ".disabled = false");
				eval("document.search.Mortgage_Assigned_Document_No$IGN" 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Assigned_Recording_Month$IGN"	+ num + ".disabled = false");
				eval("document.search.Mortgage_Assigned_Recording_Day$IGN" 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Assigned_Recording_Year$IGN" 	+ num + ".disabled = false");
			}
			eval("document.search.Mortgage_Assigned_Executed_Month$IGN" 	+ num + ".disabled = false");
			eval("document.search.Mortgage_Assigned_Executed_Day$IGN" 		+ num + ".disabled = false");
			eval("document.search.Mortgage_Assigned_Executed_Year$IGN" 	     + num + ".disabled = false");
		}

	}

	// if no mortgages is checked, disable all form element in section
	function disableMortgage(format,title) {
		changeCheck();
		if (document.search.Mortgage_Not_Found.checked) {
			for (num = 1; num<=5; num++) {
				// disable all in section
				//for(r = 1; r <= 8; r++){
					//eval("document.search.Mortgagor$IGN" + r + num + ".disabled = true");
					//eval("document.search.Mortgagee$IGN" + r + num + ".disabled = true");
				//}
				eval("document.search.Mortgage_Trustee$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Mortgage_Book$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Mortgage_Page$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Mortgage_Document_No$IGN" 		+ num + ".disabled = true");
				eval("document.search.Mortgage_Amount$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Mortgage_Signature_Month$IGN" 	+ num + ".disabled = true");
				eval("document.search.Mortgage_Signature_Day$IGN" 	+ num + ".disabled = true");
				eval("document.search.Mortgage_Signature_Year$IGN" 	+ num + ".disabled = true");
				eval("document.search.Mortgage_Recording_Month$IGN"	+ num + ".disabled = true");
				eval("document.search.Mortgage_Recording_Day$IGN" 	+ num + ".disabled = true");
				eval("document.search.Mortgage_Recording_Year$IGN"	+ num + ".disabled = true");
				eval("document.search.Mortgage_Maturity_Month$IGN" 	+ num + ".disabled = true");
				eval("document.search.Mortgage_Maturity_Day$IGN" 	  	+ num + ".disabled = true");
				eval("document.search.Mortgage_Maturity_Year$IGN"	  	+ num + ".disabled = true");
				eval("document.search.Mortgage_County$IGN"	  		+ num + ".disabled = true");
				eval("document.search.Mortgage_Remarks$IGN"	  		+ num + ".disabled = true");
				for (j=0; j < 2; j++) {
					eval("document.search.Mortgage_Open_Ended$IGN"  + num + "[" + j + "]" + ".disabled = true");
					if (title == 'Yes') eval("document.search.Individual$IGN"  + num + "[" + j + "]" + ".disabled = true");
					if (title == 'Yes') eval("document.search.Open_Satisfied$IGN"  + num + "[" + j + "]" + ".disabled = true");
				}

				eval("document.search.Mortgage_Not_Assigned$IGN" + num + ".checked = true");
				disable( format,num );
				eval("document.search.Mortgage_Not_Assigned$IGN" + num + ".disabled = true");

				// clear all in section
				for(r = 1; r < 8; r++){
					eval("document.search.Mortgagor$IGN"  + r + num + ".value = ''");
					eval("document.search.Mortgagee$IGN"  + r + num + ".value = ''");
				}
				eval("document.search.Mortgage_Trustee$IGN" 	  		 	+ num + ".value = ''");
				eval("document.search.Mortgage_Book$IGN" 	  		 	+ num + ".value = ''");
				eval("document.search.Mortgage_Page$IGN" 	  		 	+ num + ".value = ''");
				eval("document.search.Mortgage_Document_No$IGN" 		 	+ num + ".value = ''");
				eval("document.search.Mortgage_Amount$IGN" 	  		 	+ num + ".value = ''");
				eval("document.search.Mortgage_Signature_Month$IGN" 	 	+ num + ".value = ''");
				eval("document.search.Mortgage_Signature_Day$IGN" 		+ num + ".value = ''");
				eval("document.search.Mortgage_Signature_Year$IGN" 		+ num + ".value = ''");
				eval("document.search.Mortgage_Recording_Month$IGN"	 	+ num + ".value = ''");
				eval("document.search.Mortgage_Recording_Day$IGN" 	 	+ num + ".value = ''");
				eval("document.search.Mortgage_Recording_Year$IGN"	 	+ num + ".value = ''");
				eval("document.search.Mortgage_Maturity_Month$IGN" 		+ num + ".value = ''");
				eval("document.search.Mortgage_Maturity_Day$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Mortgage_Maturity_Year$IGN"	  		+ num + ".value = ''");
				eval("document.search.Mortgage_County$IGN"	  		 	+ num + ".value = ''");
				eval("document.search.Mortgage_Remarks$IGN"	  		 	+ num + ".value = ''");
				for (j=0; j < 2; j++) {
					eval("document.search.Mortgage_Open_Ended$IGN" + num + "[" + j + "]" + ".checked = false");
					if (title == 'Yes') eval("document.search.Individual$IGN" + num + "[" + j + "]" + ".checked = false");
					if (title == 'Yes') eval("document.search.Open_Satisfied$IGN" + num + "[" + j + "]" + ".checked = false");
				}

			}

		} else {
			for (num = 1; num<=5; num++) {
				// enable all in section
				//for(r = 1; r <= 8; r++){
					//eval("document.search.Mortgagor$IGN"  + r  + num + ".disabled = false");
					//eval("document.search.Mortgagee$IGN"  + r  + num + ".disabled = false");
				//}
				eval("document.search.Mortgage_Trustee$IGN" 	  		 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Book$IGN" 	  		 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Page$IGN" 	  		 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Document_No$IGN" 		 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Amount$IGN" 	  		 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Signature_Month$IGN" 	 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Signature_Day$IGN" 			+ num + ".disabled = false");
				eval("document.search.Mortgage_Signature_Year$IGN" 			+ num + ".disabled = false");
				eval("document.search.Mortgage_Recording_Month$IGN"	 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Recording_Day$IGN" 	 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Recording_Year$IGN"	 		+ num + ".disabled = false");
				eval("document.search.Mortgage_Remarks$IGN"	  				+ num + ".disabled = false");
				eval("document.search.Mortgage_Maturity_Month$IGN"			+ num + ".disabled = false");
				eval("document.search.Mortgage_Maturity_Day$IGN" 				+ num + ".disabled = false");
				eval("document.search.Mortgage_Maturity_Year$IGN"				+ num + ".disabled = false");
				if(format != "1") {
					eval("document.search.Mortgage_County$IGN"	  		  	+ num + ".disabled = false");
				}
				for (j=0; j < 2; j++) {
					eval("document.search.Mortgage_Open_Ended$IGN"  + num + "[" + j + "]" + ".disabled = false");
					if (title == 'Yes') eval("document.search.Individual$IGN"  + num + "[" + j + "]" + ".disabled = false");
					if (title == 'Yes') eval("document.search.Open_Satisfied$IGN"  + num + "[" + j + "]" + ".disabled = false");
				}
				eval("document.search.Mortgage_Not_Assigned$IGN" + num + ".disabled = false");
				//eval("document.search.Mortgage_Not_Assigned$IGN" + num + ".checked = ''");
				disable( format,num );

			}
		}
	}

	// if no lien/judgements is checked, disable all form elements in section
	function disableJudgement() {

		if (document.search.Judgment_Lien_Not_Found.checked) {
			for (num = 1; num<=8; num++) {
				// disable all in sections
				eval("document.search.Judgment_Lien_Type$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Against$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Favor$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Executed_Month$IGN" 	+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Executed_Day$IGN" 	  	+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Executed_Year$IGN" 	+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Recording_Month$IGN" 	+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Recording_Day$IGN" 	+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Recording_Year$IGN"	+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Book$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Page$IGN"	  	  	+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Document_No$IGN" 	  	+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Document_Year$IGN"   	+ num + ".disabled = true");
				eval("document.search.Lien_Holder_Name$IGN"	  			+ num + ".disabled = true");
				eval("document.search.Additional_Lien_Name$IGN" 			+ num + ".disabled = true");
				eval("document.search.Lien_Holder_Address$IGN"  			+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Amount$IGN" 			+ num + ".disabled = true");
				eval("document.search.Debtor_Name$IGN"	  				+ num + ".disabled = true");
				eval("document.search.Debtor_Address$IGN"	  			+ num + ".disabled = true");
				eval("document.search.Attorney_Name$IGN"  	  			+ num + ".disabled = true");
				eval("document.search.Attorney_Address$IGN"	  			+ num + ".disabled = true");
				eval("document.search.Judgment_Lien_Remarks$IGN"  	  	+ num + ".disabled = true");

				// clear all in sections
				eval("document.search.Judgment_Lien_Type$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Against$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Favor$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Executed_Month$IGN" 	+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Executed_Day$IGN" 	  	+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Executed_Year$IGN" 	+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Recording_Month$IGN" 	+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Recording_Day$IGN" 	+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Recording_Year$IGN"	+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Book$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Page$IGN"	  	  	+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Document_No$IGN" 	  	+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Document_Year$IGN"   	+ num + ".value = ''");
				eval("document.search.Lien_Holder_Name$IGN"	  			+ num + ".value = ''");
				eval("document.search.Additional_Lien_Name$IGN" 			+ num + ".value = ''");
				eval("document.search.Lien_Holder_Address$IGN"  			+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Amount$IGN" 			+ num + ".value = ''");
				eval("document.search.Debtor_Name$IGN"	  				+ num + ".value = ''");
				eval("document.search.Debtor_Address$IGN"	  			+ num + ".value = ''");
				eval("document.search.Attorney_Name$IGN"  	  			+ num + ".value = ''");
				eval("document.search.Attorney_Address$IGN"	  			+ num + ".value = ''");
				eval("document.search.Judgment_Lien_Remarks$IGN"  	  	+ num + ".value = ''");
				clearRadio('Judgment_Lien_Not_Found','Judgment_Lien_Secured$IGN');
			}
		} else {
			for (num = 1; num<=8; num++) {
				// enable all in sections
				eval("document.search.Judgment_Lien_Type$IGN" 	  		+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Against$IGN" 	  	 	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Favor$IGN" 	  		+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Executed_Month$IGN" 	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Executed_Day$IGN" 	  	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Executed_Year$IGN" 	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Recording_Month$IGN"  	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Recording_Day$IGN" 	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Recording_Year$IGN"	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Book$IGN" 	  		+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Page$IGN"	  	   	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Document_No$IGN" 	   	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Document_Year$IGN"    	+ num + ".disabled = false");
				eval("document.search.Lien_Holder_Name$IGN"	  		 	+ num + ".disabled = false");
				eval("document.search.Additional_Lien_Name$IGN" 		 	+ num + ".disabled = false");
				eval("document.search.Lien_Holder_Address$IGN"  		 	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Amount$IGN" 		 	+ num + ".disabled = false");
				eval("document.search.Debtor_Name$IGN"	  				+ num + ".disabled = false");
				eval("document.search.Debtor_Address$IGN"	  		 	+ num + ".disabled = false");
				eval("document.search.Attorney_Name$IGN"  	  		 	+ num + ".disabled = false");
				eval("document.search.Attorney_Address$IGN"	  		 	+ num + ".disabled = false");
				eval("document.search.Judgment_Lien_Remarks$IGN"  	   	+ num + ".disabled = false");
			}
		}
	}

	// once tax status radio button is clicked disable other dates and put focus on date chosen
	function getStatus(status,num,format) {
		if (status == "Paid") {
			eval("document.search.Tax_Due_Month$IGN" 	+ num + ".disabled = true");
			eval("document.search.Tax_Due_Day$IGN" 	     + num + ".disabled = true");
			eval("document.search.Tax_Due_Year$IGN" 		+ num + ".disabled = true");
			eval("document.search.Delinquent_Amount$IGN" + num + ".disabled = true");

			eval("document.search.Tax_Due_Month$IGN" 	+ num + ".value = ''");
			eval("document.search.Tax_Due_Day$IGN" 		+ num + ".value = ''");
			eval("document.search.Tax_Due_Year$IGN" 		+ num + ".value = ''");
			eval("document.search.Delinquent_Amount$IGN" + num + ".value = ''");
			if (format != '3') {
				eval("document.search.Paid_Thru_Month$IGN" 	+ num + ".disabled = false");
				eval("document.search.Paid_Thru_Day$IGN"   	+ num + ".disabled = false");
				eval("document.search.Paid_Thru_Year$IGN"  	+ num + ".disabled = false");
				eval("document.search.Paid_Thru_Month$IGN" 	+ num + ".focus()");
			}
			if( window.document.layers ) {
				eval("window.document.layers.paid" + num + ".visibility = 'visible'");
				eval("window.document.layers.due"  + num + ".visibility = 'hidden'");
				eval("window.document.layers.del"  + num + ".visibility = 'hidden'");
			} else {
				//eval("document.all.paid" + num + ".style.visibility = 'visible'");
				//eval("document.all.due"  + num + ".style.visibility = 'hidden'");
				//eval("document.all.del"  + num + ".style.visibility = 'hidden'");
			}

		} else if (status == "Due") {
			if (format != '3') {
				eval("document.search.Paid_Thru_Month$IGN" 	+ num + ".disabled = true");
				eval("document.search.Paid_Thru_Day$IGN"  	+ num + ".disabled = true");
				eval("document.search.Paid_Thru_Year$IGN" 	+ num + ".disabled = true");
				eval("document.search.Delinquent_Amount$IGN" + num + ".disabled = true");

				eval("document.search.Paid_Thru_Month$IGN"+ num + ".value = ''");
				eval("document.search.Paid_Thru_Day$IGN"  + num + ".value = ''");
				eval("document.search.Paid_Thru_Year$IGN" + num + ".value = ''");
				eval("document.search.Delinquent_Amount$IGN" + num + ".value = ''");
			}
			eval("document.search.Tax_Due_Month$IGN" + num + ".disabled = false");
			eval("document.search.Tax_Due_Day$IGN" 	 + num + ".disabled = false");
			eval("document.search.Tax_Due_Year$IGN"  + num + ".disabled = false");
			eval("document.search.Tax_Due_Month$IGN" + num + ".focus()");

			if( window.document.layers ) {
				eval("window.document.layers.paid" + num + ".visibility = 'hidden'");
				eval("window.document.layers.due"  + num + ".visibility = 'visible'");
				eval("window.document.layers.del"  + num + ".visibility = 'hidden'");
			} else {
				//eval("document.all.paid" + num + ".style.visibility = 'hidden'");
				//eval("document.all.due"  + num + ".style.visibility = 'visible'");
				//eval("document.all.del"  + num + ".style.visibility = 'hidden'");
			}

		} else if (status == "Delinquent") {
			if (format != '3') {
				eval("document.search.Paid_Thru_Month$IGN" + num + ".disabled = true");
				eval("document.search.Paid_Thru_Day$IGN"   + num + ".disabled = true");
				eval("document.search.Paid_Thru_Year$IGN"  + num + ".disabled = true");
				eval("document.search.Paid_Thru_Month$IGN"+ num + ".value = ''");
				eval("document.search.Paid_Thru_Day$IGN"  + num + ".value = ''");
				eval("document.search.Paid_Thru_Year$IGN" + num + ".value = ''");
				eval("document.search.Delinquent_Amount$IGN" + num + ".disabled = false");
				eval("document.search.Delinquent_Amount$IGN" + num + ".focus()");
			}

			eval("document.search.Tax_Due_Month$IGN" + num + ".disabled = true");
			eval("document.search.Tax_Due_Day$IGN" 	 + num + ".disabled = true");
			eval("document.search.Tax_Due_Year$IGN"  + num + ".disabled = true");

			eval("document.search.Tax_Due_Month$IGN"  + num + ".value = ''");
			eval("document.search.Tax_Due_Day$IGN" 	  + num + ".value = ''");
			eval("document.search.Tax_Due_Year$IGN"   + num + ".value = ''");


			if( window.document.layers ) {
				eval("window.document.layers.paid" + num + ".visibility = 'hidden'");
				eval("window.document.layers.due"  + num + ".visibility = 'hidden'");
				eval("window.document.layers.del"  + num + ".visibility = 'visible'");
			} else {
				//eval("document.all.paid" + num + ".style.visibility = 'hidden'");
				//eval("document.all.due"  + num + ".style.visibility = 'hidden'");
				//eval("document.all.del"  + num + ".style.visibility = 'visible'");
			}
		} else {
			//
		}

	}

	// if assessment building or assessment land is zero set to empty string
	function checkZero(input) {
		if (eval(input + ".value == '0'") || eval(input + ".value == '0.00'") || eval(input + ".value == '$0.00'") || eval(input + ".value == '0.0'")) {
			eval(input + ".value = ''");
		}
	}

	// book and page or doc no check
	function checkBook(book,page,docno,num) {
		if ((eval(book + num + ".value != ''") && eval(page + num + ".value == ''")) || (eval(book + num + ".value == ''") && eval(page + num + ".value != ''")) ||  (eval(book + num + ".value != ''") && eval(page + num + ".value != ''"))) {
			eval(docno + num + ".disabled = true");
		} else if (eval(docno + num + ".value != ''") && eval(book + num + ".value == ''") && eval(page + num + ".value == ''")) {
			eval(book + num + ".disabled = true");
			eval(page + num + ".disabled = true");
		} else {
			eval(book  + num + ".disabled = false");
			eval(page  + num + ".disabled = false");
			eval(docno + num + ".disabled = false");
		}
	}

	// open help file in new window
	function help(file) {
		windowHelp = window.open(file, 'HelpFullWindow', 'scrollbars=yes,resizable=yes');
		windowHelp.focus();
		if (windowHelp.opener == null) windowHelp.opener = self;
	}

	function priceCheck(form,item,num) {
		str = item;
		if (str.charAt(0) == 'p' && (eval("document." + form + "." + item + ".value != '0' && document." + form + "." + item +  ".value != ''"))) {
			eval("document." + form + ".status$IGN" + num + ".value = document." + form + ".price$IGN" + num + ".value");
			eval("document." + form + ".status$IGN" + num + "[0].checked = true");
		} else if (eval("document." + form + "." + item + ".value == 'quote' || document." + form + "." + item + ".value == 'na'")) {
			eval("document." + form + ".price$IGN" + num + ".value = ''");
			eval("document." + form + ".status$IGN" + num + "[0].checked = false");
			if(form == 'appdetail') {
				eval("document." + form + ".comps$IGN" + num + ".value = ''");
			}
		}
	}


	// clear products except one specified
	function clearProduct(type,except) {
		if(except != 'order$hve'		   	) { if(document.order.order$hve$ordered 		!= null) 	document.order.order$hve$ordered.checked			= false; }
		if(except != 'order$valueweb'	   	) { if(document.order.order$valueweb$ordered 	!= null) 	document.order.order$valueweb$ordered.checked		= false; }
		if(except != 'order$cs'		   	) { if(document.order.order$cs$ordered 			!= null) 	document.order.order$cs$ordered.checked            	= false; }
		if(except != 'order$cs_data'	   	) { if(document.order.order$cs_data$ordered 		!= null) 	document.order.order$cs_data$ordered.checked       	= false; }
		if(except != 'order$EquiValue'	) { if(document.order.order$EquiValue$ordered 	!= null) 	document.order.order$EquiValue$ordered.checked     	= false; }
		if(except != 'order$EquiValuePlus'	) { if(document.order.order$EquiValuePlus$ordered != null)  document.order.order$EquiValuePlus$ordered.checked 	= false; }
		if('product' != type) {
			if(document.order.order$appraisal$ordered != null) 	document.order.order$appraisal$ordered.checked = false;
			if(document.order.order$title$ordered 	  != null)	document.order.order$title$ordered.checked     = false;
			if(document.order.order$info$ordered 	  != null) 	document.order.order$info$ordered.checked      = false;
			if(document.order.order$recording$ordered != null) 	document.order.order$recording$ordered.checked = false;
			if(document.order.order$prop$ordered 	  != null) 	document.order.order$prop$ordered.checked      = false;
			if(document.order.order$closing$ordered   != null) 	document.order.order$closing$ordered.checked   = false;
		}
	}

	// clear products except one specified
	function clearAddress(except) {
		if(except != "AddressInfoList$AddressInfoNew"	) { if(document.order.AddressInfoList$AddressInfoNew$selected != null) document.order.AddressInfoList$AddressInfoNew$selected.checked = false; }

		for (i=1; i <= 4; i++) {
			if(except != "AddressInfoList$AddressInfo$" + i) {
				if(eval("document.order.AddressInfoList$AddressInfo$" + i + "$selected != null")) {
					eval("document.order.AddressInfoList$AddressInfo$" + i + "$selected.checked = false");
				}
			}
		}

	}


/*
	// clear avm radio buttons if product is checked
	function clearAVM() {
		len = document.order.AVM.length;
		for (j=0; j < len; j++) {
			eval("document.order.AVM[" + j + "]" + ".checked = false");
		}
		document.order.EquiValue.checked = false;
		document.order.EquiValuePlus.checked = false;
	}

	function clearProduct() {
		for(i=1; i<7; i++) {
			if(document.order.elements[i].type == "checkbox") {
				document.order.elements[i].checked = false;
			} else {
				return;
			}
		}
		document.order.EquiValue.checked = false;
		document.order.EquiValuePlus.checked = false;
	}

	//clear everything except EquiValue checked
	function clearEquiValue(num){
		if(num == 1){
			document.order.EquiValuePlus.checked = false;
		}else{
			document.order.EquiValue.checked = false;
		}

		len = document.order.AVM.length;
		for (j=0; j < len; j++) {
			eval("document.order.AVM[" + j + "]" + ".checked = false");
		}
		for(i=1; i<7; i++) {
		}
	}
*/
	// keep track of grantee/grantor focus
	var grantee = true;
	function setFlag(obj) {
		grantee = obj;
	}

	// add tenancy and vesting info to grantee/grantor
	function addChoice(obj,type,num) {
		if (type == 'deed') {
			field1 = "Grantee";
			field2 = "Grantor";
		} else {
			field1 = "Chain_Grantee";
			field2 = "Chain_Grantor";
		}
		text = obj.options[obj.selectedIndex].value;
		if (grantee == true) {
			for (i=1; i<=7; i++) {
				if (eval("document.search." + field1 + "$IGN1" + num + ".value != '' && document.search." + field1 + "$IGN" + i + num + ".value == ''")) {
					tbox = eval("document.search." + field1 + "$IGN" + i + num);
					tbox.value = text;
					obj.selectedIndex = 0;
					return;
				}
			}
		} else {
			for (i=1; i<=7; i++) {
				if (eval("document.search." + field2 + "$IGN1" + num + ".value != '' && document.search." + field2 + "$IGN" + i + num + ".value == ''")) {
					tbox = eval("document.search." + field2 + "$IGN" + i + num);
					tbox.value = text;
					obj.selectedIndex = 0;
					return;
				}
			}
		}
	}

	function firstFocus() {
		if(!document.location.pathname == "/login/util/submit_search.html?error=1") {
			effmon = document.search.Effective_Month.value;
			if(effmon == "" && document.location.pathname == "/login/util/submit_search.html") {
			document.search.Effective_Month.focus();
			}
		}
	}

	function makeDate(month, day, year) {
		aday = new Date(year,month,day);
		return(aday);
	}

	function compDate(section,num) {
		if(section == "deed") {
			smonth    = eval("document.search.Deed_Signature_Month$IGN" + num + ".selectedIndex") - 1;
			sday	 	= eval("document.search.Deed_Signature_Day$IGN" + num + ".value");
			syear	= eval("document.search.Deed_Signature_Year$IGN" + num + ".value");
			rmonth 	= eval("document.search.Deed_Recording_Month$IGN" + num + ".selectedIndex") - 1;
			rday	 	= eval("document.search.Deed_Recording_Day$IGN" + num + ".value");
			ryear	= eval("document.search.Deed_Recording_Year$IGN" + num + ".value");
		} else if (section == "mtg") {
			smonth    = eval("document.search.Mortgage_Signature_Month$IGN" + num + ".selectedIndex") - 1;
			sday	 	= eval("document.search.Mortgage_Signature_Day$IGN" + num + ".value");
			syear	= eval("document.search.Mortgage_Signature_Year$IGN" + num + ".value");
			rmonth 	= eval("document.search.Mortgage_Recording_Month$IGN" + num + ".selectedIndex") - 1;
			rday	 	= eval("document.search.Mortgage_Recording_Day$IGN" + num + ".value");
			ryear	= eval("document.search.Mortgage_Recording_Year$IGN" + num + ".value");
		} else if (section == "ass") {
			smonth    = eval("document.search.Mortgage_Assigned_Executed_Month$IGN" + num + ".selectedIndex") - 1;
			sday	 	= eval("document.search.Mortgage_Assigned_Executed_Day$IGN" + num + ".value");
			syear	= eval("document.search.Mortgage_Assigned_Executed_Year$IGN" + num + ".value");
			rmonth 	= eval("document.search.Mortgage_Assigned_Recording_Month$IGN" + num + ".selectedIndex") - 1;
			rday	 	= eval("document.search.Mortgage_Assigned_Recording_Day$IGN" + num + ".value");
			ryear	= eval("document.search.Mortgage_Assigned_Recording_Year$IGN" + num + ".value");
		} else if (section == "chain") {
			smonth    = eval("document.search.Chain_Signature_Month$IGN" + num + ".selectedIndex") - 1;
			sday	 	= eval("document.search.Chain_Signature_Day$IGN" + num + ".value");
			syear	= eval("document.search.Chain_Signature_Year$IGN" + num + ".value");
			rmonth 	= eval("document.search.Chain_Recording_Month$IGN" + num + ".selectedIndex") - 1;
			rday	 	= eval("document.search.Chain_Recording_Day$IGN" + num + ".value");
			ryear	= eval("document.search.Chain_Recording_Year$IGN" + num + ".value");
		}
		if(syear == "" || ryear == "") {
			return;
		} else {
			signdate = makeDate(smonth, sday, syear);
			recdate  = makeDate(rmonth, rday, ryear);
			if( Date.parse(recdate.toString()) < Date.parse(signdate.toString())) {
				if (!(section == "ass")) {
					alert("The Recording Date should be later than the Signature Date!");
				} else {
					alert("The Recording Date should be later than the Executed Date!");
				}
			}
		}
	}

	var taxcount = 0;

	function setTaxId() {
		taxval = document.search.taxval.value;
		if(taxcount==0 && taxval=="") {
			taxid = document.search.Tax_Id$IGN1.value;
			document.search.Tax_Id$IGN2.value = taxid;
			document.search.Tax_Id$IGN3.value = taxid;
			document.search.Tax_Id$IGN4.value = taxid;
			document.search.Tax_Id$IGN5.value = taxid;
			taxcount++;
		}
	}

	function unCheck(section) {
		eval(section + ".checked = false");
	}

	function clearCheck(check1,check2,check3,check4,none) {
		if (!none && eval("document.search." + check1 + ".checked")) {
			eval("document.search." + check2 + ".checked = false");
			eval("document.search." + check3 + ".checked = false");
			eval("document.search." + check4 + ".checked = false");
		} else {
			eval("document.search." + check1 + ".checked = false");
		}
	}

	function formatPhone(item) {
		phoneno = document.order.elements[item].value;
		if (phoneno.length == 3) {
			phoneno = phoneno + "-";
		} else if (phoneno.length == 7) {
			phoneno = phoneno + "-";
		}

		document.order.elements[item].value = phoneno;

	}

	function formatSSN(item) {
		ssn = document.order.elements[item].value;
		if (ssn.length == 3) {
			ssn += "-";
		} else if (ssn.length == 6) {
			ssn += "-";
		}

		document.order.elements[item].value = ssn;

	}

	function formatDate(item) {
		adate = document.order.elements[item].value;
		if (adate.length == 2) {
			adate += "/";
		} else if (adate.length == 5) {
			adate += "/";
		}

		document.order.elements[item].value = adate;

	}

	function setHidden(form,value) {
		eval("document." + form + ".Method.value = value");
		eval("document." + form + ".submit()");
	}

	var ischecked = false;

	function changeCheck() {
		if (document.search.Mortgage_Not_Found.checked) {
			ischecked = true;
		} else {
			ischecked = false;
		}
	}

	function checkCleared(objname) {
		if (ischecked) {
			eval("document.search." + objname + ".value = ''");
		}
	}

	var diff = new Array(5);
	diff[0] = 11;
	diff[1] = 11;
	diff[2] = 11;
	diff[3] = 11;
	diff[4] = 11;
	var disabled = 0;

	function allowChains(typist) {
		if (!typist) {
			for (num = 1; num <= 5; num++) {
				mtgmonth  = eval("document.search.Mortgage_Signature_Month$IGN" + num + ".selectedIndex") - 1;
				mtgday    = eval("document.search.Mortgage_Signature_Day$IGN" + num + ".value");
				mtgyear   = eval("document.search.Mortgage_Signature_Year$IGN" + num + ".value");
				deedmonth = document.search.Deed_Signature_Month$IGN1.selectedIndex - 1;
				deedday   = document.search.Deed_Signature_Day$IGN1.value;
				deedyear  = document.search.Deed_Signature_Year$IGN1.value;
				if (mtgyear != "" && deedyear != "") {
					mtgdate   = makeDate(mtgmonth, mtgday, mtgyear);
					deeddate  = makeDate(deedmonth, deedday, deedyear);
					diff[num-1] = Math.abs(deeddate.getTime() - mtgdate.getTime())/(1000*60*60*24);
				}
			}
			disabled   = 0;
			for (i = 0; i < diff.length; i++) {
				if (diff[i] <= 10) disabled++;
			}
			if (disabled > 0) {
				document.search.Chain_Required.value = 'No';
				disableChain(true);
			} else {
				document.search.Chain_Required.value = 'Yes';
				disableChain(false);
			}
		}
	}

	function disableChain(bool) {
		if (bool) {
			for (num = 1; num<=8; num++) {
				// disable all in sections
				for (j=0; j < 3; j++) {
					eval("document.search.Chain_Vesting$IGN"  + num + "[" + j + "]" + ".disabled = true");
				}
				eval("document.search.Chain_Book$IGN" 	  				+ num + ".disabled = true");
				eval("document.search.Chain_Page$IGN" 	  				+ num + ".disabled = true");
				eval("document.search.Chain_Document_No$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Chain_Signature_Month$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Chain_Signature_Day$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Chain_Signature_Year$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Chain_Recording_Month$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Chain_Recording_Day$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Chain_Recording_Year$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Chain_Consideration$IGN" 	  		+ num + ".disabled = true");
				eval("document.search.Chain_Remarks$IGN" 	  			+ num + ".disabled = true");

				// clear all in sections
				for (k = 1; k <= 7; k++) {
					eval("document.search.Chain_Grantor$IGN" 	  		+ k +  num + ".value = ''");
					eval("document.search.Chain_Grantee$IGN" 	  		+ k +  num + ".value = ''");
				}
				for (j=0; j < 3; j++) {
					eval("document.search.Chain_Vesting$IGN"  + num + "[" + j + "]" + ".checked = false");
				}
				eval("document.search.Chain_Book$IGN" 	  				+ num + ".value = ''");
				eval("document.search.Chain_Page$IGN" 	  				+ num + ".value = ''");
				eval("document.search.Chain_Document_No$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Chain_Signature_Month$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Chain_Signature_Day$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Chain_Signature_Year$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Chain_Recording_Month$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Chain_Recording_Day$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Chain_Recording_Year$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Chain_Consideration$IGN" 	  		+ num + ".value = ''");
				eval("document.search.Chain_Remarks$IGN" 	  			+ num + ".value = ''");
			}
		} else {
			for (num = 1; num<=8; num++) {
				// enable all in section
				for (j=0; j < 3; j++) {
					eval("document.search.Chain_Vesting$IGN"  + num + "[" + j + "]" + ".disabled = false");
				}
				eval("document.search.Chain_Book$IGN" 					+ num + ".disabled = false");
				eval("document.search.Chain_Page$IGN" 					+ num + ".disabled = false");
				eval("document.search.Chain_Document_No$IGN" 			+ num + ".disabled = false");
				eval("document.search.Chain_Signature_Month$IGN" 			+ num + ".disabled = false");
				eval("document.search.Chain_Signature_Day$IGN" 			+ num + ".disabled = false");
				eval("document.search.Chain_Signature_Year$IGN" 			+ num + ".disabled = false");
				eval("document.search.Chain_Recording_Month$IGN" 			+ num + ".disabled = false");
				eval("document.search.Chain_Recording_Day$IGN" 			+ num + ".disabled = false");
				eval("document.search.Chain_Recording_Year$IGN" 			+ num + ".disabled = false");
				eval("document.search.Chain_Consideration$IGN" 			+ num + ".disabled = false");
				eval("document.search.Chain_Remarks$IGN" 				+ num + ".disabled = false");
			}

		}
	}

	function clearChain(objname) {
		if (disabled > 0) {
			eval("document.search." + objname + ".value = ''");
		}
	}

	// open file in new window
	function openup(file, name) {
		window.open(file, name, 'scrollbars=yes,resizable=yes');
	}

	// set action on title search form in response to questions

	function setAction() {
		if (document.search.question1.checked || document.search.question2.checked || document.search.question3.checked || document.search.question4.checked) {
			document.search.submit.disabled = true;
		} else {
			document.search.submit.disabled = false;
		}
	}

	function checkFields() {
		if (document.attach.order_no.value == "") {
			alert("A value is required for Order No");
			document.attach.order_no.focus();
			return false;
		}
		if (document.attach.email_address.value == "") {
			alert("A value is required for Email Address");
			document.attach.email_address.focus();
			return false;
		}
		if (document.attach.description.value == "") {
			alert("A value is required for Description");
			document.attach.description.focus();
			return false;
		}
		return true;
	}



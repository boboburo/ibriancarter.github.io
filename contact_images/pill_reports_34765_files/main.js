<!--

function external_link_init() {
  if (!document.getElementById || !document.getElementsByTagName) return;
  links = document.getElementsByTagName('a');
  for (var i = 0; i < links.length; i++) {
    if (links[i].rel.indexOf('external') == -1) continue;
    links[i].target = "_blank";
  }
}

/*
 * Image Preloaders
 */
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

/*
 * Bookmark page
 */
function addBookmark(url, title) {

	var Netscape, MSIE, Opera;

	Netscape = navigator.appName == "Netscape";
	MSIE = navigator.appName == "Microsoft Internet Explorer";
	Opera = navigator.userAgent.indexOf("Opera") > -1;

	if ( Netscape ) {
		window.sidebar.addPanel(title, url,"");
	} else if( MSIE && !Opera ) {
		window.external.AddFavorite(url, title);
	} else if( Opera && window.opera && window.print ) {
		// Currently no way of automaticlly bookmarking for Opera
		alert("Please select ok and then press (Ctrl+t) to bookmark");
	} else {
		// For other browsers then Netscape, MSIE and opera
		alert("Please bookmark your site using your browsers bookmarking facilities");
	}
}

function getObj(name)
{
  if (document.getElementById)
  	return document.getElementById(name);
  else if (document.all)
	return document.all[name];
  else if (document.layers)
   	return document.layers[name];
}

/*
 * fields
 */
function reagentFields(hide){

    // display accordingly
	var reResults = new getObj('reagent_results');

	if(hide == 1)
		reResults.style.display = "block";
    else
		reResults.style.display = "";
}

function consumedFields(hide){

    // display accordingly
	var consumed = new getObj('consumed_pill');

	if(hide == 1)
		consumed.style.display = "block";
    else
		consumed.style.display = "";
}

function supportStatus(id){

    // display accordingly
	var support = new getObj('supportStatus_'+id);
	var supportA = new getObj('supportA_'+id);

	if(support.style.display == "block"){
		support.style.display = "";
		supportA.innerHTML = "[+]";
    } else {
		support.style.display = "block";
		supportA.innerHTML = "[-]";
	}
}

/*
 * regions
 */

var subRegions = new Array(); // array for regions

var allSubs = 0;
var addNoSub = 0;

var selectUpper = "<table style=\"padding: 0;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">"+
          "<tr class='sub_region_tr'>" +
		    "<td class=\"td_left sub_region_heading_td\">Sub-Region:</td>" +
		    "<td class='sub_region_td'>" +
              "<select name=\"sub_region\">";

var selectLower = "</select></td></tr></table>";

function changeRegion(value) {

	var subRegionExists = false;    // sub region exists
	var completeHTML = selectUpper; // complete html if region exists
	var inner = "";                 // inner html
	var subRegion = new getObj('sub_region');

	if(allSubs)
		completeHTML += "<option value=\"all\">All</option>";

	if(addNoSub)
		completeHTML += "<option value=\"0\"></option>";

	// check if region has sub regions and build html
	for(var i=0; i<subRegions.length; i++){
		if(subRegions[i][0] == value){
			completeHTML += "<option value=\""+subRegions[i][1]+"\">"+subRegions[i][2]+"</option>\n";
			subRegionExists = true;
		}
	}

	// set html depending on if region exists
	if(!subRegionExists){
		inner = "";
	}else{
		completeHTML += selectLower;
		inner = completeHTML;
	}

	subRegion.innerHTML = inner;

}

function addAll(){

	allSubs = 1;
}

function addNone(){

	addNoSub = 1;
}

function addSubRegion(reg,subReg,name) {

	// add sub region
	subRegions[subRegions.length] = new Array(reg,subReg,name);

}

-->
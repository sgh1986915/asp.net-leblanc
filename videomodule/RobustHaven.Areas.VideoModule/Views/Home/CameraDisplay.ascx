<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<RobustHaven.Areas.VideoModule.Models.VideoModuleCamera>" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE></TITLE>
<META content="text/html; charset=windows-1252" http-equiv=Content-Type>
<META content=no-cache http-equiv=Pragma>
<SCRIPT language=JavaScript>
<!--
	var chasm = screen.availWidth;
	var mount = screen.availHeight;
	var IpAddress = 0;
	var LivexExist = false;

	var sizeFlag1 = 1;
	var sizeFlag2 = 1;



	var BrowserDetect = {
		init: function () {
			this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
			this.version = this.searchVersion(navigator.userAgent)
			|| this.searchVersion(navigator.appVersion)
			|| "an unknown version";
			this.OS = this.searchString(this.dataOS) || "an unknown OS";
		},
		searchString: function (data) {
			for (var i = 0; i < data.length; i++) {
				var dataString = data[i].string;
				var dataProp = data[i].prop;
				this.versionSearchString = data[i].versionSearch || data[i].identity;
				if (dataString) {
					if (dataString.indexOf(data[i].subString) != -1)
						return data[i].identity;
				}
				else if (dataProp)
					return data[i].identity;
			}
		},
		searchVersion: function (dataString) {
			var index = dataString.indexOf(this.versionSearchString);
			if (index == -1) return;
			return parseFloat(dataString.substring(index + this.versionSearchString.length + 1));
		},
		dataBrowser: [
		{ string: navigator.userAgent,
			subString: "OmniWeb",
			versionSearch: "OmniWeb/",
			identity: "OmniWeb"
		},
		{
			string: navigator.vendor,
			subString: "Apple",
			identity: "Safari"
		},
		{
			prop: window.opera,
			identity: "Opera"
		},
		{
			string: navigator.vendor,
			subString: "iCab",
			identity: "iCab"
		},
		{
			string: navigator.vendor,
			subString: "KDE",
			identity: "Konqueror"
		},
		{
			string: navigator.userAgent,
			subString: "Firefox",
			identity: "Firefox"
		},
		{
			string: navigator.vendor,
			subString: "Camino",
			identity: "Camino"
		},
		{		// for newer Netscapes (6+)
			string: navigator.userAgent,
			subString: "Netscape",
			identity: "Netscape"
		},
		{
			string: navigator.userAgent,
			subString: "MSIE",
			identity: "Explorer",
			versionSearch: "MSIE"
		},
		{
			string: navigator.userAgent,
			subString: "Gecko",
			identity: "Mozilla",
			versionSearch: "rv"
		},
		{ 		// for older Netscapes (4-)
			string: navigator.userAgent,
			subString: "Mozilla",
			identity: "Netscape",
			versionSearch: "Mozilla"
		}
	],
		dataOS: [
		{
			string: navigator.platform,
			subString: "Win",
			identity: "Windows"
		},
		{
			string: navigator.platform,
			subString: "Mac",
			identity: "Mac"
		},
		{
			string: navigator.platform,
			subString: "Linux",
			identity: "Linux"
		}
	]

	};
	BrowserDetect.init();


	function Play() {

		if (LivexExist) {

			try {

				//document.WebCamX1.ChangeQualityX(0);
				document.WebCamX1.IpAddress= '<%:Model.DNSRecord %>';
				document.WebCamX1.SetCntDeviceType(0);
				document.WebCamX1.EnableAutoScreenSize(1);
				document.WebCamX1.CommandPort = 4550;
				document.WebCamX1.DataPort = 5550;
				document.WebCamX1.AudioDataPort = 6550;
				document.WebCamX1.AutoSetCamera = 1;
				document.WebCamX1.Username = '<%:Model.UserName %>';
				document.WebCamX1.Password = '<%:Model.Password %>';
				document.WebCamX1.DisablePWD = 1;
				document.WebCamX1.DefaultCam = <%:Model.CameraNumber %>;
				document.WebCamX1.PlayX();  
			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}



	function PTZControl() {
		if (LivexExist) {
			try {

				document.WebCamX1.PTZControlX();
				//document.WebCamX1.SetInfo(94,0,0,"",0);

			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}


	function ShowSystemMenu() {

		if (LivexExist) {
			try {
				document.WebCamX1.ShowSYSMenu();

			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}


	function IOControl() {
		if (LivexExist) {
			try {
				document.WebCamX1.IOControlX();
				//document.WebCamX1.SetInfo(107,0,0,"",0);

			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}




	function FileSave() {
		if (LivexExist) {
			try {

				document.WebCamX1.SaveX();

			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}


	function Stop() {
		if (LivexExist) {
			try {

				document.WebCamX1.StopX();

			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}

	function Zoom() {
		if (LivexExist) {
			try {
				//document.WebCamX1.ShowZoomMenu();
				document.WebCamX1.FullScreenX();

			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}





	function SnapShot() {
		if (LivexExist) {
			try {

				document.WebCamX1.SnapShotX();

			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}


	function ShowCamMenu() {
		if (LivexExist) {
			try {
				document.WebCamX1.ShowCamMenuX();

			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}

	function ChangeQuality() {
		if (LivexExist) {
			try {
				document.WebCamX1.ShowQulMenuX();
			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}

	function AudioControl() {
		if (LivexExist) {
			try {
				document.WebCamX1.AudioControlX();
			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}

	function MicControl() {
		if (LivexExist) {
			try {
				document.WebCamX1.MicControlX();
			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}


	function CreateX() {

		try {
			//document.WebCamX1.CreateX();
			if (IpAddress == 0) {
				document.WebCamX1.IpAddress = "avs.dipmap.com";
			}
			else {
				document.WebCamX1.IpAddress = "avs.dipmap.com";
			}
			document.WebCamX1.CommandPort = CommandPort;
			document.WebCamX1.DataPort = DataPort;
			document.WebCamX1.AudioDataPort = AudioPort;
			document.WebCamX1.AutoSetCamera = 3;

			document.WebCamX1.SetInfo(125, 1, 0, "", "");
			document.WebCamX1.SetInfo(129, 1, 0, "", "");
			document.WebCamX1.SetUpdateInfo(100, "WebCam", 0, "", 8200, 0, 0);
			LivexExist = true;

		} catch (e) {
			alert("ActiveX downloading please refresh");
			LivexExist = false;
		}

	}

	function DestroyX() {
		if (LivexExist) {
			try {
				document.WebCamX1.DestroyX();
			} catch (e) {
				alert("ActiveX downloading please refresh");
			}
		}
	}

	var RPBPlayer = null;
	var bRPBPlayerOpen = false;
	var sRPBInfo;

	function PlayRPB(RPBInfo) {
		var HostType, DBType, CamIndex, DateTime;
		var data, strRPBInfo, index;

		// RPBInfo : HostType+DBType+CamIndex+DateTime
		if (RPBInfo != "") {

			data = RPBInfo.split("+");

			HostType = data[0];
			DBType = data[1];
			CamIndex = data[2];
			DateTime = data[3];
		}
		else
			return;

		if (bRPBPlayerOpen == false) {

			var sLink = "SingleRPBPlayer.htm?IDKey=" + document.form1.IDKey.value;
			RPBPlayer = window.open(sLink, '', 'height=320, width=420,toolbar=no, menubar=no, scrollbars=no, resizable=no, status=yes');
			bRPBPlayerOpen = true;
			sRPBInfo = RPBInfo;
		}
		else {
			RPBPlayer.PlayRPB(HostType, DBType, CamIndex, DateTime);
		}
	}

	function RPBLoginOK() {
		var HostType, DBType, CamIndex, DateTime;

		// RPBInfo : HostType+DBType+CamIndex+DateTime
		if (sRPBInfo != "") {

			data = sRPBInfo.split("+");

			HostType = data[0];
			DBType = data[1];
			CamIndex = data[2];
			DateTime = data[3];
		}
		RPBPlayer.PlayRPB(HostType, DBType, CamIndex, DateTime);
	}

	function RPBPlayerClose() {
		bRPBPlayerOpen = false;
	}

	function MyExit() {
		if (RPBPlayer != null) {
			RPBPlayer.close();
		}
	}

	function OCXChecker() {
		OCXChecker1.StartOCXChecker("OCXChecker.txt", document.location);

	}
//-->
</SCRIPT>

<SCRIPT id=clientEventHandlersJS language=javascript> 
<!--
	function OCXCheckerComplete() {
		LivexExist = true;
		CreateX();
		Play();
	} 
--> 
  </SCRIPT>

<SCRIPT id=clientEventHandlersJS language=javascript> 
<!--
	function OCXCheckerDownloadComplete() {
		window.location.reload();
	} 
--> 
  </SCRIPT>

<SCRIPT id=clientEventHandlersJS language=javascript> 
<!--
	function OCXCheckerDownloadCancel() {
		window.close();
	} 
--> 
  </SCRIPT>

<SCRIPT id=clientEventHandlersJS language=javascript> 
<!--
	function OnUpdateTitle() {
		//sTitle = WebCamX1.GetAlarmCaption();
		//document.title = sTitle;


		var IEName = BrowserDetect.browser;
		var IEVersion = BrowserDetect.version;
		var AppTitle = " - Microsoft Internet Explorer";

		if (IEName == "Explorer" && IEVersion == "7") {
			AppTitle = " - Windows Internet Explorer";
		}
		else {
			AppTitle = " - Microsoft Internet Explorer";
		}


		//sTemp = sTitle + AppTitle;   
		sTemp = "Webcamserver - " + document.form1.IDKey.value + AppTitle;

		WebCamX1.PopupCurrentWindow(sTemp);
	} 
--> 
  </SCRIPT>

<SCRIPT id=clientEventHandlersJS language=javascript> 
<!--
	function LoginFail() {
		//parent.location.href = "index.htm";

	} 
--> 
  </SCRIPT>

<SCRIPT id=clientEventHandlersJS language=javascript> 
<!--
	function v82_ExtraEvent(index, iCmdID, iValue, sMsg, Reserve1, Reserve2) {

//		// Login fail for time out
//		if (iCmdID == 1) {
//			parent.location.href = "Invalid.htm?ErrorID=1";
//		}
//		// Kick out user
//		else if (iCmdID == 3) {
//			parent.location.href = "Invalid.htm?ErrorID=3";
//		}
//		// Play RPB
//		else if (iCmdID == 4) {
//			PlayRPB(sMsg);
//		}
		PlayRPB(sMsg);
	} 
--> 
  </SCRIPT>

<SCRIPT language=JavaScript1.2 type=text/javascript>
	IpAddress = "0"
	CommandPort = 4550
	DataPort = 5550
	AudioPort = 6550
</SCRIPT>


<SCRIPT language=javascript for=OCXChecker1 event=Complete>
<!--
 OCXCheckerComplete()
//-->
  </SCRIPT>

<SCRIPT language=javascript for=OCXChecker1 event=DownloadComplete>
<!--
 OCXCheckerDownloadComplete()
//-->
  </SCRIPT>

<SCRIPT language=javascript for=OCXChecker1 event=DownloadCancel>
<!--
 OCXCheckerDownloadCancel()
//-->
  </SCRIPT>

<SCRIPT language=javascript for=OCXChecker1 event=InstallFail>
<!--
//-->
  </SCRIPT>

<SCRIPT language=javascript for=WebCamX1 event=UpdateHTMLTitle>
<!--
 OnUpdateTitle();
//-->
  </SCRIPT>

<SCRIPT language=javascript for=WebCamX1 event=AlarmPopup>
<!--
 OnAlarmPopup();
//-->
</SCRIPT>

<SCRIPT language=javascript for=WebCamX1 event=OnLoginFail>
<!--
 LoginFail();
//-->
  </SCRIPT>

<SCRIPT language=javascript for=WebCamX1 
event="v82ExtraEvent(index, iCmdID, iValue, sMsg, Reserve1, Reserve2)">
<!--
 v82_ExtraEvent(index, iCmdID, iValue, sMsg, Reserve1, Reserve2);
//-->
  </SCRIPT>

<SCRIPT language=JavaScript1.2 type=text/javascript>
	var xmlDoc;
	var GEO_LANG_ID = "EN";

	main();    //Create XML Paser
	function main() {
		GetUsrLanguage();

		loadXML("WebTable.xml");

	}

	function loadXML(fileName) {

		// code for IE
		if (window.ActiveXObject) {
			xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async = false;
			xmlDoc.load(fileName);
			return xmlDoc;
		}
		else if (window.XMLHttpRequest) {
			xmlDoc = new window.XMLHttpRequest();
			xmlDoc.open("GET", fileName, false);
			xmlDoc.send("");
			return xmlDoc.responseXML;
		}
		else {
			//alert('Your browser cannot handle this script');
		}

		return null;
	}


	function MySelectSingleNode(xmlDocObj, elementPath) {

		if (window.ActiveXObject) {
			if (xmlDocObj == xmlDoc)
				return xmlDoc.documentElement.selectSingleNode(elementPath);
			else
				return xmlDocObj.selectSingleNode(elementPath);

		}
		else {
			if (xmlDocObj == xmlDoc)
				return xmlDoc.responseXML.getElementsByTagName(elementPath);

			else
				return xmlDocObj[0].getElementsByTagName(elementPath);
		}
	}

	function MyLoadString(singleNodeValue) {
		if (window.ActiveXObject) {

			return singleNodeValue.text;
		}
		else {
			return singleNodeValue[0].textContent
		}
	}

	function GetUsrLanguage() {
		var CY, Temp;


		if (window.ActiveXObject)
			CY = (navigator.userLanguage).toLowerCase();
		else
			CY = (navigator.language).toLowerCase();

		Temp = CY.substring(0, 2);

		if (CY == "zh-tw" || CY == "zh-hk") {
			GEO_LANG_ID = "TC";
		}
		else if (CY == "zh-ch" || CY == "zh-cn" || CY == "zh-sg") {
			GEO_LANG_ID = "SC";
		}
		else if (CY == "ja") {
			GEO_LANG_ID = "JPN";
		}
		else if (CY == "fr-be" || CY == "fr-ch" || CY == "fr") {
			GEO_LANG_ID = "FRA";
		}
		else if (Temp == "de") {
			GEO_LANG_ID = "GEN";
		}
		else if (CY == "pl") {
			GEO_LANG_ID = "POL";
		}
		else if (CY == "pt-br" || CY == "pt") {
			GEO_LANG_ID = "PTU";
		}
		else if (Temp == "es") {
			GEO_LANG_ID = "SPN";
		}
		else if (CY == "ru") {
			GEO_LANG_ID = "RUS";
		}
		else if (CY == "ar-iq" || CY == "ar-ly" || CY == "ar-ma" || CY == "ar-om" || CY == "ar-sy" || CY == "ar-lb" || CY == "ar-ae" || CY == "ar-qa"
   || CY == "ar-sa" || CY == "ar-eg" || CY == "ar-dz" || CY == "ar-tn" || CY == "ar-ye" || CY == "ar-jo" || CY == "ar-kw" || CY == "ar-bn") {
			GEO_LANG_ID = "ARB";
		}
		else if (CY == "he") {
			GEO_LANG_ID = "HEB";
		}
		else if (CY == "it") {
			GEO_LANG_ID = "ITA";
		}
		else if (CY == "cs" || CY == "sk") {
			GEO_LANG_ID = "CZH";
		}
		else if (CY == "da") {
			GEO_LANG_ID = "DAN";
		}
		else if (CY == "th") {
			GEO_LANG_ID = "TAI";
		}
		else if (CY == "nl") {
			GEO_LANG_ID = "NLD";
		}
		else if (CY == "sl" || CY == "sr") {
			GEO_LANG_ID = "SRL";
		}
		else if (CY == "hu") {
			GEO_LANG_ID = "HUN";  //¦I¤ú§Q¤å
		}
		else {
			GEO_LANG_ID = "EN";
		}

	}

	function GetXML(STRING_ID) {
		var pElement;
		var pLangResult;


		if (xmlDoc != null) {


			try {
				pElement = MySelectSingleNode(xmlDoc, STRING_ID);

				if (pElement == null)
					return STRING_ID;
			}
			catch (e) {
				return "";
			}


			try {
				pLangResult = MySelectSingleNode(pElement, GEO_LANG_ID);

				if (pLangResult == null) {

					var pEN = pElement.selectSingleNode("EN");

					if (pEN == null)
						return STRING_ID;
					else
						return MyLoadString(pLangResult);
				}
				else {
					return MyLoadString(pLangResult);
				}
			}
			catch (e) {
				return "";
			}

		}
	}


	function LoadString(STRING_ID) {
		document.write(GetXML(STRING_ID));
	}

	function LoadGetString(ID) {
		return GetXML(ID);
	}
</SCRIPT>
<LINK rel=stylesheet type=text/css href="/areas/videomodule/Content.Images.external.css">
<META name=GENERATOR content="MSHTML 9.00.8112.16430"></HEAD>
<BODY onload=OCXChecker() onunload=MyExit() 
background=/areas/videomodule/Content.Images.background.jpg bgColor=#ffffff marginheight="0" 
marginwidth="0">
<FORM method=post name=form1><INPUT id=IDKey name=IDKey 
value=60597311-0eac-4a34-b53c-a51469f80b2b type=hidden> </FORM>
<TABLE border=0 width="100%" bgColor=#f0f8ff>
  <TBODY>
  <TR>
    <TD width="100%"><B><FONT color=#000080 size=2>
      <SCRIPT language=JavaScript>      	LoadString("IDS_WEB_LIVEVIEW");</SCRIPT>
      &gt;
      <SCRIPT language=JavaScript>      	LoadString("IDS_WEB_CHANNEL1");</SCRIPT>
       </FONT></B></TD></TR></TBODY></TABLE>
<P align=center>
<OBJECT id=OCXChecker1 codeBase="cab/OCXChecker_8320.cab#version=8,3,2,0" 
classid=clsid:ADACAA8F-3595-47fe-9C31-9C7471B9BEC7 width=0 height=0><PARAM NAME="_Version" VALUE="65536"><PARAM NAME="_ExtentX" VALUE="370"><PARAM NAME="_ExtentY" VALUE="370"><PARAM NAME="_StockProps" VALUE="0"></OBJECT><!-- ImageReady Slices (CompressionSelection.jpg) --><BR>
<TABLE border=0 cellSpacing=0 cellPadding=0>
  <TBODY>
  <TR>
    <TD vAlign=middle background=/areas/videomodule/Content.Images.bg01.jpg align=center>
      <TABLE border=0 cellSpacing=0 cellPadding=10>
        <TBODY>
        <TR>
          <TD>
            <OBJECT id=WebCamX1 
            classid=clsid:8D58D690-6B71-4ee8-85AD-006DB0287BF1 width=360 
            height=300><PARAM NAME="_Version" VALUE="65536">
			<PARAM NAME="_ExtentX" VALUE="9525">
			<PARAM NAME="_ExtentY" VALUE="7938">
			<PARAM NAME="_StockProps" VALUE="0">
			<PARAM NAME="IpAddress" VALUE="avs.dipmap.com">
			<PARAM NAME="CommandPort" VALUE="4550">
			<PARAM NAME="DataPort" VALUE="5550">
			<PARAM NAME="AudioDataPort" VALUE="6550">
			<PARAM NAME="BandWidth" VALUE="LAN">
			<PARAM NAME="FixSize" VALUE="0">
			<PARAM NAME="FixWidth" VALUE="320">
			<PARAM NAME="FixHeight" VALUE="240">
			<PARAM NAME="SvrType" VALUE="0">
			<PARAM NAME="DisablePWD" VALUE="false">
			<PARAM NAME="UserName" VALUE="test">
			<PARAM NAME="Password" VALUE="test">
			<PARAM NAME="AutoLogin" VALUE="1">
			<PARAM NAME="DefaultCam" VALUE="1">
			<PARAM NAME="AutoReConnect" VALUE="-1">
			<PARAM NAME="MaxRetries" VALUE="100">
			<PARAM NAME="RetryInterval" VALUE="60">     
            </OBJECT></TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top background=/areas/videomodule/Content.Images.bg01.jpg width=32 
      align=left><MAP name=FPMap8><AREA href="javascript:ShowSystemMenu()" 
        shape=rect coords="0, 0, 32, 32"></MAP><IMG border=0 alt=Option 
      src="/areas/videomodule/Content.Images.bn_menu.jpg" useMap=#FPMap8><BR><MAP 
        name=FPMap9><AREA href="javascript:ShowCamMenu()" shape=rect 
        coords="0, 0, 32, 32"></MAP><IMG border=0 alt="Change camera" 
      src="/areas/videomodule/Content.Images.bn_switchcamera.jpg" useMap=#FPMap9><BR><MAP 
      name=FPMap10><AREA href="javascript:PTZControl()" shape=rect 
        coords="0, 0, 32, 32"></MAP><IMG border=0 alt="PTZ control" 
      src="/areas/videomodule/Content.Images.bn_ptz.jpg" useMap=#FPMap10><BR><MAP 
        name=FPMap11><AREA href="javascript:IOControl()" shape=rect 
        coords="0, 0, 32, 32"></MAP><IMG border=0 alt="I/O control" 
      src="/areas/videomodule/Content.Images.bn_io.jpg" useMap=#FPMap11><BR></TD></TR>
  <TR>
    <TD background=/areas/videomodule/Content.Images.bg.jpg colSpan=2 align=center>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
      background=/areas/videomodule/Content.Images.bg.jpg>
        <TBODY>
        <TR>
          <TD></TD>
          <TD align=left>
            <TABLE border=0 cellSpacing=0 cellPadding=0>
              <TBODY>
              <TR>
                <TD><IMG border=0 alt=Play 
                  src="/areas/videomodule/Content.Images.bn_play.jpg" useMap=#FPMap0><MAP 
                  name=FPMap0><AREA href="javascript:Play()" shape=rect 
                    coords="0, 0, 32, 32"></MAP></TD>
                <TD><IMG border=0 alt=Stop 
                  src="/areas/videomodule/Content.Images.bn_stop.jpg" useMap=#FPMap1><MAP 
                  name=FPMap1><AREA href="javascript:Stop()" shape=rect 
                    coords="0, 0, 32, 32"></MAP></TD>
                <TD><IMG border=0 alt=Mic 
                  src="/areas/videomodule/Content.Images.bn_speaker.jpg" useMap=#FPMap2><MAP 
                  name=FPMap2><AREA href="javascript:MicControl()" shape=rect 
                    coords="0, 0, 32, 32"></MAP></TD>
                <TD><IMG border=0 alt=Audio 
                  src="/areas/videomodule/Content.Images.bn_mic.jpg" useMap=#FPMap3><MAP 
                  name=FPMap3><AREA href="javascript:AudioControl()" 
                    shape=rect coords="0, 0, 32, 32"></MAP></TD>
                <TD><IMG border=0 alt="Snap shot" 
                  src="/areas/videomodule/Content.Images.bn_sanpshot.jpg" useMap=#FPMap4><MAP 
                  name=FPMap4><AREA href="javascript:SnapShot()" shape=rect 
                    coords="0, 0, 32, 32"></MAP></TD>
                <TD><IMG border=0 alt="Change quality" 
                  src="/areas/videomodule/Content.Images.bn_switchresolution.jpg" 
                  useMap=#FPMap5><MAP name=FPMap5><AREA 
                    href="javascript:ChangeQuality()" shape=rect 
                    coords="0, 0, 32, 32"></MAP></TD>
                <TD><IMG border=0 alt="File save" 
                  src="/areas/videomodule/Content.Images.bn_download.jpg" useMap=#FPMap6><MAP 
                  name=FPMap6><AREA href="javascript:FileSave()" shape=rect 
                    coords="0, 0, 32, 32"></MAP></TD>
                <TD><IMG border=0 alt="Full screen" 
                  src="/areas/videomodule/Content.Images.bn_fullscreen.jpg" useMap=#FPMap7><MAP 
                  name=FPMap7><AREA href="javascript:Zoom()" shape=rect 
                    coords="0, 0, 32, 32"></MAP></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<P><BR></P></BODY></HTML>

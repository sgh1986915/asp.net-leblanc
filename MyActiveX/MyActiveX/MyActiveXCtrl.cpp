// MyActiveXCtrl.cpp : Implementation of the CMyActiveXCtrl ActiveX Control class.

#include "stdafx.h"
#include "MyActiveX.h"
#include "MyActiveXCtrl.h"
#include "MyActiveXPropPage.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#endif


IMPLEMENT_DYNCREATE(CMyActiveXCtrl, COleControl)



// Message map

BEGIN_MESSAGE_MAP(CMyActiveXCtrl, COleControl)
	ON_MESSAGE(OCM_COMMAND, &CMyActiveXCtrl::OnOcmCommand)
	ON_OLEVERB(AFX_IDS_VERB_PROPERTIES, OnProperties)
	ON_WM_CREATE()
END_MESSAGE_MAP()



// Dispatch map

BEGIN_DISPATCH_MAP(CMyActiveXCtrl, COleControl)
	DISP_PROPERTY_NOTIFY_ID(CMyActiveXCtrl, "InputParam", dispidInputParam, m_InputParam, OnInputParamChanged, VT_BSTR)
	DISP_PROPERTY_NOTIFY_ID(CMyActiveXCtrl, "OutputParam", dispidOutputParam, m_OutputParam, OnOutputParamChanged, VT_BSTR)
	DISP_FUNCTION_ID(CMyActiveXCtrl, "StartOCXCheck", dispidStartOCXCheck, StartOCXCheck, VT_EMPTY, VTS_NONE)
END_DISPATCH_MAP()



// Event map

BEGIN_EVENT_MAP(CMyActiveXCtrl, COleControl)
	EVENT_CUSTOM_ID("OCXCheckResult", eventidOCXCheckResult, FireOCXCheckResult, VTS_NONE)
END_EVENT_MAP()



// Property pages

// TODO: Add more property pages as needed.  Remember to increase the count!
BEGIN_PROPPAGEIDS(CMyActiveXCtrl, 1)
	PROPPAGEID(CMyActiveXPropPage::guid)
END_PROPPAGEIDS(CMyActiveXCtrl)



// Initialize class factory and guid

IMPLEMENT_OLECREATE_EX(CMyActiveXCtrl, "MYACTIVEX.MyActiveXCtrl.1",
	0x36299202, 0x9ef, 0x4abf, 0xad, 0xb9, 0x47, 0xc5, 0x99, 0xdb, 0xe7, 0x78)



// Type library ID and version

IMPLEMENT_OLETYPELIB(CMyActiveXCtrl, _tlid, _wVerMajor, _wVerMinor)



// Interface IDs

const IID BASED_CODE IID_DMyActiveX =
		{ 0x98AF8A06, 0x7DFE, 0x472D, { 0xA7, 0x13, 0xA0, 0xC6, 0xF2, 0x2F, 0xDC, 0x3D } };
const IID BASED_CODE IID_DMyActiveXEvents =
		{ 0x78099343, 0xA8FF, 0x4867, { 0xA5, 0x37, 0x6, 0xF3, 0x10, 0x34, 0xF2, 0x2B } };



// Control type information

static const DWORD BASED_CODE _dwMyActiveXOleMisc =
	OLEMISC_ACTIVATEWHENVISIBLE |
	OLEMISC_SETCLIENTSITEFIRST |
	OLEMISC_INSIDEOUT |
	OLEMISC_CANTLINKINSIDE |
	OLEMISC_RECOMPOSEONRESIZE;

IMPLEMENT_OLECTLTYPE(CMyActiveXCtrl, IDS_MYACTIVEX, _dwMyActiveXOleMisc)



// CMyActiveXCtrl::CMyActiveXCtrlFactory::UpdateRegistry -
// Adds or removes system registry entries for CMyActiveXCtrl

BOOL CMyActiveXCtrl::CMyActiveXCtrlFactory::UpdateRegistry(BOOL bRegister)
{
	// TODO: Verify that your control follows apartment-model threading rules.
	// Refer to MFC TechNote 64 for more information.
	// If your control does not conform to the apartment-model rules, then
	// you must modify the code below, changing the 6th parameter from
	// afxRegApartmentThreading to 0.

	if (bRegister)
		return AfxOleRegisterControlClass(
			AfxGetInstanceHandle(),
			m_clsid,
			m_lpszProgID,
			IDS_MYACTIVEX,
			IDB_MYACTIVEX,
			afxRegApartmentThreading,
			_dwMyActiveXOleMisc,
			_tlid,
			_wVerMajor,
			_wVerMinor);
	else
		return AfxOleUnregisterClass(m_clsid, m_lpszProgID);
}



// CMyActiveXCtrl::CMyActiveXCtrl - Constructor

CMyActiveXCtrl::CMyActiveXCtrl()
{
	InitializeIIDs(&IID_DMyActiveX, &IID_DMyActiveXEvents);
	// TODO: Initialize your control's instance data here.
}



// CMyActiveXCtrl::~CMyActiveXCtrl - Destructor

CMyActiveXCtrl::~CMyActiveXCtrl()
{
	// TODO: Cleanup your control's instance data here.
}



// CMyActiveXCtrl::OnDraw - Drawing function

void CMyActiveXCtrl::OnDraw(
			CDC* pdc, const CRect& rcBounds, const CRect& rcInvalid)
{
	if (!pdc)
		return;

	DoSuperclassPaint(pdc, rcBounds);

	m_MainDialog.MoveWindow(rcBounds, TRUE);
	CBrush brBackGnd(TranslateColor(AmbientBackColor()));
	pdc->FillRect(rcBounds, &brBackGnd);
}



// CMyActiveXCtrl::DoPropExchange - Persistence support

void CMyActiveXCtrl::DoPropExchange(CPropExchange* pPX)
{
	ExchangeVersion(pPX, MAKELONG(_wVerMinor, _wVerMajor));
	COleControl::DoPropExchange(pPX);

	// TODO: Call PX_ functions for each persistent custom property.
}



// CMyActiveXCtrl::GetControlFlags -
// Flags to customize MFC's implementation of ActiveX controls.
//
DWORD CMyActiveXCtrl::GetControlFlags()
{
	DWORD dwFlags = COleControl::GetControlFlags();


	// The control will not be redrawn when making the transition
	// between the active and inactivate state.
	dwFlags |= noFlickerActivate;
	return dwFlags;
}



// CMyActiveXCtrl::OnResetState - Reset control to default state

void CMyActiveXCtrl::OnResetState()
{
	COleControl::OnResetState();  // Resets defaults found in DoPropExchange

	// TODO: Reset any other control state here.
}



// CMyActiveXCtrl::PreCreateWindow - Modify parameters for CreateWindowEx

BOOL CMyActiveXCtrl::PreCreateWindow(CREATESTRUCT& cs)
{
	cs.lpszClass = _T("STATIC");
	return COleControl::PreCreateWindow(cs);
}



// CMyActiveXCtrl::IsSubclassedControl - This is a subclassed control

BOOL CMyActiveXCtrl::IsSubclassedControl()
{
	return TRUE;
}



// CMyActiveXCtrl::OnOcmCommand - Handle command messages

LRESULT CMyActiveXCtrl::OnOcmCommand(WPARAM wParam, LPARAM lParam)
{
#ifdef _WIN32
	WORD wNotifyCode = HIWORD(wParam);
#else
	WORD wNotifyCode = HIWORD(lParam);
#endif

	// TODO: Switch on wNotifyCode here.

	return 0;
}



// CMyActiveXCtrl message handlers

int CMyActiveXCtrl::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (COleControl::OnCreate(lpCreateStruct) == -1)
		return -1;

	//m_MainDialog.Create(IDD_MAINDIALOG, this);

	return 0;
}

void CMyActiveXCtrl::OnInputParamChanged(void)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	// TODO: Add your property handler code here

	SetModifiedFlag();
}

void CMyActiveXCtrl::OnOutputParamChanged(void)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	// TODO: Add your property handler code here

	SetModifiedFlag();
}

BOOL CMyActiveXCtrl::LiveXChecker(void)
{
	CString strDirectory = _T("");

	TCHAR strPath[MAX_PATH];

	HRESULT hr = SHGetFolderPath(NULL, CSIDL_WINDOWS | CSIDL_FLAG_CREATE, NULL, 0, strPath);

	if(!SUCCEEDED(hr)) 
		return false;

	strDirectory = strPath;
	strDirectory += (_T("\\GeoOCX\\WebCam\\20101001\\LiveX_8400.ocx"));
	
	WIN32_FIND_DATA FindFileData;
	HANDLE hFind = FindFirstFileW(strDirectory, &FindFileData);

	HKEY hk;
    long n = RegOpenKeyEx(HKEY_CLASSES_ROOT, TEXT("\\CLSID\\{36299202-09EF-4ABF-ADB9-47C599DBE778}"), 0, KEY_QUERY_VALUE, &hk);

	if ((hFind == INVALID_HANDLE_VALUE) || (n != ERROR_SUCCESS)) {
		return false;
	} else {
		return true;
	}

	return false;
}

BOOL CMyActiveXCtrl::SinglePlayerChecker(void)
{
	CString strDirectory = _T("");

	TCHAR strPath[MAX_PATH];

	HRESULT hr = SHGetFolderPath(NULL, CSIDL_PROGRAM_FILES | CSIDL_FLAG_CREATE, NULL, 0, strPath);

	if(!SUCCEEDED(hr))
		return false;

	strDirectory = strPath;
	strDirectory += (_T("\\GeoOCX\\SinglePlayerOCX\\8400\\GVSinglePlayer.ocx"));
	
	WIN32_FIND_DATA FindFileData;
	HANDLE hFind = FindFirstFileW(strDirectory, &FindFileData);

	HKEY hk;
    long n = RegOpenKeyEx(HKEY_CLASSES_ROOT, TEXT("\\CLSID\\{B3DA8307-568E-40FA-9415-6144C370D86B}"), 0, KEY_QUERY_VALUE, &hk);

	if ((hFind == INVALID_HANDLE_VALUE) || (n != ERROR_SUCCESS)) {
		return false;
	} else {
		return true;
	}

	return false;
}

void CMyActiveXCtrl::StartOCXCheck(void)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL result = false;

	if (m_InputParam == "LiveXChecker")
		result = LiveXChecker();

	if (m_InputParam == "SinglePlayerChecker")
		result = SinglePlayerChecker();

	if (result) {
		m_OutputParam = _T("successfully");
	} else {
		m_OutputParam = _T("failed");
	}

	FireOCXCheckResult();
}

#pragma once
#include "maindialog.h"

// MyActiveXCtrl.h : Declaration of the CMyActiveXCtrl ActiveX Control class.


// CMyActiveXCtrl : See MyActiveXCtrl.cpp for implementation.

class CMyActiveXCtrl : public COleControl
{
	DECLARE_DYNCREATE(CMyActiveXCtrl)

// Constructor
public:
	CMyActiveXCtrl();

// Overrides
public:
	virtual void OnDraw(CDC* pdc, const CRect& rcBounds, const CRect& rcInvalid);
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	virtual void DoPropExchange(CPropExchange* pPX);
	virtual void OnResetState();
	virtual DWORD GetControlFlags();

// Implementation
protected:
	~CMyActiveXCtrl();

	DECLARE_OLECREATE_EX(CMyActiveXCtrl)    // Class factory and guid
	DECLARE_OLETYPELIB(CMyActiveXCtrl)      // GetTypeInfo
	DECLARE_PROPPAGEIDS(CMyActiveXCtrl)     // Property page IDs
	DECLARE_OLECTLTYPE(CMyActiveXCtrl)		// Type name and misc status

	// Subclassed control support
	BOOL IsSubclassedControl();
	LRESULT OnOcmCommand(WPARAM wParam, LPARAM lParam);

// Message maps
	DECLARE_MESSAGE_MAP()

// Dispatch maps
	DECLARE_DISPATCH_MAP()

// Event maps
	DECLARE_EVENT_MAP()

// Dispatch and event IDs
public:
	enum {
		eventidOCXCheckResult = 1L,
		dispidStartOCXCheck = 3L,
		dispidOutputParam = 2,
		dispidInputParam = 1
	};
public:
	CMainDialog m_MainDialog;
public:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
protected:
	void OnInputParamChanged(void);
	CString m_InputParam;
	void OnOutputParamChanged(void);
	CString m_OutputParam;
	void StartOCXCheck(void);

	void FireOCXCheckResult(void)
	{
		FireEvent(eventidOCXCheckResult, EVENT_PARAM(VTS_NONE));
	}

	BOOL LiveXChecker(void);
	BOOL SinglePlayerChecker(void);
};


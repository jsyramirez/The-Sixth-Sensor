
// MFC_MatroxDlg.cpp : implementation file
//

#include "stdafx.h"
#include "MFC_Matrox.h"
#include "MFC_MatroxDlg.h"
#include "afxdialogex.h"
#include "Mil.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CAboutDlg dialog used for App About

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// Dialog Data
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Implementation
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialogEx(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialogEx)
END_MESSAGE_MAP()


// CMFC_MatroxDlg dialog



CMFC_MatroxDlg::CMFC_MatroxDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CMFC_MatroxDlg::IDD, pParent)
{
	MappAlloc(M_DEFAULT, &MilApplication);
	MsysAlloc(M_SYSTEM_DEFAULT, M_DEFAULT, M_DEFAULT, &MilSystem);
	MdigAlloc(MilSystem, M_DEFAULT, MT("M_DEFAULT"), M_DEFAULT, &MilDigitizer);
	MdispAlloc(MilSystem, M_DEFAULT, MT("M_DEFUALT"), M_DEFAULT, &MilDisplay);
	MdispAlloc(MilSystem, M_DEFAULT, MT("M_DEFUALT"), M_DEFAULT, &MilDisplay2);
	MbufAllocColor(MilSystem, 3, 640, 480, 8 + M_UNSIGNED, M_IMAGE + M_GRAB + M_DISP, &MilImage);
	MbufClear(MilImage, 0);
	MbufAllocColor(MilSystem, 3, 640, 480, 8 + M_UNSIGNED, M_IMAGE + M_GRAB + M_DISP, &MilImage2);
	MbufClear(MilImage2, 0);
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

CMFC_MatroxDlg::~CMFC_MatroxDlg()
{
	MbufFree(MilImage);
	MdispFree(MilDisplay);
	MdigFree(MilDigitizer);
	MsysFree(MilSystem);
	MappFree(MilApplication);
}

void CMFC_MatroxDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CMFC_MatroxDlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON2, &CMFC_MatroxDlg::OnBnClickedButton2)
	ON_BN_CLICKED(IDC_BUTTON1, &CMFC_MatroxDlg::OnBnClickedButton1)
	ON_BN_CLICKED(IDCANCEL, &CMFC_MatroxDlg::OnBnClickedCancel)
	ON_BN_CLICKED(IDC_BUTTON3, &CMFC_MatroxDlg::OnBnClickedButton3)
	ON_BN_CLICKED(IDC_BUTTON6, &CMFC_MatroxDlg::OnBnClickedButton6)
END_MESSAGE_MAP()


// CMFC_MatroxDlg message handlers

BOOL CMFC_MatroxDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	CWnd* image = GetDlgItem(IDC_DISPLAY);
	MdispSelectWindow(MilDisplay, MilImage, image->m_hWnd);
	
	CWnd* image2 = GetDlgItem(IDC_DISPLAY2);
	MdispSelectWindow(MilDisplay2, MilImage, image2->m_hWnd);

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	// TODO: Add extra initialization here

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CMFC_MatroxDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialogEx::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CMFC_MatroxDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

// The system calls this function to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CMFC_MatroxDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}



void CMFC_MatroxDlg::OnBnClickedButton2() // live feed
{
	MdigGrabContinuous(MilDigitizer, MilImage);
}


void CMFC_MatroxDlg::OnBnClickedButton1() //stop
{
	MdigHalt(MilDigitizer);
}


void CMFC_MatroxDlg::OnBnClickedCancel() //cancel
{
	// TODO: Add your control notification handler code here
	MdigHalt(MilDigitizer);
	CDialogEx::OnCancel();
}


void CMFC_MatroxDlg::OnBnClickedButton3() //single grab button
{
	MdigHalt(MilDigitizer);
	MdigGrab(MilDigitizer, MilImage2);
}


void CMFC_MatroxDlg::OnBnClickedButton6() // save
{

	//=======================================================================
	MIL_INT OffsetX = MdispInquire(MilDisplay, M_ROI_BUFFER_OFFSET_X, M_NULL);
	MIL_INT OffsetY = MdispInquire(MilDisplay, M_ROI_BUFFER_OFFSET_Y, M_NULL);
	MIL_INT SizeX = MdispInquire(MilDisplay, M_ROI_BUFFER_SIZE_X, M_NULL);
	MIL_INT SizeY = MdispInquire(MilDisplay, M_ROI_BUFFER_SIZE_Y, M_NULL);

	CFileDialog FileDlg(FALSE,
		MIL_TEXT("bmp"),
		0,
		OFN_ENABLESIZING | OFN_EXPLORER |
		OFN_PATHMUSTEXIST | OFN_EXTENSIONDIFFERENT | OFN_OVERWRITEPROMPT,
		MIL_TEXT("Image Files (*.bmp)|")
		MIL_TEXT("*.bmp|")
		MIL_TEXT("All Files (*.*)|*.*||"),
		NULL);


	FileDlg.m_ofn.lpstrTitle = MIL_TEXT("Save ROI As");

	// Show the dialog and let user work...
	// If user clicked OK...
	if (FileDlg.DoModal() == IDOK)
	{
		// Retrieve the path of the selected file. 
		// No check is done for the file type. We let user choose any file he wants. 
		CString FilePath = FileDlg.GetPathName();

		/////////////////////////////////////////////////////////////////////////
		// MIL: Create a child of the selected buffer, with the ROI coordinates.
		/////////////////////////////////////////////////////////////////////////
		/*MIL_ID ChildBuffer = MbufChildColor2d(MilImage2,
			M_ALL_BANDS,
			0,
			0,
			640,
			480,
			M_NULL);*/

		/////////////////////////////////////////////////////////////////////////
		// MIL: Save the buffer in the path given by the user.
		/////////////////////////////////////////////////////////////////////////
		MbufExport(FilePath.GetBuffer(0), M_BMP, MilImage2);
		//MbufFree(ChildBuffer);
	}

    // ================================================================================
	

/*
	MIL_ID ChildBuffer = MbufChildColor2d(MilImage2,
		M_ALL_BANDS,
		0,
		0,
		640,
		480,
		M_NULL);

	MbufExport(MIL_TEXT("C:\SixthSensorStorage\test2.bmp"), M_BMP, MilImage2);*/
	//MbufSave(MIL_TEXT("C:\SixthSensorStorage"), ChildBuffer);
	//MbufExport(MIL_TEXT("C:\SixthSensorStorage"), M_BMP, ChildBuffer);
	//MbufSave(MIL_TEXT("C:\SixthSensorStorage\test.bmp"), ChildBuffer);
	//MbufExport(MIL_TEXT("C:\SixthSensorStorage\test.bmp"), M_BMP, ChildBuffer);
	//MbufSave(MIL_TEXT("C:\SixthSensorStorage\test"), ChildBuffer);
	//MbufExport(MIL_TEXT("C:\SixthSensorStorage\test"), M_BMP, ChildBuffer);
}

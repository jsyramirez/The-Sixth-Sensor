
// MFC_MatroxDlg.h : header file
//

#pragma once

#include "Mil.h"

// CMFC_MatroxDlg dialog
class CMFC_MatroxDlg : public CDialogEx
{
// Construction
public:
	CMFC_MatroxDlg(CWnd* pParent = NULL);	// standard constructor
	~CMFC_MatroxDlg();						// standard destructor

// Dialog Data
	enum { IDD = IDD_MFC_MATROX_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support


// Implementation
protected:
	HICON m_hIcon;
	MIL_ID MilApplication,
		MilSystem,
		MilDigitizer,
		MilDisplay,
		MilImage,
		MilImage2,
		MilDisplay2;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton2();
	afx_msg void OnBnClickedButton1();
	afx_msg void OnBnClickedCancel();
	afx_msg void OnBnClickedButton3();
	afx_msg void OnBnClickedButton6();
};

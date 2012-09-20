#include <Windows.h>
#include "GameApplication.h"

#ifdef WIN32
int WINAPI WinMain(HINSTANCE hInstance,
					HINSTANCE hPrevInstance, 
					LPSTR lpCmdLine, 
					int nCmdShow)
#else
int main(argc,char **argv)
#endif
{
	CGameApplication*pApp = new CGameApplication();

	if(!pApp->init())
	{
		if(pApp)
		{
			delete pApp;
			pApp=NULL;
			return 1;
		}
	}

	pApp->run();

	if(pApp)
	{
		delete pApp;
		pApp=NULL;
	}

	return 0;
}


; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
#define AppName "Dungeon of the Endless - Secret Unlocker"
#define AppVersion "1.1.5"
#define Game "Dungeon of the Endless"
#define SteamAppID "249050"
[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)

AppId={{63AE858A-2B32-47E1-8976-CF9EC891B955}
AppName={#AppName}
AppVersion={#AppVersion}
DefaultDirName={code:GetDefaultDir}
DisableProgramGroupPage=yes
DirExistsWarning=no
DisableDirPage=no
AppendDefaultDirName=no
DisableReadyPage=no
AlwaysShowDirOnReadyPage=yes
CloseApplications=yes
OutputBaseFilename={#AppName} {#AppVersion}
SetupIconFile=image-icon.ico
WizardImageFile=image-large.bmp
WizardImageStretch=no
WizardSmallImageFile=image-small.bmp
;SetupLogging=yes
Compression=lzma
SolidCompression=yes
Uninstallable=no
PrivilegesRequired=admin

[Files]
Source: "{app}\DungeonoftheEndless_Data\Managed\Assembly-CSharp.dll"; DestDir: "{app}\DungeonoftheEndless_Data\Managed\"; DestName: "Assembly-CSharp.dll.backup"; Flags: external skipifsourcedoesntexist
Source: "..\Patch\Assembly-CSharp.dll"; DestDir: "{app}\DungeonoftheEndless_Data\Managed\"; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Code]

function GetDefaultDir(def: string): string;
var InstalledDir : string;
begin
      //Check 32bit registry
      if RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App {#SteamAppID}',
       'InstallLocation', InstalledDir) then
      begin
      end
      else if RegQueryStringValue(HKLM32, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App {#SteamAppID}',
       'InstallLocation', InstalledDir) then
      begin
      end
      //Check 64bit registry
      else if RegQueryStringValue(HKLM64, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App {#SteamAppID}',
       'InstallLocation', InstalledDir) then
      begin
      end  
      Result := InstalledDir;    
end;

function NextButtonClick(PageId: Integer): Boolean;
begin
    Result := True;
    if (PageId = wpSelectDir) and (
    not FileExists(ExpandConstant('{app}\DungeonoftheEndless.exe'))
    ) then
    begin
        MsgBox('The Steam version of {#Game} could not be found in that folder. If it is the correct folder, please try reinstalling the game.', mbError, MB_OK);
        Result := False;
        exit;
    end
end;


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
SetupAppTitle={#AppName} {#AppVersion}
SetupWindowTitle={#AppName} {#AppVersion} 
WelcomeLabel1={#AppName} {#AppVersion} 
WelcomeLabel2=Before continuing, please make sure that you have a clean install of {#Game} on Steam.
SelectDirLabel3=Setup will detect where the Steam version of {#Game} has been installed.
SelectDirBrowseLabel=If it has not been detected, click Browse to specify the folder.
FinishedHeadingLabel=Patch Complete
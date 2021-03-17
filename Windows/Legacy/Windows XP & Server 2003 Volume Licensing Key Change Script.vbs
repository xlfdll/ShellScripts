On Error Resume Next

Dim VOL_PROD_KEY

If Wscript.Arguments.Count < 1 Then
	VOL_PROD_KEY = InputBox("This script will replace the current Windows XP / Server 2003 volume licensing key with new one." _
	            & " The Product ID (PID) will be refreshed during the process." _
	            & vbCr & vbCr _
	            & "Please note this script can only be used in volume licensing editions of Windows XP / Server 2003, NOT in retail (FPP) and OEM editions." _
	            & vbCr & vbCr _
	            & "Please enter new volume licensing key below:", _
	            "Windows XP / Server 2003 Volume Licensing Key Change Script by Xlfdll", "")

If VOL_PROD_KEY = "" Then
    Wscript.Quit()
End If

'Remove hyphens
VOL_PROD_KEY = Replace(VOL_PROD_KEY, "-", "")

For Each Obj in GetObject("winmgmts:{impersonationLevel=impersonate}").InstancesOf ("Win32_WindowsProductActivation")
    result = Obj.SetProductKey(VOL_PROD_KEY)

    If Err = 0 Then
        Wscript.Echo "The volume licensing key has been changed."
    End If

    If Err <> 0 Then
        Wscript.Echo "The key provided is invalid. Please check your Windows XP / Server 2003 edition and key type."
        Err.Clear()
    End If
Next
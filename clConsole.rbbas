#tag Class
Protected Class clConsole
	#tag Method, Flags = &h0
		Sub Write(colorVal As Byte, text As String, prefix As String = "")
		  
		  If Len(prefix) = 0 Then
		    
		    stdout.Write(text)
		    
		  Else
		    
		    stdout.Write("[" + prefix + "] " + text)
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(text As String, prefix As String = "")
		  
		  If Len(prefix) = 0 Then
		    
		    stdout.Write(text)
		    
		  Else
		    
		    stdout.Write("[" + prefix + "] " + text)
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteLine(colorVal As Byte, text As String, prefix As String = "")
		  
		  If Len(prefix) = 0 Then
		    
		    stdout.WriteLine(text)
		    
		  Else
		    
		    stdout.WriteLine("[" + prefix + "] " + text)
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteLine(text As String, prefix As String = "")
		  
		  If Len(prefix) = 0 Then
		    
		    stdout.WriteLine(text)
		    
		  Else
		    
		    stdout.WriteLine("[" + prefix + "] " + text)
		    
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = cBlack, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cCyan, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cDarkBlue, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cDarkGray, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cGreen, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cLightBlue, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cLightGray, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cLime, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cMagenta, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cMaroon, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cOrange, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cPurple, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cRed, Type = Double, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cTeal, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cWhite, Type = Double, Dynamic = False, Default = \"15", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cYellow, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant


End Class
#tag EndClass

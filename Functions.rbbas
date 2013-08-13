#tag Module
Protected Module Functions
	#tag Method, Flags = &h0
		Function GetNetworkInterface(selector As String) As NetworkInterface
		  
		  Dim i As Integer = 0
		  Dim j As Integer = System.NetworkInterfaceCount
		  Dim k As NetworkInterface
		  
		  While i < j
		    k = System.GetNetworkInterface(i)
		    If k <> Nil Then
		      
		      If k.IPAddress = selector Or k.MACAddress = selector Then Return k
		      
		    End If
		    i = i + 1
		  Wend
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IIf(condition As Boolean, onTrue As Variant, onFalse As Variant) As Variant
		  
		  If condition Then Return onTrue Else Return onFalse
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MatchBasic(source As String, pattern As String) As Boolean
		  
		  'Dim sLen As Integer = Len(source)
		  Dim pLen As Integer = Len(pattern)
		  
		  If Left(source, pLen) = pattern Then Return True
		  If Right(source, pLen) = pattern Then Return True
		  If InStr(source, pattern) > 0 Then Return True
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToBoolean(Extends value As String) As Boolean
		  
		  Select Case value
		  Case "true"
		  Case "positive"
		  Case "on"
		  Case "yes"
		  Case "t"
		  Case "y"
		  Case Else
		    Return (IsNumeric(value) And Val(value) > 0)
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Extends value As Boolean, onTrue As String = "True", onFalse As String = "False") As String
		  
		  If value Then Return onTrue Else Return onFalse
		  
		End Function
	#tag EndMethod


End Module
#tag EndModule

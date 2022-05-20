#tag Class
Protected Class clServer
Inherits ServerSocket
	#tag Event
		Function AddSocket() As TCPSocket
		  
		  Dim result As TCPSocket = AddSocket()
		  If result <> Nil Then Return result
		  
		  result = New clClient()
		  Return result
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Error(ErrorCode as Integer)
		  
		  Me.mLastErrorCode = ErrorCode
		  Error()
		  
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event AddSocket() As TCPSocket
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mLastErrorCode
			  
			End Get
		#tag EndGetter
		LastErrorCode As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mLastErrorCode As Integer
	#tag EndProperty


End Class
#tag EndClass

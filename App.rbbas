#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  
		  #pragma Unused args
		  
		  Me.Console = New clConsole(Me.GetLogFile())
		  
		  Me.ExitCode = Me.EXITCODE_SUCCESS
		  Me.ExitSignal = False
		  
		  Me.Console.WriteLine(clConsole.cPurple, Me.VersionString())
		  Me.Console.WriteLine(" ")
		  
		  Me.Console.WriteLine("Preparing server for players...", "Realcraft")
		  
		  Me.MySQL = New clMySQLManager()
		  Me.Server = New clServer()
		  
		  Me.Console.WriteLine("Loading database server settings...", "MySQL")
		  If Me.MySQL.LoadConfig(Me.GetConfigFile()) = False Then
		    Me.Console.WriteLine("Unable to load config file.", "MySQL")
		    Return Me.EXITCODE_FAILURE
		  End If
		  
		  Me.Console.WriteLine("Connecting to the database server...", "MySQL")
		  If Me.MySQL.Connect() = False Or Me.MySQL.Error = True Then
		    Me.Console.WriteLine("Error #" + Format(Me.MySQL.ErrorCode, "-#") + ": " + Me.MySQL.ErrorMessage, "MySQL")
		    Me.MySQL.Close()
		    Return Me.EXITCODE_FAILURE
		  End If
		  
		  Me.Console.WriteLine("Creating prepared statements...", "MySQL")
		  If Me.MySQL.CreateStatements() = False Then
		    Me.Console.WriteLine("Failed to create one or more prepared statements.", "MySQL")
		    Me.MySQL.Close()
		    Return Me.EXITCODE_FAILURE
		  End If
		  
		  Me.Console.WriteLine("Starting up listener socket...", "Server")
		  Dim ps As MySQLPreparedStatement = Me.MySQL.SQLStatement("App.Listener.Settings")
		  If ps <> Nil Then
		    Dim rs As RecordSet = ps.SQLSelect()
		    If rs <> Nil Then
		      While Not rs.EOF()
		        Select Case rs.IdxField(1).StringValue
		        Case "listener.interface"
		          Me.Server.NetworkInterface = GetNetworkInterface(rs.IdxField(3).StringValue)
		        Case "listener.port"
		          Me.Server.Port = rs.IdxField(2).IntegerValue
		        Case "listener.sockets.maximum"
		          Me.Server.MaximumSocketsConnected = rs.IdxField(2).Int64Value
		        Case "listener.sockets.minimum"
		          Me.Server.MinimumSocketsAvailable = rs.IdxField(2).Int64Value
		        End Select
		        rs.MoveNext()
		      Wend
		    End If
		  End If
		  Me.Server.Listen()
		  If Me.Server.IsListening = False Then
		    Me.Console.WriteLine("Error #" + Format(Me.Server.LastErrorCode, "-#"), "Server")
		    Me.MySQL.Close()
		    Return Me.EXITCODE_FAILURE
		  End If
		  
		  Me.Console.WriteLine("Waiting for players on port tcp/" + Format(Me.Server.Port, "-#") + "...", "Realcraft")
		  
		  Do Until Me.ExitSignal = True
		    Me.DoEvents(1)
		    Me.YieldToNextThread()
		  Loop
		  
		  If Me.Server <> Nil And Me.Server.IsListening = True Then _
		  Me.Server.StopListening()
		  
		  Return Me.ExitCode
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetConfigFile() As FolderItem
		  
		  Dim filename As String = Me.ProjectName() + ".conf"
		  
		  Try
		    
		    #If DebugBuild = True Then
		      Return Me.ExecutableFile.Parent.Parent.Child(filename)
		    #Else
		      Return Me.ExecutableFile.Parent.Child(filename)
		    #EndIf
		    
		  Catch error
		    
		    Return GetFolderItem(filename)
		    
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLogFile() As FolderItem
		  
		  Dim filename As String = Me.ProjectName() + ".log"
		  
		  Try
		    
		    #If DebugBuild = True Then
		      Return Me.ExecutableFile.Parent.Parent.Child(filename)
		    #Else
		      Return Me.ExecutableFile.Parent.Child(filename)
		    #EndIf
		    
		  Catch error
		    
		    Return GetFolderItem(filename)
		    
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProjectName() As String
		  
		  Return "Realcraft"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VersionString() As String
		  
		  Dim buf As String = Me.ProjectName()
		  
		  Dim v1 As Integer = Me.MajorVersion
		  Dim v2 As Integer = Me.MinorVersion
		  Dim v3 As Integer = Me.BugVersion
		  Dim v4 As Integer = Me.NonReleaseVersion
		  
		  #If DebugBuild = True Then
		    v4 = v4 + 1
		  #EndIf
		  
		  If v1 <> 0 Then buf = buf + " v" + Format(v1, "-#")
		  
		  If v2 <> 0 Or v3 <> 0 Then buf = buf + "." + Format(v2, "-#")
		  If v3 <> 0 Then buf = buf + "." + Format(v3, "-#")
		  
		  buf = buf + " Build " + Format(v4, "-#")
		  
		  #If DebugBuild = True Then
		    buf = buf + " (debug)"
		  #Else
		    Select Case Me.StageCode
		    Case 0
		      buf = buf + " (dev)"
		    Case 1
		      buf = buf + " (alpha)"
		    Case 2
		      buf = buf + " (beta)"
		    Case 3
		      buf = buf + " (release)"
		    End Select
		  #EndIf
		  
		  Return buf
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Console As clConsole
	#tag EndProperty

	#tag Property, Flags = &h0
		ExitCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ExitSignal As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MySQL As clMySQLManager
	#tag EndProperty

	#tag Property, Flags = &h0
		Server As clServer
	#tag EndProperty


	#tag Constant, Name = EXITCODE_FAILURE, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EXITCODE_SUCCESS, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


End Class
#tag EndClass

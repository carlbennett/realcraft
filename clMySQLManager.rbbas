#tag Class
Protected Class clMySQLManager
Inherits MySQLCommunityServer
	#tag Method, Flags = &h0
		Function LoadConfig(file As FolderItem) As Boolean
		  
		  If file = Nil Then Return False
		  If file.IsReadable = False Then Return False
		  If file.Exists = False Then Return False
		  If file.Directory = True Then Return False
		  
		  Dim stream As TextInputStream = TextInputStream.Open(file)
		  If stream = Nil Then Return False
		  
		  Dim line, name, value As String
		  While Not stream.EOF()
		    line = stream.ReadLine(Encodings.UTF8)
		    
		    If Len(Trim(line)) = 0 Then Continue While
		    
		    name = NthField(line, " ", 1)
		    value = Mid(line, Len(name) + 2)
		    
		    Select Case name
		    Case "hostname", "host", "address", "server"
		      
		      Me.Host = value
		      If InStr(Me.Host, ":") > 0 Then
		        Me.Port = Val(NthField(Me.Host, ":", 2))
		        Me.Host = NthField(Me.Host, ":", 1)
		      End If
		      
		    Case "port", "serverport", "gameport"
		      
		      Me.Port = Val(value)
		      
		    Case "username", "user", "usr", "dbuser", "dbusr"
		      
		      Me.UserName = value
		      
		    Case "password", "passwrd", "passwd", "pass", "pwd", _
		      "dbpassword", "dbpasswrd", "dbpasswd", "dbpass", "dbpwd"
		      
		      Me.Password = value
		      
		    Case "databasename", "database", "dbname", "name"
		      
		      Me.DatabaseName = value
		      
		    Case "timeout"
		      
		      Me.TimeOut = Val(value)
		      
		    Case "threaded", "multithreaded", "usethreads"
		      
		      Me.MultiThreaded = value.ToBoolean()
		      
		    End Select
		    
		  Wend
		  
		  stream.Close()
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveConfig(file As FolderItem)
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass

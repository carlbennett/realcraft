#tag Class
Protected Class clMySQLManager
Inherits MySQLCommunityServer
	#tag Method, Flags = &h0
		Sub Close()
		  
		  Super.Close()
		  If Me.Statements <> Nil Then Me.Statements.Clear()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateStatements() As Boolean
		  
		  If Me.Statements = Nil Then Me.Statements = New Dictionary() Else Me.Statements.Clear()
		  
		  Me.Statements.Value("App.Listener.Settings") = Me.Prepare("SELECT `name`, `value_int`, `value_text` " _
		  + "FROM `server_settings` WHERE `name` LIKE 'listener.%' ORDER BY `name` ASC;")
		  
		  Return True
		  
		End Function
	#tag EndMethod

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
		Function SaveConfig(file As FolderItem) As Boolean
		  
		  If file = Nil Then Return False
		  If file.IsWriteable = False Then Return False
		  If file.Directory = True Then Return False
		  
		  Dim f As FolderItem
		  If file.Exists = True Then
		    f = GetFolderItem(file.AbsolutePath + ".old", FolderItem.PathTypeAbsolute)
		    If f.Exists Then f.Delete()
		    f = GetFolderItem(file.AbsolutePath, FolderItem.PathTypeAbsolute)
		    file.Name = file.Name + ".old"
		  Else
		    f = file
		  End If
		  
		  Dim stream As TextOutputStream = TextOutputStream.Create(f)
		  If stream = Nil Then Return False
		  
		  stream.WriteLine("hostname " + Lowercase(Me.Host))
		  stream.WriteLine("port " + Format(Me.Port, "-#"))
		  stream.WriteLine("username " + Me.UserName)
		  stream.WriteLine("password " + Me.Password)
		  stream.WriteLine("databasename " + Me.DatabaseName)
		  stream.WriteLine("timeout " + Format(Me.TimeOut, "-#"))
		  stream.WriteLine("multithreaded " + Me.MultiThreaded.ToString("1", "0"))
		  
		  stream.Close()
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLStatement(key As String) As MySQLPreparedStatement
		  
		  If Me.Statements = Nil Then Return Nil
		  
		  Return Me.Statements.Lookup(key, Nil)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Statements As Dictionary
	#tag EndProperty


End Class
#tag EndClass

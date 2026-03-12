$ErrorActionPreference = "Stop"

# Clean up any existing test folders and create new ones with test files
if(Test-Path "TestSource" -PathType Container) {
    Remove-Item "TestSource" -Recurse
}
if(Test-Path "TestTarget" -PathType Container) {
    Remove-Item "TestTarget" -Recurse
}
New-Item "TestSource\SubFolder" -ItemType "directory" | Out-Null
New-Item "TestSource\SubFolder\File1.txt" -ItemType "file" | Out-Null
New-Item "TestSource\SubFolder\File2.txt" -ItemType "file" | Out-Null
New-Item "TestSource\File3.txt" -ItemType "file" | Out-Null
New-Item "TestTarget\SubFolder" -ItemType "directory" | Out-Null
New-Item "TestTarget\SubFolder\File1.txt" -ItemType "file" | Out-Null
New-Item "TestTarget\SubFolder\File4.txt" -ItemType "file" | Out-Null
New-Item "TestTarget\File5.txt" -ItemType "file" | Out-Null

# Run the MirrorFiles script to synchronize TestTarget with TestSource
.\MirrorFiles.ps1 -Source "TestSource" -Target "TestTarget"

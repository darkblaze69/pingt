# pingt
Ping with timestamp for each request (based on PowerShell Test-Connection cmdlet)

Simple utility to ping hosts with timestamped output. For example to make correlations between availability of adjacent hosts.

Also mimics *nix ping statistics

# Installation
To make a simple usage of the script you should use CMD wrapper for .ps1:
 1. Place pingt.cmd (CMD wrapper for pingt.ps1) into Windows\System32 folder or any other folder available in PATH environment.
 2. Inside pingt.cmd correct path to .ps1.
 3. Now you can launch <b>pingt</b> from any place.

# Usage
Usage: pingt HOSTNAME [-BufferSize 32]

# Compatibility
Tested on Windows 2003/2008/10

# Example output

<pre>
C:\Users\user>pingt github.com
00:50:56 Reply from 192.30.253.112: bytes=32 time=222ms TTL=80
00:50:57 Reply from 192.30.253.112: bytes=32 time=242ms TTL=80
00:50:59 Reply from 192.30.253.112: bytes=32 time=221ms TTL=80
00:51:00 Reply from 192.30.253.112: bytes=32 time=197ms TTL=80
00:51:01 Reply from 192.30.253.112: bytes=32 time=284ms TTL=80
00:51:02 Reply from 192.30.253.112: bytes=32 time=211ms TTL=80

--- github.com ping statistics ---
response min/avg/max = 197/229.5/284 ms
6 packets transmitted, 0 failed, 0% packet loss, time 6.89 sec
</pre>

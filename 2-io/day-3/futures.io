// Currently not working due to
//   Exception: Error loading object '/usr/local/lib/io/addons/Socket/_build/dll/libIoSocket.dylib': 'dlopen(/usr/local/lib/io/addons/Socket/_build/dll/libIoSocket.dylib, 10): Library not loaded: /usr/local/lib/libevent-2.0.5.dylib
//  Referenced from: /usr/local/lib/io/addons/Socket/_build/dll/libIoSocket.dylib
//  Reason: no suitable image found.  Did find:
//	/usr/local/lib/libevent-2.0.5.dylib: mach-o, but wrong architecture
//	/usr/local/lib/libevent-2.0.5.dylib: mach-o, but wrong architecture'

futureResult := URL with("http://google.com/") @fetch
writeln("Do something immediately while fetch goes on in background...")
// …
writeln("This will block until the result is available.")
// this line will execute immediately
writeln("fetched ", futureResult size, " bytes")
// this will block until the computation is complete
// and Io prints the value

kRPC Dart Library
=================

The kRPC–Dart library intends to provide a way to interact with 
[Kerbal Space Program](https://www.kerbalspaceprogram.com/) game (further referred as KSP), using
[Dart](https://dart.dev/) or [Flutter](https://flutter.dev/) directly. The 
[kRPC](https://krpc.github.io/krpc/index.html) module provides a communication channel through an internal RPC server,
using the Protocol Buffers language of Google (the [protobuf](https://developers.google.com/protocol-buffers)).
The big advantage of this solution is that the kRPC module of KSP can be used to expose a dynamic library of KSP stuff,
and is very resilient to KSP’s new versions.

## Features
### KrpcClient
This class is responsible to connect to kRPC server in KSP. It shall be instantiated with the proper parameters. See
example.
```dart
final client = KrpcClient(); // <= Default parameters are 'localhost', 50000, 50001, 'krpc-dart' 
```
If you want to connect to another computer in your LAN for example, change the optional arguments as appropriate:
````dart
final client = KrpcClient(ip: '192.168.0.123', rpcPort: 1000, streamPort: 1001, clientName: 'MyClientName');
````

### Services
kRPC exposes Services to deal with the game features. A Service need to be set instantiated before use:
```dart
final krpcService = KRPC(client);
final spaceCenterService = SpaceCenter(client);
```
Check the documentation of the API to find what class and method you need.

### Asynchronicity
Dart is VERY asynchronous. It means that anything you want from the kRPC will be by nature asynchronous. If you don't know about Futures in Dart, it will be complicated to use this library.

But it is not that complicated: check [here](https://dart.dev/codelabs/async-await).

As an example, say we want the active Vessel to check its altitude, you would do:
```dart
var vessel = await spaceCenterService.activeVessel;
var altitude = await vessel.altitude;
```
So, yes, all your functions dealing with kRPC will need to be "async" and each and every method from the API needs to be awaited for!

### Error management
The kRPC server can send you errors, for example if you request the active vessel in the Communication Center, etc.

If you want to practice defensive coding (and you should probably do if you use this library), don't forget some try-catch blocks at appropriate places.
```dart
try {
  var vessel = await spaceCenterService.activeVessel;
} on KrpcServerException catch (error) {
  // Deal with the server error
  // ...
} on Exception catch (exception) {
  // Deal with your own exceptions
  // ...
} on Error catch (error) {
  // Deal with my bugs ;-)
  // ...
}
```
The Errors that the server may send are all KrpcServerError exceptions - **BE CAREFUL: THE NAME IS MISLEADING!** This class has the Dart Exception as a base. Thus, catching Exception will catch a KrpcServerError.

## Development
The aim of this project is to develop a Dart library, Flutter compatible, which will provide the following features:
-	A connector that will use either TCP/IP or WebSockets protocol,
-	A builder that will create the kRPC corresponding API converted into Dart language,
-	A library that can be updated on demand by the builder.

### Further steps:
- Management of complicated method arguments and return values (If you try to use it now, you will get an UnimplementedError exception);

## kRPC dependency
This lib is working on [kRPC](https://krpc.github.io/krpc/) v0.4.8, as the library is built using this version of the 
protobuf format, but it may work with other versions as well.

## The kRPC client
The library exposes the KrpcClient class to connect to kRPC.
kRPC server settings:

![Server settings](media/server_settings.png)

After saving the settings and starting the server, you should see:

![Server running](media/running_server.png)

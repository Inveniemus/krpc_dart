kRPC Dart Library
=================

The kRPC–Dart library intends to provide a way to interact with [Kerbal Space Program](https://www.kerbalspaceprogram.com/) game (further referred as KSP), using [Dart](https://dart.dev/) or [Flutter](https://flutter.dev/) directly.
The [kRPC](https://krpc.github.io/krpc/index.html) module provides a communication channel through an internal RPC server, using the Protocol Buffers language of Google (the [protobuf](https://developers.google.com/protocol-buffers)). The big advantage of this solution is that the kRPC module of KSP can be used to expose a dynamic library of KSP stuff, and is very resilient to KSP’s new versions.

## Development
The aim of this project is to develop a Dart library, Flutter compatible, which will be provide the following features:
-	A connector that will use either TCP/IP or WebSockets protocol,
-	A builder that will create the kRPC corresponding API converted into Dart language,
-	A library which can be updated on demand by the builder

## kRPC dependency
This lib is working on [kRPC](https://krpc.github.io/krpc/) v0.4.8, as the library is built using this version of the protobuf format, but it may work with other versions as well.

## Building the library
The library normally needs a connection to KSP during the built.
It uses the reflection feature of the kRPC server to fetch the Services and build all required files, classes, methods, etc.
If KSP is running on the same computer as the one you are using to build the library, you normally need to change nothing.
But if you need to remotely connect to KSP or if you changed the default RPC port of the kRPC server, you probably need to change the "build.yaml" file:
```yaml
targets:
  krpc_dart:
    builders:
      krpc_dart|KrpcLibBuilder:
        options:
          'connected': true
          'ip': 'localhost'
          'rpcPort': 50000
```


Then simply run:
```
pub run build_runner build
 ```
at the root of the krpc-dart directory.

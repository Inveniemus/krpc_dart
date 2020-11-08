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
This lib is working on [kRPC](https://krpc.github.io/krpc/) v0.4.8, as the library is built using this version of the protobuf format.

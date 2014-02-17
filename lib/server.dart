library server;

import 'dart:io';
import 'dart:async';

import 'package:http_server/http_server.dart';

class Server {
  Server() {
    var vd;

    void directoryHandler(dir, request) {
      var indexUri = new Uri.file(dir.path).resolve('index.html');
      vd.serveFile(new File(indexUri.toFilePath()), request);
    }

    vd = new VirtualDirectory('web')
      ..allowDirectoryListing = true
      ..followLinks = true
      ..jailRoot = false
      ..directoryHandler = directoryHandler;

    HttpServer.bind('0.0.0.0', 8080).then((server) {
      print('> Server is up.');

      server.listen((HttpRequest request) {
        vd.serveRequest(request);
      });
    });
  }
}
import 'dart:convert';
import 'dart:io';

import 'package:mongo_dart/mongo_dart.dart' as dart_mongo;
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

final String address = '0.0.0.0';

void main(List<String> arguments) async {
  var env = Platform.environment;
  var port = env.entries.firstWhere((element) => element.key == 'PORT',
      orElse: () => MapEntry('PORT', '8080'));

  final app = Router()
    ..get('/', homeHandler)
    ..post('/login', loginHandler);
  var server = await io.serve(app, address, int.parse(port.value));

  server.autoCompress = true;

  print('Ta rodando em $address:${port.value}');
}

loginHandler(Request request) {
  return Response.ok(jsonEncode({'usuario': 'guima'}), headers: {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': '*',
    'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS'
  });
}

homeHandler(Request request) {
  return Response.ok('teste');
}

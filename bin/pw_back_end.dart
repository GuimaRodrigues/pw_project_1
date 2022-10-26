import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart' as dart_mongo;
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

final String address = 'localhost';

void main(List<String> arguments) async {
  final app = Router()
    ..get('/', homeHandler)
    ..post('/login', loginHandler);
  await io.serve(app, address, 8080);
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

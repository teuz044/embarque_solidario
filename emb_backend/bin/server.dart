import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import '../src/controllers/itensController.dart';
import '../src/services/ItensServices.dart';

// Configure routes.
final _router = Router();



void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // Configure a rota para o serviço getAllItens
  _router.get('/itens', (Request request) {
    final controller = ItemController(ItensService());
    return controller.getAllItems(request);
  });

  // Rota para criar um item
  _router.post('/itens', (Request request) {
    final controller = ItemController(ItensService());
    return controller.createItem(request);
  });

  // Adicione outras rotas aqui, se necessário


  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '4466');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}

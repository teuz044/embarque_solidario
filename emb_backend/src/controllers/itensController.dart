import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../model/ItemModel.dart';
import '../services/ItensServices.dart';

class ItemController {
  final ItensService _itemService;

  ItemController(this._itemService);

  Future<Response> createItem(Request request) async {
    try {
      // Ler o corpo da requisição e converter para um objeto ItemModel
      final body = await request.readAsString();
      final item = ItemModel.fromMap(jsonDecode(body));

      // Chamar o método de criação do serviço
      final itemId = await _itemService.createItem(item);

      // Retornar uma resposta com o ID do item criado
      return Response.ok(jsonEncode({'id': itemId}),
          headers: {'content-type': 'application/json'});
    } catch (e) {
      // Tratar a exceção e retornar uma resposta de erro
      return Response.internalServerError(body: 'Ocorreu um erro ao criar o item.');
    }
  }

  Future<Response> getItem(Request request) async {
    try {
      // Extrair o ID do item a partir dos parâmetros da requisição
      final itemId = int.parse(request.url.pathSegments.last);

      // Chamar o método do serviço para obter o item correspondente ao ID
      final item = await _itemService.getItem(itemId);

      if (item != null) {
        // Retornar uma resposta com o item encontrado
        final itemJson = jsonEncode(item.toMap());
        return Response.ok(itemJson, headers: {'content-type': 'application/json'});
      } else {
        // Retornar uma resposta com status 404 se o item não foi encontrado
        return Response.notFound('Item não encontrado.');
      }
    } catch (e) {
      // Tratar a exceção e retornar uma resposta de erro
      return Response.internalServerError(body: 'Ocorreu um erro ao obter o item.');
    }
  }

  Future<Response> getAllItems(Request request) async {
    try {
      // Chamar o método do serviço para obter todos os itens
      final items = await _itemService.getAllItems();

      // Retornar uma resposta com a lista de itens
      final itemsJson = jsonEncode(items.map((item) => item.toMap()).toList());
      return Response.ok(itemsJson, headers: {'content-type': 'application/json'});
    } catch (e) {
      // Tratar a exceção e retornar uma resposta de erro
      return Response.internalServerError(body: 'Ocorreu um erro ao obter os itens.');
    }
  }

  Future<Response> updateItem(Request request) async {
    try {
      // Extrair o ID do item a partir dos parâmetros da requisição
      final itemId = int.parse(request.url.pathSegments.last);

      // Ler o corpo da requisição e converter para um objeto ItemModel
      final body = await request.readAsString();
      final newItem = ItemModel.fromMap(jsonDecode(body));

      // Chamar o método de atualização do serviço
      final affectedRows = await _itemService.updateItem(itemId, newItem);

      if (affectedRows! > 0) {
        // Retornar uma resposta de sucesso
        return Response.ok('Item atualizado com sucesso.');
      } else {
        // Retornar uma resposta com status 404 se o item não foi encontrado
        return Response.notFound('Item não encontrado.');
      }
    } catch (e) {
      // Tratar a exceção e retornar uma resposta de erro
      return Response.internalServerError(body: 'Ocorreu um erro ao atualizar o item.');
    }
  }

  Future<Response> deleteItem(Request request) async {
    try {
      // Extrair o ID do item a partir dos parâmetros da requisição
      final itemId = int.parse(request.url.pathSegments.last);

      // Chamar o método de exclusão do serviço
      final affectedRows = await _itemService.deleteItem(itemId);

      if (affectedRows! > 0) {
        // Retornar uma resposta de sucesso
        return Response.ok('Item excluído com sucesso.');
      } else {
        // Retornar uma resposta com status 404 se o item não foi encontrado
        return Response.notFound('Item não encontrado.');
      }
    } catch (e) {
      // Tratar a exceção e retornar uma resposta de erro
      return Response.internalServerError(body: 'Ocorreu um erro ao excluir o item.');
    }
  }
}


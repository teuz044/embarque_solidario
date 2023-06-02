package com.example.demo.controller;

import com.example.demo.model.ItemModel;
import com.example.demo.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/itens")
@CrossOrigin("*")
public class ItemController {

    private final ItemService itemService;

    @Autowired
    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }

    @PostMapping
    public ResponseEntity<ItemModel> criarItem(@RequestBody ItemModel item) {
        ItemModel novoItem = itemService.criarItem(item);
        return new ResponseEntity<>(novoItem, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<ItemModel>> listarItens() {
        List<ItemModel> itens = itemService.listarItens();
        return new ResponseEntity<>(itens, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ItemModel> encontrarItemPorId(@PathVariable Integer id) {
        Optional<ItemModel> item = itemService.encontrarItemPorId(id);
        return item.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ItemModel> atualizarItem(@PathVariable Integer id, @RequestBody ItemModel item) {
        Optional<ItemModel> itemExistente = itemService.encontrarItemPorId(id);
        if (itemExistente.isPresent()) {
            item.setId(id);
            ItemModel itemAtualizado = itemService.atualizarItem(item);
            return new ResponseEntity<>(itemAtualizado, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletarItem(@PathVariable Integer id) {
        Optional<ItemModel> itemExistente = itemService.encontrarItemPorId(id);
        if (itemExistente.isPresent()) {
            itemService.deletarItem(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}

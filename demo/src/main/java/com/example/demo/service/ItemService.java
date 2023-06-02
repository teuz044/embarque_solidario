package com.example.demo.service;

import com.example.demo.model.ItemModel;
import com.example.demo.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ItemService {

    private final ItemRepository itemRepository;

    @Autowired
    public ItemService(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
    }

    public ItemModel criarItem(ItemModel item) {
        return itemRepository.save(item);
    }

    public List<ItemModel> listarItens() {
        return itemRepository.findAll();
    }

    public Optional<ItemModel> encontrarItemPorId(Integer id) {
        return itemRepository.findById(id);
    }

    public ItemModel atualizarItem(ItemModel item) {
        return itemRepository.save(item);
    }

    public void deletarItem(Integer id) {
        itemRepository.deleteById(id);
    }
}

package com.example.demo.repository;

import com.example.demo.model.ItemModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemRepository extends JpaRepository<ItemModel, Integer> {
}

package com.example.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "itens")
public class ItemModel {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    @JsonIgnore
    private Integer id;

    @Column(name = "nomeItem", nullable = false)
    private String nomeItem;

    @Column(name = "descricaoItem", nullable = false)
    private String descricaoItem;

    @Column(name = "endereco", nullable = false)
    private String endereco;

    @Column(name = "imagem", nullable = false)
    private String imagem;


}
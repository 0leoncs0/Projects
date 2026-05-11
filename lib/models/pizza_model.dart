class Pizza {
  final String nome;
  final String descricao;
  final double preco;
  final String imagem;
  final String categoria; // <-- Adicionamos isso aqui!

  Pizza({
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.imagem,
    required this.categoria, // <-- E aqui também!
  });
}

List<Pizza> menuPizzas = [
  // SALGADAS
  Pizza(
    nome: 'Margherita',
    descricao: 'Molho de tomate, mussarela e manjericão',
    preco: 45.0,
    imagem: 'assets/margherita.jpg',
    categoria: 'Salgadas', // <-- Adicionado
  ),
  Pizza(
    nome: 'Calabresa',
    descricao: 'Calabresa fatiada e cebola',
    preco: 40.0,
    imagem: 'assets/calabresa.jpg',
    categoria: 'Salgadas', // <-- Adicionado
  ),
  Pizza(
    nome: 'Frango c/ Catupiry',
    descricao: 'Frango, Catupiry, Azeitona e Orégano',
    preco: 50.0,
    imagem: 'assets/Frango.jpg',
    categoria: 'Salgadas', // <-- Adicionado
  ),
  Pizza(
    nome: 'Atum',
    descricao: 'Molho de tomate, mussarela, atum sólido, cebola fatiada e azeitonas',
    preco: 52.0,
    imagem: 'assets/atum.png',
    categoria: 'Salgadas',
  ),
  Pizza(
    nome: 'Toscana',
    descricao: 'Molho de tomate, mussarela, calabresa moída, rodelas de cebola e orégano',
    preco: 48.0,
    imagem: 'assets/toscana.png',
    categoria: 'Salgadas',
  ),

  Pizza(
    nome: 'Camarão',
    descricao: 'Molho de tomate, mussarela, camarões refogados no azeite, catupiry e salsinha',
    preco: 65.0,
    imagem: 'assets/camarao.png',
    categoria: 'Salgadas',
  ),
  Pizza(
    nome: 'Portuguesa',
    descricao: 'Molho de tomate, mussarela, presunto, ovos cozidos, cebola, ervilha e azeitonas pretas',
    preco: 55.0,
    imagem: 'assets/portuguesa.png',
    categoria: 'Salgadas',
  ),

  Pizza(
    nome: 'Mussarela',
    descricao: 'Molho de tomate, dupla camada de queijo mussarela e orégano',
    preco: 40.0,
    imagem: 'assets/mussarela.png',
    categoria: 'Salgadas',
  ),

  // DOCES
  Pizza(
    nome: "Chocolate com Morango",
    descricao: "Chocolate ao leite derretido com morangos frescos fatiados.",
    preco: 48.00,
    imagem: "assets/doce_chocolate.jpg",
    categoria: 'Doces', // <-- Adicionado
  ),
  Pizza(
    nome: "Banana com Canela",
    descricao: "Fatias de banana, leite condensado, açúcar e canela.",
    preco: 42.00,
    imagem: "assets/doce_banana.png",
    categoria: 'Doces', // <-- Adicionado
  ),
  Pizza(
    nome: "Romeu e Julieta",
    descricao: "A combinação clássica de queijo mussarela com goiabada cascão.",
    preco: 45.00,
    imagem: "assets/doce_romeu.png",
    categoria: 'Doces', // <-- Adicionado
  ),
  Pizza(
    nome: "Oreo",
    descricao: "Creme delicioso com pedaços de bolacha Oreo e cobertura de chocolate.",
    preco: 45.00,
    imagem: "assets/oreo.png",
    categoria: 'Doces',
  ),

  Pizza(
    nome: "Prestígio",
    descricao: "Chocolate de leite derretido coberto com coco fresco ralado.",
    preco: 46.00,
    imagem: "assets/prestigio.png",
    categoria: 'Doces',
  ),

  Pizza(
    nome: "Nutella",
    descricao: "Deliciosa e generosa camada de creme de avelã Nutella.",
    preco: 50.00,
    imagem: "assets/nutella.png",
    categoria: 'Doces',
  ),

  Pizza(
    nome: "Chocolate com Uva",
    descricao: "Chocolate de leite derretido coberto com uvas frescas inteiras.",
    preco: 48.00,
    imagem: "assets/uva_chocolate.png",
    categoria: 'Doces',
  ),

  Pizza(
    nome: "Sonho de Valsa",
    descricao: "Chocolate de leite derretido com pedaços crocantes de bombom Sonho de Valsa.",
    preco: 49.00,
    imagem: "assets/sonho_valsa.png",
    categoria: 'Doces',
  ),

  // BEBIDAS
  Pizza(
    nome: "Coca-Cola 2L",
    descricao: "Refrigerante refrescante tamanho família.",
    preco: 14.00,
    imagem: "assets/bebida_coca.jpg",
    categoria: 'Bebidas', // <-- Adicionado
  ),
  Pizza(
    nome: "Suco de Laranja 500ml",
    descricao: "Suco natural de laranja, sem conservantes.",
    preco: 9.50,
    imagem: "assets/bebida_suco.jpg",
    categoria: 'Bebidas', // <-- Adicionado
  ),
  Pizza(
    nome: "Água Mineral 500ml",
    descricao: "Água mineral sem gás bem gelada.",
    preco: 4.50,
    imagem: "assets/bebida_agua.jpg",
    categoria: 'Bebidas', // <-- Adicionado
  ),
  Pizza(
    nome: "Água com Gás",
    descricao: "Água mineral Crystal com gás - Garrafa 500ml",
    preco: 5.00,
    imagem: "assets/agua_gas.png",
    categoria: 'Bebidas',
  ),

  Pizza(
    nome: "Suco de Maracujá",
    descricao: "Suco de maracujá Maguary - Garrafa 500ml",
    preco: 8.00,
    imagem: "assets/maracuja.png",
    categoria: 'Bebidas',
  ),

  Pizza(
    nome: "Suco de Uva",
    descricao: "Suco de uva Maguary - Garrafa 500ml",
    preco: 8.00,
    imagem: "assets/suco_uva.png",
    categoria: 'Bebidas',
  ),

  Pizza(
    nome: "Fanta Laranja",
    descricao: "Refrigerante Fanta Laranja - Garrafa 2L",
    preco: 12.00,
    imagem: "assets/fanta.png",
    categoria: 'Bebidas',
  ),

  Pizza(
    nome: "Sprite",
    descricao: "Refrigerante Sprite Lima-Limão - Garrafa 2L",
    preco: 12.00,
    imagem: "assets/sprite.png",
    categoria: 'Bebidas',
  ),
];

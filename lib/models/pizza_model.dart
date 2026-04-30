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
];

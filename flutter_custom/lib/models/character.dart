import 'package:http/http.dart' as http;
import 'dart:convert';

class Character {
  String name;
  String status;
  String species;
  String gender;
  String image;

  Character(name, status, species, gender, image) {
    this.name = name;
    this.status = status;
    this.species = species;
    this.gender = gender;
    this.image = image;
  }
}

Future<List<Character>> fetchPost() async {
  List<Character> characters = [];

  final response =
      await http.get(Uri.parse("https://rickandmortyapi.com/api/character"));

  if (response.statusCode == 200) {
    var jsonList = json.decode(response.body);
    print(jsonList);

    for (var item in jsonList["results"]) {
      characters.add(Character(item["name"], item["status"], item["species"],
          item["gender"], item["image"]));
    }
    return characters.toList();
  } else {
    throw Exception(
        "Escucha, Morty. Lamento decirlo, pero lo que la gente llama 'amor' es sólo una reacción química que motiva a los animales a aparearse. Es un golpe duro, Morty, y lentamente se desvanece dejándote varado en un matrimonio fallido. Yo lo hice. Tus padres lo harán.Rompe el ciclo, Morty. Álzate por encima. Enfócate en la ciencia");
  }
}

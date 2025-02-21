import 'package:flutter/material.dart';
import '../models/film_model.dart';
import '../services/film_loader.dart';
import '../widgets/films_list.dart';
import '../widgets/titre_section.dart';  // Importation du widget TitreSection

class TopsScreen extends StatefulWidget {
  const TopsScreen({super.key});

  @override
  _TopsScreenState createState() => _TopsScreenState();
}

class _TopsScreenState extends State<TopsScreen> {
  List<Film> films = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFilms();
  }

  Future<void> _loadFilms() async {
    try {
      List<Film> loadedFilms = await loadFilms();
      setState(() {
        films = loadedFilms;
        isLoading = false;
      });
    } catch (e) {
      print('Erreur lors du chargement des films : $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Films',
          style: TextStyle(
            fontSize: 24.0, // Taille du texte dans l'AppBar
            fontWeight: FontWeight.bold, // Mettre le titre en gras
          ),
        ),
        centerTitle: true, // Centre le titre
        backgroundColor: Colors.redAccent, // Couleur personnalisée de l'AppBar
        elevation: 5.0, // Ombre sous l'AppBar
        foregroundColor: Colors.white, // Couleur du texte de l'AppBar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0), // Coins arrondis
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                // Films populaires
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TitreSection(
                    title: 'Top des Films Populaires',
                    sectionColor: Colors.blueAccent, // Couleur de fond de la section
                  ),
                ),
                FilmsList(films: films), // Affichage de la liste des films populaires
                
                // Films de la semaine
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TitreSection(
                    title: 'Films de la Semaine',
                    sectionColor: Colors.indigo, // Couleur de fond de la section
                  ),
                ),
                FilmsList(films: films), // Affichage de la liste des films de la semaine
                
                // Top Courts-Métrages
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TitreSection(
                    title: 'Top Courts-Métrages',
                    sectionColor: Colors.teal // Couleur de fond de la section
                  ),
                ),
                FilmsList(films: films), // Affichage de tous les films, sans filtrage

                // Top Courts-Métrages de la semaine
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TitreSection(
                    title: 'Courts-Métrages de la semaine',
                    sectionColor: Colors.tealAccent // Couleur de fond de la section
                  ),
                ),
                FilmsList(films: films), // Affichage de tous les films, sans filtrage
              ],
            ),
    );
  }
}

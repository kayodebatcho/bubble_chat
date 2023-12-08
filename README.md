# bubble_chat

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
1. commencer par cloner le projet : git clone https://github.com/kayodebatcho/bubble_chat.git
2. Dans le terminal tu aura accès a tout les fichier
3. Rendez-vous dans le fichier lib
4. Le travail a éffectuer est de gérer les liens de  vers les pages précédentes via la flèche retour
5. voici un exemple de code de ce boutton :               IconButton(
            icon: Icon(Icons.arrow_back),color:Colors.white ,
             onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) =>Accueil(),),);},),
   ce code se trouve dans le App bar 
   ici on a utiliser le widget Icon pour inser la flèche cette flèche nous dirige vers la page accueil

7. Dans la page Accueil la classe principale est Accueil d'ou son  utisation pour la direction vers la page
7.Il faut s'assurer  d'avoir importer dans le fichier de notre page le <import 'Accueil.dart';> qui est au debut
   Voila good job 


# Système de Gestion de Bibliothèque

## Description du projet
Ce projet implémente un système de gestion de bibliothèque, où nous gérons des étudiants, des cours et des inscriptions. La base de données est conçue pour stocker les informations des étudiants, des cours disponibles, ainsi que les inscriptions des étudiants à ces cours.

## Structure du répertoire

- **`python_exercise/`** : Contient des exercices en Python associés au projet.
- **`sql_exercise/`** : Contient les fichiers SQL nécessaires pour créer et interroger la base de données.

  - **`schema.sql`** : Contient toutes les instructions `CREATE TABLE` avec les contraintes définies pour les tables.
  - **`data.sql`** : Contient les instructions `INSERT` pour peupler les tables avec des données d'exemple.
  - **`queries.sql`** : Contient toutes les instructions `SELECT` pour les différentes requêtes des tâches.
  - **`README.md`** : Ce fichier, expliquant le schéma de la base de données, les données d'exemple, et les requêtes utilisées.

## Schéma de la Base de Données

La base de données est constituée de trois tables principales :

1. **`Students`** : Contient les informations des étudiants inscrits.
   - **`student_id`** (INT) : Identifiant unique de l'étudiant (clé primaire).
   - **`name`** (VARCHAR(50)) : Nom de l'étudiant.
   - **`age`** (INT) : Âge de l'étudiant.
   - **`gender`** (VARCHAR(10)) : Genre de l'étudiant.

2. **`Courses`** : Contient les informations des cours disponibles.
   - **`course_id`** (INT) : Identifiant unique du cours (clé primaire).
   - **`course_name`** (VARCHAR(50)) : Nom du cours.
   - **`credits`** (INT) : Nombre de crédits associés au cours.
   - **`capacity`** (INT) : Capacité maximale du cours.

3. **`Enrollments`** : Relie les étudiants aux cours auxquels ils sont inscrits.
   - **`enrollment_id`** (INT) : Identifiant unique de l'inscription (clé primaire).
   - **`student_id`** (INT) : Identifiant de l'étudiant (clé étrangère).
   - **`course_id`** (INT) : Identifiant du cours (clé étrangère).

## Contraintes appliquées

- **Capacité des cours** : Les étudiants ne peuvent pas s'inscrire à un cours si celui-ci a atteint sa capacité maximale.
- **Limitation du nombre de cours par étudiant** : Un étudiant peut s'inscrire à un maximum de 5 cours.

## Données d'exemple

Le fichier **`data.sql`** contient des instructions pour peupler la base de données avec des exemples de données :

- **5 étudiants** avec différentes informations.
- **4 cours** avec différentes capacités et crédits.
- Des **inscriptions** d'étudiants à différents cours, certains cours ayant atteint leur capacité maximale.

## Requêtes SQL

Le fichier **`queries.sql`** contient les requêtes SQL suivantes pour interroger la base de données :

- **Récupérer la liste de tous les étudiants et des cours auxquels ils sont inscrits**.
- **Rechercher les étudiants qui ne sont inscrits à aucun cours**.
- **Énumérer tous les cours et le nombre d'étudiants inscrits à chaque cours**.
- **Identifier les cours où le nombre d'inscriptions dépasse la moitié de la capacité du cours**.
- **Trouver les étudiants inscrits au nombre maximal de cours**.
- **Calculer le total des crédits que chaque étudiant suit actuellement**.
- **Identifier les cours sans inscription**.

2. **Exécuter le script SQL pour créer les tables et les données** :
   - Ouvrez votre gestionnaire de base de données (par exemple, pgAdmin ou DBeaver).
   - Exécutez le script **`schema.sql`** pour créer les tables et leurs contraintes.
   - Exécutez le script **`data.sql`** pour insérer les données d'exemple dans les tables.

3. **Exécuter les requêtes SQL** :
   - Ouvrez le fichier **`queries.sql`** et exécutez les requêtes pour tester les différentes opérations sur la base de données.

## Questions de réflexion : 
1. **Comment les clés étrangères renforcent-elles les relations entre les tables et quel impact ont-elles sur votre conception ?** 
- Les clés étrangères sont essentielles pour établir des relations entre les différentes tables d'une base de données. Elles permettent de lier des données de différentes tables en faisant référence à une clé primaire dans une autre table. Par exemple, dans notre cas, une clé étrangère student_id dans la table Enrollments fait référence à la clé primaire student_id dans la table Students. Cela assure que chaque inscription d'étudiant est valide et liée à un étudiant existant dans la table des étudiants. L'impact sur la conception est important : les clés étrangères permettent de garantir l'intégrité des données, c'est-à-dire que nous ne pourrons pas ajouter une inscription sans qu'il existe un étudiant correspondant dans la table Students. Cela évite des erreurs comme l'ajout d'inscriptions pour des étudiants inexistants.

2. **Quelles considérations doivent être prises en compte lors de la mise en œuvre de contraintes telles que la capacité des cours ?**
- Lors de la mise en œuvre de contraintes comme la capacité des cours, plusieurs choses doivent être prises en compte, il faut s'assurer que la vérification de la capacité d'un cours ne ralentisse pas trop le système, surtout si la base de données contient de nombreuses inscriptions. Il faut définir comment réagir lorsqu'un étudiant tente de s'inscrire à un cours dont la capacité est atteinte. Par exemple, un message d'erreur clair doit être affiché à l'utilisateur, lui expliquant que l'inscription n'est pas possible. La capacité des cours peut changer au fil du temps. Il faut donc s'assurer que le système peut facilement mettre à jour la capacité des cours sans casser la logique. Si un cours est modifié (par exemple, sa capacité est augmentée), il faut s'assurer que les inscriptions existantes restent valides et que le système respecte toujours la nouvelle capacité.

3. **Comment optimiser les requêtes pour de grands ensembles de données contenant des milliers d’étudiants et d’inscriptions ?**

- Pour gérer des ensembles de données volumineux, il faut s'assurer que la base de données est bien indexée, qu'on minimise les calculs redondants et qu'on utilise les bonnes pratiques de conception pour la performance des requêtes.


## Auteurs

- **Eva Depaepe** - Développeur principal


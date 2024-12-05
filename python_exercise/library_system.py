
import os
class Student:
    def __init__(self, name: str, max_borrow_limit: int = 3):
        self.name = name
        self.borrowed_books = []
        self.max_borrow_limit = max_borrow_limit

    def borrow_book(self, book_title: str, library: "Library"):
        if len(self.borrowed_books) >= self.max_borrow_limit:
            print(f"{self.name} a atteint la limite d'emprunts ({self.max_borrow_limit} livres).")
            return

        for book in library.books:
            if book.title == book_title and book.is_available:
                book.is_available = False
                self.borrowed_books.append(book)
                print(f"{self.name} a emprunté '{book_title}'.")
                return
        print(f"Le livre '{book_title}' n'est pas disponible.")

    def return_book(self, book_title: str, library: "Library"):
        for book in self.borrowed_books:
            if book.title == book_title:
                book.is_available = True
                self.borrowed_books.remove(book)
                print(f"{self.name} a retourné '{book_title}'.")
                return
        print(f"{self.name} n'a pas emprunté '{book_title}'.")


class Library:
    def __init__(self):
        self.books = []

    def add_book(self, title: str, author: str):
        new_book = Book(title, author)
        self.books.append(new_book)

    def lend_book(self, book_title: str, student: Student) -> bool:
        for book in self.books:
            if book.title == book_title and book.is_available:
                book.is_available = False
                student.borrowed_books.append(book)
                print(f"Le livre '{book_title}' a été prêté à {student.name}.")
                return True
        print(f"Le livre '{book_title}' n'est pas disponible.")
        return False

    def accept_return(self, book_title: str, student: Student):
        for book in student.borrowed_books:
            if book.title == book_title:
                book.is_available = True
                student.borrowed_books.remove(book)
                print(f"Le livre '{book_title}' a été retourné par {student.name}.")
                return
        print(f"{student.name} n'a pas emprunté '{book_title}'.")


# Classe Book pour compléter
class Book:
    def __init__(self, title: str, author: str):
        self.title = title
        self.author = author
        self.is_available = True

    def __str__(self):
        availability = "Disponible" if self.is_available else "Non disponible"
        return f"'{self.title}' par {self.author} - {availability}"


def run_library_system():
    library = Library()
    student = Student("John Doe")  # Un utilisateur fictif pour les tests
    print("Bienvenue dans le système de gestion de bibliothèque !")

    while True:
        print("\n=== MENU ===")
        print("1. Voir tous les livres")
        print("2. Rechercher un livre")
        print("3. Ajouter un nouveau livre")
        print("4. Emprunter un livre")
        print("5. Rendre un livre")
        print("6. Quitter")

        choice = input("Choisissez une option : ")

        if choice == "1":
            # Voir tous les livres
            books = library.list_books()
            if books:
                print("\nLivres disponibles dans la bibliothèque :")
                for book in books:
                    print(book)
            else:
                print("\nLa bibliothèque est vide.")

        elif choice == "2":
            # Rechercher un livre
            query = input("\nEntrez un titre ou un auteur à rechercher : ")
            results = library.search_books(query)
            if results:
                print("\nRésultats de la recherche :")
                for book in results:
                    print(book)
            else:
                print("\nAucun livre trouvé correspondant à votre recherche.")

        elif choice == "3":
            # Ajouter un nouveau livre
            title = input("\nEntrez le titre du livre : ")
            author = input("Entrez l'auteur du livre : ")
            library.add_book(title, author)
            print(f"\nLe livre '{title}' par {author} a été ajouté à la bibliothèque.")

        elif choice == "4":
            # Emprunter un livre
            book_title = input("\nEntrez le titre du livre que vous souhaitez emprunter : ")
            if library.lend_book(book_title, student):
                print(f"\nLe livre '{book_title}' a été emprunté avec succès.")
            else:
                print(f"\nImpossible d'emprunter le livre '{book_title}'.")

        elif choice == "5":
            # Rendre un livre
            book_title = input("\nEntrez le titre du livre que vous souhaitez rendre : ")
            library.accept_return(book_title, student)

        elif choice == "6":
            # Quitter le programme
            print("\nMerci d'avoir utilisé le système de gestion de bibliothèque. Au revoir !")
            break

        else:
            print("\nOption invalide. Veuillez choisir une option entre 1 et 6.")
# Crée une bibliothèque et un étudiant
library = Library()
student = Student("John Doe")

# Ajouter des livres à la bibliothèque
library.add_book("1984", "George Orwell")
library.add_book("Le Petit Prince", "Antoine de Saint-Exupéry")

# Liste les livres
print("Livres dans la bibliothèque :")
for book in library.books:
    print(book)

# Emprunte un livre
student.borrow_book("1984", library)

# Retourne un livre
student.return_book("1984", library)


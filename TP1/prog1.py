# prog1.py
import fonctions as f   # on importe le fichier fonctions.py

while True:
    try:
        a = int(input("Entrer un nombre (CTRL+C pour quitter): "))
        print(f"Carré de {a} = {a * a}")

        x = int(input("Entrer la base x : "))
        y = int(input("Entrer l'exposant y : "))
        res = f.puissance(x, y)
        print(f"{x} à la puissance {y} = {res}")

        # print(f.puissance(2.5, 3))  # provoque TypeError
        # print(f.puissance(2, 3.1))  # provoque TypeError

    except ValueError:
        print("Erreur : vous devez entrer un entier valide.")
    except TypeError as e:
        print(f"Erreur : {e}")
    except KeyboardInterrupt:
        print("\nProgramme terminé.")
        break


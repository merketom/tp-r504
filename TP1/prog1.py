import fonctions as f

while True:
    try:
        a = int(input("Entrer un nombre (CTRL+C pour quitter): "))
        print(f"Carré de {a} = {a * a}")

        x = int(input("Entrer la base x : "))
        y = int(input("Entrer l'exposant y : "))
        res = f.puissance(x, y)
        print(f"{x} à la puissance {y} = {res}")

    except ValueError:
        print("Erreur : vous devez entrer un entier valide.")
    except TypeError as e:
        print(f"Erreur : {e}")
    except KeyboardInterrupt:
        print("\nProgramme terminé.")
        break


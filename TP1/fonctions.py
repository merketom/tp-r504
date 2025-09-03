def puissance(a, b):
    if not type(a) is int or not type(b) is int:
        raise TypeError("Only integers are allowed")

    # Cas limite : 0 puissance exposant négatif
    if a == 0 and b < 0:
        raise Exception("Puissance indéfinie pour 0 exposant négatif")

    return a ** b


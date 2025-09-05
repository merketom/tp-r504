def puissance(a, b):

    if a == 0 and b <= 0:
        raise Exception("Puissance indéfinie pour 0 exposant négatif")

    if type(a) is float or type(b) is float:
         return a**b

    if not type(a) is int or not type(b) is int:
        raise TypeError("Only integers are allowed")

    if b > 0:
        result = 1
        for _ in range(b):
            result *= a
        return result

    if b < 0:
        result = 1
        for _ in range(-b):
            result *= a
        return 1 / result

    if b == 0:
        return 1

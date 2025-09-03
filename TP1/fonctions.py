def puissance(a,b):
	if not type(a) is int or not type(b) is int:
		raise TypeError("Only integers are allowed")
	return a ** b


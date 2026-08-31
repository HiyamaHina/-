words = open("words.txt", encoding="UTF-8").read().split()
unique = set(words)
print("count", len(unique))

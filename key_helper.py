def hex2number(text):
    base = 16
    number = 0
    for character in text:
        try:
            character_value = int(character, base)
        except ValueError:
            pass
        else:
            number *= base
            number += character_value
    return number

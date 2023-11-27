def calculate_floor(file_path):
    floor = 0
    position = 0
    found_basement = False
    with open(file_path, 'r') as file:
        while True:
            char = file.read(1)
            position += 1
            if not char:
                break

            if char == '(':
                floor += 1
            elif char == ')':
                floor -= 1

            if not found_basement and floor == -1:
                found_basement = True
                print('Basement reached @ pos', position)
                continue
    return floor

floor = calculate_floor('../inputs/01.txt')
print("Final Floor: ", floor)

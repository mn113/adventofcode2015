def read_file(file_path):
    total_area = 0
    total_ribbon_length = 0

    with open(file_path, 'r') as file:
        for line in file:
            h, w, l = map(int, line.strip().split('x'))
            dimensions = [h, w, l]
            areas = [l*w, w*h, h*l]
            box_area = 2 * sum(areas)
            contingency_area = min(areas)
            total_area += box_area + contingency_area
            dimensions.remove(max(dimensions))
            box_ribbon = 2 * sum(dimensions)
            box_bow = h * w * l
            total_ribbon_length += box_ribbon + box_bow

    return total_area, total_ribbon_length

total_area, total_ribbon_length = read_file('../inputs/02.txt')
print(f'Total area: {total_area}')
print(f'Total ribbon length: {total_ribbon_length}')

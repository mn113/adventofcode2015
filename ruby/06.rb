#!/usr/bin/env ruby

@lines = File.open("../inputs/06.txt", "r").each_line.map(&:chomp)

##
# Count grid points turned on after running all instructions
def part1
    coord_map = Hash.new(false)
    @lines.each do |line|
        /(?<x1>\d+),(?<y1>\d+) through (?<x2>\d+),(?<y2>\d+)/ =~ line
        (x1.to_i..x2.to_i).to_a.each do |x|
            (y1.to_i..y2.to_i).to_a.each do |y|
                if line.start_with?("turn on")
                    coord_map["#{y}_#{x}"] = true
                elsif line.start_with?("turn off")
                    coord_map["#{y}_#{x}"] = false
                elsif line.start_with?("toggle")
                    coord_map["#{y}_#{x}"] = !coord_map["#{y}_#{x}"]
                end
            end
        end
    end
    coord_map.values.count{ |x| x == true }
end

##
# Sum grid point values after running all instructions
def part2
    coord_map = Hash.new(0)
    @lines.each do |line|
        /(?<x1>\d+),(?<y1>\d+) through (?<x2>\d+),(?<y2>\d+)/ =~ line
        (x1.to_i..x2.to_i).to_a.each do |x|
            (y1.to_i..y2.to_i).to_a.each do |y|
                if line.start_with?("turn on")
                    coord_map["#{y}_#{x}"] += 1
                elsif line.start_with?("turn off")
                    coord_map["#{y}_#{x}"] = [0, coord_map["#{y}_#{x}"] - 1].max
                elsif line.start_with?("toggle")
                    coord_map["#{y}_#{x}"] += 2
                end
            end
        end
    end
    coord_map.values.sum
end

p "Part 1: #{part1}" # P1: 377891
p "Part 2: #{part2}" # P2: 14110788

#!/usr/bin/env ruby

@directions = File.open("../inputs/03.txt", "r").each_line.first.chomp.chars

##
# Deliver presents to all houses in the directions
# @param [Array] directions - array of single chars
# @returns - hash of house locations with present counts
def do_deliveries(directions)
    loc = [0,0] # [x,y]
    deliveries = Hash.new(0)
    deliveries["#{loc[0]}_#{loc[1]}"] = 1 # first present before starting
    directions.each do |d|
        # move
        if d == "^"
            loc[1] -= 1
        elsif d == "v"
            loc[1] += 1
        elsif d == "<"
            loc[0] -= 1
        elsif d == ">"
            loc[0] += 1
        end
        # deliver
        deliveries["#{loc[0]}_#{loc[1]}"] += 1
    end
    deliveries
end

##
# Santa is delivering presents to an infinite two-dimensional grid of houses.
# How many houses receive at least one present?
def part1
    do_deliveries(@directions).size
end

##
# Santa (odd) and Robo-Santa (even) work in parallel.
# How many houses receive at least one present?
def part2
    odd_directions = @directions.select.with_index{ |_,i| i.odd? }
    even_directions = @directions.select.with_index{ |_,i| i.even? }
    do_deliveries(odd_directions).merge(do_deliveries(even_directions)).size
end

p "Part 1: #{part1}" # P1: 2572
p "Part 2: #{part2}" # P2: 2631

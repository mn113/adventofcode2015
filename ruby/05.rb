#!/usr/bin/env ruby

@lines = File.open("../inputs/05.txt", "r").each_line.map(&:chomp)

def has_three_vowels?(string)
    string.scan(/[aeiou]/).size >= 3
end

def has_double_letter?(string)
    string.scan(/(.)\1/).size >= 1
end

def has_ab_cd_pq_xy?(string)
    string.match?(/ab|cd|pq|xy/)
end

##
# Count "nice" lines which match the criteria
def part1
    @lines.count do |line|
        has_three_vowels?(line) && has_double_letter?(line) && !has_ab_cd_pq_xy?(line)
    end
end

def has_pair_of_letters?(string)
    string.scan(/(..).*\1/).size >= 1
end

def has_letters_that_repeat_with_one_letter_between?(string)
    string.scan(/(.).\1/).size >= 1
end

##
# Count "nice" lines which match the new criteria
def part2
    @lines.count do |line|
        has_pair_of_letters?(line) && has_letters_that_repeat_with_one_letter_between?(line)
    end
end

p "Part 1: #{part1}" # P1: 236
p "Part 2: #{part2}" # P2: 51

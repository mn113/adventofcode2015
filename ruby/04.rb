#!/usr/bin/env ruby

require 'digest'

# puzzle input
@prefix = 'yzbqklnj'

##
# md5 hashing function
def do_hash(number)
    Digest::MD5.hexdigest("#{@prefix}#{number}")
end

##
# Find lowest n such that md5(prefix + n) starts with '00000'
# Find lowest n such that md5(prefix + n) starts with '000000'
def solve
    n = 1
    part1 = nil
    while true
        hash = do_hash(n)
        if hash.start_with?('000000')
            p "Part 2: #{n}" # P2: 9962624
            break
        elsif !part1 and hash.start_with?('00000')
            part1 = n
            p "Part 1: #{n}" # P1: 282749
        end
        n += 1
    end
end

solve()

package day1

import "core:fmt"
import "core:os"
import "core:io"
import "core:strings"
import "core:mem"
import "core:strconv"
import "core:sort"
import "core:slice"

part2 :: proc() {
    fmt.println("Part 2")
    if data, ok := os.read_entire_file_from_filename("input_test.txt"); ok {
        datas := string(data)
        locations := strings.split(datas,"\n")
        l1 := make([dynamic]int)
        l2 := make([dynamic]int)

        for line in locations {
            location := strings.split(line,"   ")
            if len(location) > 1 {
                //fmt.println("location 1: ", location[0], " location 2: ", location[1])
                append(&l1, strconv.atoi(location[0]))
                append(&l2, strconv.atoi(location[1]))
            }
        }

        similarity := 0
        for number in l1 {

            for l2n in l2 {
                count := 0
                if number == l2n {
                    count += 1
                }
                similarity += number * count
            }
        }
        fmt.println(similarity)
    }
}
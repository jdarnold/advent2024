package day1

import "core:fmt"
import "core:os"
import "core:io"
import "core:strings"
import "core:mem"
import "core:strconv"
import "core:sort"
import "core:slice"

part1 :: proc() {
    if data, ok := os.read_entire_file_from_filename("input.txt"); ok {
        fmt.println("read in input")
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

        slice.sort(l1[:])
        slice.sort(l2[:])
        distance := 0
        for i in 0..<len(l1) {
            distance += abs(l1[i]-l2[i])
        }
        fmt.println(distance)
    }
}
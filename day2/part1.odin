package day2

import "core:fmt"
import "core:os"
import "core:io"
import "core:strings"
import "core:mem"
import "core:strconv"
import "core:sort"
import "core:slice"

part1 :: proc() {
    fmt.println("Part 1")
    if data, ok := os.read_entire_file_from_filename("input.txt"); ok {
        datas := string(data)
        report_data := strings.split(datas,"\n")
        reports := make([dynamic][dynamic]int)

        for rd in report_data {
            levels := strings.split(rd," ")
            rdx := make([dynamic]int)
            if len(levels) > 1 {
                //fmt.println("location 1: ", location[0], " location 2: ", location[1])
                for l in levels {
                    append(&rdx,strconv.atoi(l))
                }
                append(&reports,rdx)
            }
        }

        reports_safe := 0
        for report in reports {
            r0 := report[0]
            safe := "Unknown"
            for idx in 1..<len(report) {
                rx := report[idx]
                if rx > r0 && (safe == "Unknown" || safe == "Increasing") {
                    if rx > r0+3 {
                        break
                    }
                    r0 = rx
                    safe = "Increasing"
                }
                else if rx < r0 && (safe == "Unknown" || safe == "Decreasing") {
                    if rx < r0-3 {
                        break;
                    }
                    r0 = rx
                    safe = "Decreasing"
                }
                else {
                    break;
                }
                if idx == len(report)-1 {
                    // made it to the end, so it must be safe
                    reports_safe += 1
                }
            }
        }
        fmt.println("Reports safe: ",reports_safe)
    }
}
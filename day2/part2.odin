package day2

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
            fmt.println("Reports safe: ",reports_safe)
            good_report := good_level(report[0:],-1)
            if good_report {
                // made it to the end, so it must be safe
                reports_safe += 1
                continue
            }

            for idx in 0..<len(report) {
                if good_level(report[0:],idx) {
                    reports_safe += 1
                    break
                }

            }
        }
        fmt.println("Reports safe: ",reports_safe)
    }
}

good_level :: proc(report: []int, skip_idx: int) -> bool{
    safe := "Unknown"
    start_idx := 1
    r0 := report[0]
    if skip_idx == 0 {
        r0 = report[1]
        start_idx = 2
    }
    good_report := true
    for idx in start_idx..<len(report) {
        if idx == skip_idx {
            continue
        }
        rx := report[idx]
        if rx > r0 && rx <= r0+3  && (safe == "Unknown" || safe == "Increasing"){
            r0 = rx
            safe = "Increasing"
        }
        else if rx < r0 && rx >= r0-3 && (safe == "Unknown" || safe == "Decreasing") {
            r0 = rx
            safe = "Decreasing"
        }
        else {
            good_report = false
            break;
        }
    }

    return good_report
}
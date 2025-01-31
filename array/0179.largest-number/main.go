package main

import (
	"sort"
	"strconv"
)

//Title: Largest Number
//Link: https://leetcode-cn.com/problems/largest-number

func largestNumber(nums []int) string {
	sort.Slice(nums, func(i, j int) bool {
		x, y := nums[i], nums[j]
		sx, sy := 10, 10
		for sx <= x {
			sx *= 10
		}
		for sy <= y {
			sy *= 10
		}
		return sx*y+x < sy*x+y
	})
	if nums[0] == 0 {
		return "0"
	}

	var res []byte
	for _, v := range nums {
		res = append(res, strconv.Itoa(v)...)
	}
	return string(res)
}

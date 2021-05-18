package main

//Link:https://leetcode-cn.com/problems/valid-parentheses/

func isValid(s string) bool {
	m := map[rune]rune{
		'{': '}',
		'[': ']',
		'(': ')',
	}
	stack := make([]rune, 0)
	for _, v := range s {
		if mirror, ok := m[v]; ok {
			stack = append(stack, mirror)
		} else if 0 < len(stack) && stack[len(stack)-1] == v {
			stack = stack[:len(stack)-1]
		} else {
			return false
		}
	}
	return len(stack) == 0
}

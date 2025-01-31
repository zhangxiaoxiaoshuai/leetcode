package main

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func recoverTree(root *TreeNode) {
	var last, first, second *TreeNode
	var stack []*TreeNode
	for 0 < len(stack) || root != nil {
		for root != nil {
			stack = append(stack, root)
			root = root.Left
		}

		top := len(stack) - 1
		if last != nil && stack[top].Val <= last.Val {
			if first == nil {
				first = last
			}
			second = stack[top]
		}
		last = stack[top]
		root = stack[top].Right
		stack = stack[:top]
	}
	first.Val, second.Val = second.Val, first.Val
}

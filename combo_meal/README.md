# Combo Meal

https://www.hackerrank.com/contests/hourrank-26/challenges/combo-meal

A fast-food chain menu is selling a burger, a can of soda, and a combo meal containing a burger and a can of soda, at prices known to you.

They have chosen the selling price for each item by first determining the total cost of making the individual items and then adding a fixed value to it, representing their profit. Assume that the cost of making a regular burger is fixed and the cost of making a regular soda is fixed.

For example, if the cost of making a regular burger is , the cost of making a regular soda is  and the fixed profit is , then the fast-food chain will set selling prices as:

image

Given the price of a burger, a can of soda and a combo meal on the menu, your task is to compute the fixed profit.

Complete the function named profit which takes in three integers denoting selling price of a burger, a can of soda and a combo meal respectively, and returns an integer denoting the fixed profit.

## Input Format

The first line contains t, the number of scenarios. The following lines describe the scenarios.

Each scenario is described by a single line containing three space-separated integers, b, s and c, denoting how much a burger, a can of soda and a combo meal cost respectively.

Constraints
```
1 <= t <= 100
3 <= c <= 2000
2 <= b,s <= c
```

It is guaranteed that the cost of making each item and the profit are positive.

## Output Format

For each scenario, print a single line containing a single integer denoting the profit that the fast-food chain gets from every purchase. It is guaranteed that the answer is positive.

## Sample Input 0

```
3
275 214 420
6 9 11
199 199 255
```

## Sample Output 0

```
69
4
143
```

## Explanation 0

Case 1: Refer to the problem statement for this case.

Case 2: The selling price of a burger is , soda is , and combo meal is . If the cost to make a burger is , the cost to make a can of soda is  and the fixed profit is , you can verify the given selling prices as,  and . Hence, the answer is .

Case 3: The selling price of a burger is , soda is , and combo meal is . If the cost to make a burger is , the cost to make a can of soda is  and the fixed profit is , you can verify the given selling prices as,  and . Hence, the answer is .

 <!-- https://stackoverflow.com/questions/37715885/how-do-i-fake-io-input-when-testing-with-exunit -->

# Acid Naming

https://www.hackerrank.com/contests/w36/challenges/acid-naming

Your submission will run against only preliminary test cases. Full test cases will run at the end of the day.
Jonathan is in a science class, but because he does not understand how to name acids, he would like you to make a program for him. There are two types of acids at his level, non-metal and polyatomic.

Conditions for naming an acid:

If the given input starts with hydro and ends with ic then it is a `non-metal` acid.
If the input only ends with ic then it is a `polyatomic` acid.
If it does not have either case, then output `not an acid`.
For example, for the input, hydrochoroic, the correct output is -  as the input begins with hydro and ends withic.

Complete the function acidNaming which takes a string input with the name of the acid, and return a string describing the appropriate type of acid.

Input Format

The first line will contain an integer q.
The next q lines will contain a single word s.

Constraints
`1 <= q <= 100`
Word s is made up of lower-case english letters.
`2 <= Length of s <= 10 ** 4`
Output Format

If the word starts with hydro and ends with ic then it is a non-metal acid. Hence, the correct output is - .

If the word only ends with ic then it is a  . Hence, the correct output is  .

If the word does not meet any of the cases, then the correct output is   .

Sample Input 0

```
3
hydrochloric
rainbowic
idontevenknow
```

Sample Output 0
```
non-metal acid
polyatomic acid
not an acid
```

Explanation 0

In the first case, the input begins with hydro and ends with ic, hence, the correct output is - . 
In the second case, the input only ends with ic, hence, the correct output is  . 
The third case, the input neither begins with hydro nor ends with ic, hence the correct output is   .

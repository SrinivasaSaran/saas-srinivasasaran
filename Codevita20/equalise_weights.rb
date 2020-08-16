=begin
def get_input_v1
  number = []
  number_of_bags = gets.chomp
  for i in 1..2 * number_of_bags.to_i
    number.push(gets.chomp.strip)
  end
  number.map { |x| x.split() }
end
=end

def get_input
  number = {}
  number_of_bags = gets.chomp
  for i in 1..number_of_bags.to_i
    number[i.to_s] = { :no_of_items => gets.chomp.strip.to_i, :individual_weights => gets.chomp.strip.split().map { |w| w.to_i } }
  end
  number
end

def equalise_weights(input)
  no_of_bags = input.length
  weights = input.map { |weight| weight[1][:individual_weights] }
end

input = get_input
equalise_weights(input)

=begin

Equalize Weights
Problem Description

There are N bags. Each bag contains different number of goods. Goods can be of different weights. The goal is to equalize the weights in the bags subject to constraints explained below. Also, it is guaranteed that the bags can always be equalized with same total weight.

    Original number of goods in the bag should be same before and after equalization

    Any number of swaps required to do equalization, are permitted

Once the weights are equalized one needs to adhere to output specification to print out the result.

The output specification is as follows

    The contents of the Bag that contains the lightest weight should be printed in the first line

    The next lightest Bag contents should be printed on the second line

    So on and so forth, until all Bags along with their contents are printed

    Contents within the Bag must be printed in non-decreasing order

Refer example section for better understanding of constraint and print order

Input

First line contains an integer N denoting number of bags

Next 2N lines, each contain the following

          First line contains single integer G denoting the number of goods in a bag

          Second line contains G space separated integer which correspond to weight of goods in that bag

Output

Identify which bag needs to go on first line and print its contents on first line by adhering to output specification mentioned above

Similarly, identify which bag needs to get print on next N-1 lines and print their contents according to output specification mentioned above

Refer Example section for a better understanding of how to print the output
Constraints

0 < number of bags <= 20

0 < number of goods in each bag <= 20

0 < weight of any individual goods <= 10 ^ 4

Time Limit

1
Examples

Example 1

Input

3

2

6 13

3

20 7 10

1

4

Output

4 6 10

7 13

20

Explanation

There are 3 bags.

         First bag contains 2 goods of weights 6kg, 13kg.

         Second bag contain 3 goods of weights 20kg, 7kg, 10kg.

         Third bag contains 1 goods of weight 4kg.

Bag1 = [6, 13] => total weight = 19kg

Bag2 = [20, 7, 10] => total weight = 37kg

Bag3 = [4] => total weight = 4kg

Step 1: swap goods of weight 6kg from bag1 and goods of weight 7kg from bag2.

Bag1 = [7, 13] => total weight = 20kg

Bag2 = [20, 6, 10] => total weight = 36kg

Bag3 = [4] => total weight = 4kg

Step 2: swap goods of 20kg from bag1 and goods of 4kg from bag3.

Bag1 = [7, 13] => total weight = 20kg

Bag2 = [4, 6, 10] => total weight = 20kg

Bag3 = [20] => total weight = 20kg

Weights of bags are now equalized to 20kg.

Now we need to print the contents of each bag. For that, first sort the goods in the non-decreasing order as below:

Bag1 = [7, 13]

Bag2 = [4, 6, 10]

Bag3 = [20]

Least weighted good is 4kg and its in Bag2. So, print Bag 2 contents in first line.

Next least weighted goods in the remaining bags is 7kg and its in Bag1. So, print contents of Bag1 in the second line.

Finally, print the contents of Bag3 on line 3.

Example 2

Input

3

2

160 340

3

40 448 12

2

300 200

Output

12 40 448

160 340

200 300

Explanation

There are 3 bags.

         First bag contains 2 goods of weights 160kg, 340kg.

         Second bag contain 3 goods of weights 40kg, 448kg, 12kg

         Third bag contain 2 goods of weight 300kg and 200kg.

By the same procedure we will get the final weights in bags as follow:

  Bag1 = [12, 40, 448]

  Bag2 = [160, 340]

  Bag3 = [200, 300]

=end

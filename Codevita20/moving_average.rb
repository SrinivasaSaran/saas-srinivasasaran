=begin

Moving Average

GRAPH PIC IN MOBILE

Problem Description

A stock price is dynamic. Its value can change multiple times in a fraction of a second or remain unchanged for several minutes. Analyzing the dynamics of stock price change can provide an indication for forth coming uptrend or downtrend in that stock. One such indicator is simple moving averages. Now, Harry wants to analyze the price trend of the stock on the basis of moving averages (MA).

Let's consider a moving average of 2-day and 4-day respectively. A 2-day moving average is calculated by taking average of closing price of 2 consecutive days. A 4-day moving average is calculated by taking average of closing price of 4 consecutive days. Now, according to experts whenever a faster moving average curve (2-day MA) cuts the slower moving average (4-day MA) from below, then it is an indication of uptrend in the stock. Similarly, whenever a faster moving averages curve (2-day MA) cuts the slower moving average curve (4-day MA) from above, then it is an indication of downtrend in the stock.

Help Harry in computing the number of uptrends and downtrends in the given time for which the data is provided.

com.tcs.cv.automata.ei.middleware.DocxToHtmlConverter@278cd5a:image1.jpeg

In this graph, there are three lines indicating stock closing price, moving average of two days and four days .Now we can see that between 13th and 15th there is an intersection. It is known as downtrend when moving average of fewer days is cutting downwards the more days moving average and vice versa.

Note1 - There will be no day1 moving average for 2-day MA. Similarly there will be no day1, day2, day3 moving average for 4-day MA. In general there will be no X-1, X-2, Y-1, Y-2, etc day point for X-day and Y-day moving average curve.

Note2 - All the computation has to be accurate up to 6 digits after the decimal point.

Constraints

1 <= X, Y < 10^4

1 <= N < 10^5

Input

First line contains two space separated integers which are the moving average days X and Y.

Second-line contains an integer N denoting number of stock prices.

Third line contains N space separated decimal values denoting the closing price of the stock for N days.

Output

Print the total number of times the stock will give uptrend or downtrend.

Time Limit

1


Examples

Example 1

Input

3 5

11

4.55 5.4 5.65 5.4 5.2 4.85 4.95 5.05 4.9 4.9 4.95

Output

3

Explanation

Here we have two uptrends and one downtrend.

Example 2

Input

2 4

14

69.849998 72.900002 74.449997 77.300003 75.050003 74.349998 75.449997 76.300003 74 69.349998 65.349998 67.349998 67.599998 68.449997

Output

4

Explanation

This example is depicted in the image above. Here we have two uptrends (17th and 24th) and two downtrends (15th and 20th).

=end

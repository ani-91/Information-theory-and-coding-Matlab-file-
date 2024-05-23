# Information-theory-and-coding-Matlab-files
## Problem statements
### Problem 1
Develop a program to calculate the entropy of a text file (your name followed by BITS Hyderabad campus). (For example Name : Runa Kumari Text file will be: runakumaribitshyderabadcampus). 
### Problem 2
Develop a program to calculate the entropy of an image file (Image=take a picture of your ID Card).
### Problem 3
Write a program for arithmetic encoding technique using MATLAB. Find the tag value for first 5 characters of your name. Given probabilities are 1st letter=0.3, 2nd letter=0.2, 3rd letter=0.1, 4th letter=0.25, 5th letter=0.15. (Ex: If name is RUNA KUMARI, 1ST 5 letters are R=0.3, U=0.2, N=0.1, A=0.25, and SPACE( )=0.15)
### Problem 4
Implement a simulation code in Matlab in which a source generates a sequence of binary digits with equal probability and sends it through a binary symmetric channel for which the error probability is 0 .(number of letter in your first name). For such a channel, by varying the total number of digits transmitted from 100 to 20,000 in steps of 100 plot the following
- Number of digits that reached the receiver in error (got flipped by the channel) V/S the total number of digits transmitted
- The ratio of number of digits that came in error to the total number of digits that were transmitted V/S the total number of digits transmitted\
Note: Error probability=0.(number of letter in your first name only )\
For example : name : Runa Kumari Error probability=0.4\
name : S. Runa Kumari Error probability=0.4\
name : Runa K. Singh Error probability=0.4\
Range of acceptable error probability is 0.2 to 0.9 (In case your first name has more than 9 letters take error probability 0.9)
### Problem 5
Generate codeword and to find out minimum distance through linear block codes The code should display the Codewords with minimum distance for the given Parity Check matrix The code should display syndrome vector to find the bit error position\
- Find out generator matrix with the help of given H matrix (P <sup>T</sup> I= where P <sup>T</sup> should be generated as shown below)
![Screenshot 2024-05-23 104010](https://github.com/ani-91/Information-theory-and-coding-Matlab-files/assets/141425684/06c6fe42-0dd3-44ce-ac11-11f607a19f11)
- Generate U data vector, denoting all information sequences Iterate through an Unit Spaced Vector
- Iterate through Vector with Specified Increment
- Generate codewords and minimum distance
- To find out bit error position find out syndrome vector
- Generate the transmitted code(T) from last 4 LSB bits from as Information bits (ex 0415 H= 0415 = ( 1 1001 1111)<sub>2</sub> , Informtation bits K = 1111, generate the codeword for given K= 1111
- Find the syndrome for the codeword generated in last point i.e, for T (you should get 000 since no error)
- now flip the bit in T according to the procedure given below and find out the syndrome and prove the error is that position.\
(the MSB in last 3 digits of your ID\
Ex: ID= 415 and T= 1111100 then filp the 4 th bit (MSB in last digit) i.e, T = 1110100 check the syndrome\
    ID= 743 and T= 1111100 then filp the 7 th bit (MSB in last digit) i.e, T = 0111100 check the syndrome\
In case the MSB in last 3 digit of ID is 8 or 9 or 0 then flip the 7 th bit for example=ID= 915, T = 0111100 then flip 7th bit only i.e, T = 1111100)

#!/usr/bin/awk -f

#
# Jose Vargas
# Fall 2026
#09/27/2026
#Linux Administration
#Prof: Adrianna Holden-Gouveia
#

# The -f option in the shebang tells AWK to read the program from this script file.


# Part A
# Print the first name of all the Tooks followed by their total campaign contribution.


# BEGIN runs before AWK starts processing the records and changes the field separator to ":"
BEGIN {
	FS=":"
}

# split() divides the full name into array elements and stores the number of elements in n.
# The total variable adds the three campaign contributions.
# The condition checks whether the last name is Took. If true, it prints the first name
# and the total contribution of the current record.
{
	n = split($1,name," ");
	total = $3 + $4 + $5;
	if (name[n] == "Took")
		print name[1],total

}

# Part B
# Print the full names and contributions of anyone who contributed
# between $10 and $200 in the last contribution.

# $5 contains the last contribution. The condition checks whether it is
# greater than $10 and less than $200. If true, the full name and contribution are printed.
{
        if ($5 > 10 && $5 < 200)
                print $1,$5
}

# Part C
# Print the full names and average contribution of those who contributed
# less than $300 on average.

# The average of the three contributions is stored in the avg variable.
# The condition then checks whether the average is less than $300.
# If true, the full name and average contribution are printed.
{
	avg = ($3 + $4 + $5)/3;
	if  (avg < 300)
		print $1,avg
}

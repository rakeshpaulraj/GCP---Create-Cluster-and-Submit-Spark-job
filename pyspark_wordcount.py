from operator import add
lines = sc.textFile("/sampledata/sherlock-holmes.txt")

words =  lines.flatMap(lambda x: x.split(' '))
pairs = words.map(lambda x: (len(x),1))
wordsize = pairs.reduceByKey(add)
output = wordsize.sortByKey().collect()

# The above steps can also be done in a single line as follows:

# To allow Spark to perform its magic, the program needs to build a chain of transformations using the dot operator. 
# When it is passed to Spark in this way, Spark understands the multiple steps and that the results of one transformation are to be passed to the next transformation. 
# This allows Spark to organize the processing in any way it decides based on the resources available in the cluster. 
# So, while the above program is more readable, with "words", "pairs", and "wordsize" called out, the following program does the same thing without naming the intermediate results. 
# They are functionally identical.
output2 = lines.flatMap(lambda x: x.split(' ')).map(
    lambda x: (len(x), 1)).reduceByKey(add).sortByKey().collect()


for (size, count) in output2:
    print(size, count)

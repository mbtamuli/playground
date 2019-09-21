lines="""[16:01:31] <praveenkumar> #startclass
[16:01:39] <chandankumar> Roll Call
[16:01:42] <vbhjain> Vaibhav Jain
[16:01:42] <avik> Avik Mukherjee
[16:01:42] <akshays> Akshay Shipurkar
[16:01:43] <ak_d> Akhilesh Dhaundiyal
[16:01:43] <vharsh> Harsh Vardhan
[16:01:43] <LambaInsaan> Rhitik Bhatt
[16:01:44] <priyanka__> Priyanka Sharma
[16:01:45] <vshelar> Vivek Shelar
[16:01:47] <moizsajid> Moiz Sajid
[16:01:48] <rl56> Varsha R
[16:01:48] <abstatic> Abhishek Shrivastava
[16:01:49] <madhurii> Madhuri Muley
[16:01:49] <pyadav> Pooja Yadav
[16:01:49] <PrashantJ> Prashant Jamkhande
[16:01:49] <shobhitupadhyay> shobhit upadhyay
[16:01:50] <rohan_h> Rohan Hazra
[16:01:51] <suniva> Suniva Priyadarshini
[16:01:52] <deep123k> Deepanshu Kapoor
[16:01:53] <sandeepk> sandeep kumar choudhary
[16:01:59] <mspreddy> mspreddy
[16:02:01] <Anupama> Anupama Mandal
[16:02:02] <yASH> Yashwanth M
[16:02:04] <moon45> Mamoon Manzoor
[16:02:04] <akshay_> Akshay cv
[16:02:09] <chandu> chandu
[16:02:13] <jogender> Jogender Kota
[16:02:14] <srvsaha> Saurav Saha
[16:02:17] <sidhant> Sidhant Gupta
[16:02:19] <pabitra> Pabitra Pati
[16:02:56] <gkadam> ganesh kadam
[16:03:06] <sidhant> Good evening, I am new to dgplug and have spent the last few days going through the logs. I am still unclear with Git and the basics of python. So should I attend the session today or spend time clearing up python basics and Git? Thanks. <EOF>
[16:03:16] <chandankumar> sidhant, Welcome!
[16:03:51] <rahul_bajaj> rahul bajaj
[16:04:16] <jargonmonk> Aniket Khisti
[16:04:38] <chandankumar> So last class was on Python Data Structures.
[16:04:39] <satya4ever> Satyajit Bulage
[16:05:12] <chandankumar> I think most of you have queries, Feel free to type ! to ask your queries and wait for your turn to ask questions
[16:05:35] <moizsajid> !
[16:05:40] <sairam> sairam
[16:05:48] <chandankumar> next
[16:05:52] <mahesh5> Mahesh
[16:06:10] <moizsajid> Did we have a class on Friday?
[16:06:15] <praveenkumar> sidhant: I would suggest that you should spend time to clear python basic like variable, datatype, available data structure before jump to today session if you have basic knowledge of python then you can carry on.
[16:06:20] <moizsajid> previous Friday
[16:06:26] <praveenkumar> moizsajid: yes we had.
[16:06:43] <sidhant> chandrakumar: Thank you.
[16:07:09] <moizsajid> praveenkumar: Can you please upload the log for that class?
[16:07:26] <akahat> Roll Call : Amol Kahat
[16:07:57] <praveenkumar> moizsajid: Alright will make it available.
[16:08:08] <chandankumar> next
[16:08:10] <moizsajid> Thanks
[16:08:32] <chandankumar> Any more queries from last class before moving to new topic.
[16:09:20] <avik> !
[16:09:24] <chandankumar> next
[16:11:19] <avik> is there ay difference between print(dic[key]) and prit get(dic.get(key))?
[16:11:29] <avik> *any
[16:12:47] <praveenkumar> avik: yes, if you don't have key in the dictionary then first one give you a traceback KeyError and in second case if key not available then it will return None.
[16:12:48] <surajd> avik, if you do dict[key] and key is not present
[16:13:01] <surajd> oh praveenkumar answered it
[16:13:08] <mbtamuli12> Roll Call: Mriyam Tamuli
[16:13:35] <avik> ooo got that. thank you guys :)
[16:13:47] <chandankumar> next
[16:14:54] <chandankumar> So i am going to start with new topic \"Strings\"
[16:15:42] <chandankumar> So first question what are strings?
[16:16:03] <rahul_bajaj> sequence of characters placed together.
[16:16:25] <avik> an array of characters
[16:16:52] <moizsajid> Immutable data type
[16:17:06] <chandankumar> rahul_bajaj, avik moizsajid yes
[16:17:23] <chandankumar> but in simple words it is simple text
[16:17:40] <madhurii> set of characters
[16:18:14] <chandankumar> Everybody please open your terminal and start python3 interpreter
[16:19:11] <chandankumar> So in python a string can be declared using single quotes, double quotes or triple quotes
[16:19:18] <chandankumar> https://shellshare.net/r/summertraining
[16:19:25] <chandankumar> Everybody take a look here
[16:22:41] rtnpr0_ is now known as rtnpr0
[16:22:51] <chandankumar> Please try the above examples from https://shellshare.net/r/summertraining
[16:23:00] <chandankumar> and stop me if you have any queries
[16:23:41] <chandankumar> One interesting thing here when i have done 'hello world' and \"hello world\"
[16:24:13] <chandankumar> or \"\"\"hello world\"\" it has printed 'hello world'
[16:24:24] <mbtamuli12> chandankumar: Why does it return everything in single quotes?
[16:24:45] <avik> so, is triple double quote used for multilines ?
[16:25:00] <chandankumar> because python interpreter converts everything in single quotes by default
[16:25:01] <srvsaha> avik: Yes
[16:25:07] <chandankumar> avik, yes
[16:25:17] <avik> and others not?
[16:25:22] <mbtamuli12> chandankumar: Does it use this representation for internal use?
[16:26:05] <chandankumar> so suppose user enter anything from keyboard using '', or \"\" or \"\"\" quotes python first convert it into '' quotes
[16:26:09] <chandankumar> for example
[16:26:18] <chandankumar> see shellshare
[16:26:20] <mbtamuli12> Understood.
[16:27:01] <avik> I just saw even ''' works as \"\"\"
[16:27:19] <avik> is it right?
[16:27:26] <chandankumar> to understand in a better way let us print \"\" quoted strings
[16:27:42] <rahul_bajaj> avik, ''' are called as Docstrings, you will learn about them. very useful :)
[16:28:06] <vharsh> avik, These are just like Java's javadoc.
[16:28:09] <avik> :O
[16:28:14] <rahul_bajaj> as in they are used to write Docstrings.
[16:28:17] <avik> Thanks, btw
[16:29:40] <chandankumar> check the last example to understand difference
[16:31:31] <chandankumar> So this way use print double quotes with in a single quotes or vice versa.
[16:32:12] <chandankumar> let us i have to print it's
[16:32:47] <chandankumar> one way
[16:33:18] <chandankumar> another way of printing of it's
[16:33:26] <chandankumar> any queries till now?
[16:33:32] <srvsaha> no
[16:33:37] <madhurii> nope
[16:33:57] <chandankumar> ok going ahead
[16:35:10] <chandankumar> \"hello \n world\" does not printed in two lines
[16:35:20] <chandankumar> to print the output let's use print
[16:37:13] <chandankumar> In the same way we can use \t for tabs
[16:37:20] <chandankumar> got that?
[16:37:31] <PrashantJ> YEs
[16:37:46] <madhurii> yes
[16:37:51] <srvsaha>   jyes
[16:37:52] <PrashantJ> s/YEs/yes
[16:37:53] <vshelar> yes
[16:38:13] <chandankumar> so we can write multiple line statement using triple character
[16:39:12] <chandankumar> we can use \ to do multi line statement
[16:40:09] <pabitra> chandankumar, please don;t clear the shell as someone can later refer to it
[16:40:22] <chandankumar> pabitra, ack!
[16:41:38] <chandankumar> so we can use \ to do continuation with in the code or in the string.
[16:41:43] <kushal> pabitra, they can not
[16:42:21] <pabitra> i think we can scroll it up kushal
[16:42:44] <chandankumar> any queries till now?
[16:42:46] <kushal> pabitra, only when the session is on, it can get destroyed anytime.
[16:42:51] <srvsaha>   no
[16:43:03] <pabitra> oh okay
[16:43:05] <mbtamuli12> no question
[16:43:53] <chandankumar> ok moving ahead with string concatenation
[16:44:20] <chandankumar> concatenation can be done only when we have two string literals
[16:44:46] <chandankumar> we can + to do concatenation
[16:44:47] <avik> literals?
[16:45:24] <avik> !
[16:45:53] <chandankumar> next
[16:45:59] <avik> what are string literals?
[16:46:58] <chandankumar> avik, literals are nothing but data types like int , float
[16:47:17] <avik> ooo, got that
[16:47:20] <chandankumar> list, tuples or dict
[16:47:30] <chandankumar> now check shellshare
[16:48:14] <chandankumar> we can also use whitespace to do concatenation in python3
[16:49:23] <chandankumar> now try \"hello\" 2
[16:49:39] <chandankumar> in python3 interpreter and tell me the output
[16:49:53] <abstatic> invalid syntax
[16:50:15] <vshelar> Can't convert 'int' object to str implicitly
[16:50:24] <rahul_bajaj> >>> \"hello\" \"2\"
[16:50:24] <rahul_bajaj> 'hello2'
[16:50:35] <chandankumar> so concatenation will only work with same literals
[16:50:52] <chandankumar> * string literals
[16:51:10] <chandankumar> otherwise it will give error
[16:51:20] <chandankumar> any queries till now?
[16:51:59] <vshelar> No Queries...:)
[16:52:06] <chandankumar> so to concate \"hello\" str(2)
[16:53:10] <chandankumar> we can find the type of literal using type() function
[16:53:42] <chandankumar> moving ahead
[16:54:17] <chandankumar> let's learn some methods associated with strings
[16:55:21] <chandankumar> first is title() to convert it into titledcased version of the string
[16:55:50] <chandankumar> some other methods
[16:56:04] <chandankumar> upper() to make the string in upper case
[16:56:36] <chandankumar> to make it in lower case we can use lower() method
[16:57:58] <chandankumar> we can use swapcase() to return with case swapped
[16:59:21] <chandankumar> we can check truth value checking over string
[16:59:49] <chandankumar> like isupper() to check whether string is uppercases or islower() to check for lower cased
[17:01:34] <chandankumar> we can check whether all strings is of only numbers using isalnum()
[17:02:19] <chandankumar> sorry
[17:02:40] <srvsaha> !
[17:02:41] <abstatic> is it alpha numeric ?
[17:02:50] <chandankumar> we can use isalnum() for checking alpha numeric characters
[17:03:29] <chandankumar> digits + special characters + alphabets are alpha numerics
[17:04:30] <chandankumar> we can check all characters are numbers using isdigit()
[17:05:14] <chandankumar> can you check \"hello 123\" is alpha numeric or not?
[17:06:09] <vshelar> false
[17:06:09] <LambaInsaan> No
[17:06:14] <chandankumar> why?
[17:06:20] <vshelar> space
[17:06:21] <abstatic> space ?
[17:06:25] <srvsaha> false because of the whitespace
[17:06:35] <LambaInsaan> Space is not alpha numeric character.
[17:06:46] <chandankumar> LambaInsaan, yes correct
[17:07:46] <chandankumar> so from here we can tell anyone that a user can entered strings in caps or small or in alpha numeric
[17:07:57] <chandankumar> which is generally used in password system
[17:08:17] <chandankumar> through this
[17:08:22] <chandankumar> any queries till now?
[17:08:56] <vshelar> No queries...:)
[17:09:09] <chandankumar> there are two more methods
[17:09:18] <chandankumar> startswith() and endswith()
[17:09:23] <chandankumar> check shellshare
[17:11:19] <chandankumar> please stop me here if you have any queries till now
[17:11:26] <chandankumar> so that i can move in next part
[17:11:46] <abstatic> !
[17:11:50] <chandankumar> next
[17:12:16] <srvsaha> solved
[17:12:17] <abstatic> how do these methods work ? Do they check for one string literal ?
[17:12:24] <abstatic> s/check/match
[17:12:43] <chandankumar> abstatic, yes
[17:13:01] <abstatic> chandankumar, okay.
[17:13:12] <chandankumar> you can check with int literals and you can understand the difference
[17:13:22] <chandankumar> next
[17:13:26] <chandankumar> next
[17:13:32] <chandankumar> now moving ahead
[17:13:48] <chandankumar> we can split or join operations on a string
[17:14:02] <chandankumar> using split() method
[17:14:31] <chandankumar> split() takes a string as a argument
[17:14:37] <chandankumar> check shellshare
[17:15:48] <chandankumar> if we donot give any agrument it will takes space by default
[17:16:59] <chandankumar> split() always returns a list
[17:17:59] <chandankumar> let us join to the string
[17:18:12] <chandankumar> join() method takes lists a input
[17:19:23] <chandankumar> \"<using what to join>\".join(list)
[17:19:49] <chandankumar> one more example
[17:22:28] <chandankumar> so split and join methods clear?
[17:22:47] <jargonmonk> yes
[17:22:49] <srvsaha> yes
[17:22:57] <rahul_bajaj> yup :)
[17:23:04] <vshelar> yes
[17:23:19] <chandankumar> next topic is strip
[17:23:50] <chandankumar> strip() method also takes argument as a chars
[17:24:29] <chandankumar> if we donot pass anything in strip() it strips whitespaces and new line characters
[17:25:00] <chandankumar> check shellshare
[17:26:48] <chandankumar> if you want to do striping from left side use lstrip() and from right striping using rstrip()
[17:27:47] <chandankumar> when we do a.lstrip('wd')
[17:28:06] <chandankumar> it first bring wd in to 'w' , 'd' and 'wd'
[17:28:33] <chandankumar> if it first find 'w' in the string sequence it will strip w and stop
[17:29:20] <chandankumar> lstrip('dw')
[17:29:33] <chandankumar> it will first check whether it starts with d or w or dw
[17:29:46] <chandankumar> if d not, then go for w if w find stops
[17:30:01] <chandankumar> in the same rstrip() works
[17:30:52] <chandankumar> any queries till now?
[17:31:00] <chandankumar> one we have two more topics left
[17:31:54] * chandankumar waits for the response.
[17:31:58] <abstatic> !
[17:32:01] <chandankumar> next
[17:32:08] <abstatic> how to trim strings ??
[17:32:08] <riskarsh> Nope
[17:32:52] <madhurii> no queries
[17:32:58] <srvsaha> !
[17:33:00] <chandankumar> abstatic, using lstrip or rstrip we can trim strings
[17:33:30] <abstatic> chaitanya, okay.
[17:33:40] <abstatic> chandankumar, okay.
[17:33:50] <chandankumar> abstatic, we can do more triming or slicing over strings in upcoming topic
[17:33:55] <chandankumar> just like list
[17:34:00] <chandankumar> next
[17:34:08] <srvsaha> while stripping from right or left when an argument is passed, is it not mandatory to maintain the order of the arg passed to strip, o anything from it ?
[17:34:19] <abstatic> ok. I was hoping we'd have something like trim from python.
[17:34:42] <srvsaha> abstatic: yes, we have slicing
[17:34:44] <abstatic> s/from python/from php
[17:35:54] <rahul_bajaj> srvsaha, nope, the order doesnt matter if you have only a single character say 'w' or 'd' from 'wd' but if you have a complete 'wd' the sequence would matter.
[17:36:28] <srvsaha> ok thanks rahul_bajaj
[17:36:35] <chandankumar> rahul_bajaj, Thanks :-)
[17:36:38] <abstatic> !
[17:36:42] <chandankumar> next
[17:36:44] <abstatic> how did this last example with rstrip work ?
[17:36:48] <pabitra> abstatic, have patience
[17:36:54] <abstatic> 'rgo' does not match ?
[17:37:10] <pabitra> you will get to know about slicing in upcoming sessions :)
[17:37:36] <chandankumar> abstatic, so the set generated here might be in any order
[17:37:45] <chandankumar> 'org' might comes earlier
[17:37:57] <surajd> abstatic, the characters need to be in sequence
[17:38:11] <surajd> srvsaha, ^^ rahul_bajaj
[17:38:31] <avik> I think rstip reads string in right to left way, is it so?
[17:38:38] <abstatic> I did not understand
[17:38:59] <abstatic> where does this set thing fit in here ? I though it just compares the string given in the arg and then removes ?
[17:39:17] <abstatic> s/though/thought
[17:39:22] <chandankumar> rstrip works from right to left
[17:39:43] <avik> ok, thanks chandankumar
[17:40:21] <chandankumar> abstatic, http://python-reference.readthedocs.io/en/latest/docs/str/rstrip.html
[17:40:38] <surajd> avik, abstatic http://pastebin.centos.org/49536/
[17:41:06] <chandankumar> abstatic, ^^
[17:41:17] <abstatic> chandankumar, surajd thanks
[17:41:23] <abstatic> I got it :)
[17:41:27] <chandankumar> moving to next topic
[17:41:38] <chandankumar> we can find a string or character with in a string
[17:41:52] <chandankumar> check shellshare
[17:42:50] <chandankumar> find() method will give index
[17:43:05] <chandankumar> if a searched string is not found it will return -1
[17:43:24] <rahul_bajaj> index starting from 0.
[17:43:32] <chandankumar> rahul_bajaj, yes
[17:43:52] <chandankumar> as earlier said strings are immutable their index value is not changed
[17:44:33] <chandankumar> we can find the length of string using len(\"string\") function
[17:44:54] <chandankumar> now moving to last topic
[17:44:58] <chandankumar> string slicing
[17:45:11] <chandankumar> before moving ahead any queries
[17:45:11] <chandankumar> ?
[17:45:21] <srvsaha> no
[17:45:23] <jargonmonk> nope.
[17:45:26] <vshelar> no
[17:45:26] <abstatic> nope
[17:45:36] <rahul_bajaj> nope :)
[17:45:47] <chandankumar> just like list we can do slicing
[17:46:04] <chandankumar> difference between string and list is immutability nature
[17:46:13] <chandankumar> i mean their index value is not changed
[17:46:17] <chandankumar> check shell share
[17:49:02] <rahul_bajaj> !
[17:49:27] <chandankumar> next
[17:49:33] <rahul_bajaj> chandankumar, a[1:5] would mean starting from index 1 and till index 4. i think.
[17:49:43] <chandankumar> rahul_bajaj, yes
[17:49:48] <chandankumar> rahul_bajaj, typed wrongly
[17:49:53] <rahul_bajaj> :D
[17:49:56] <chandankumar> it basically acts as a range
[17:50:40] <avik> !
[17:50:43] <chandankumar> a[1:6:2]
[17:51:10] <chandankumar> it will print from from index 1 to till 5 by taking two steps
[17:51:12] <chandankumar> next
[17:51:15] <avik> after this can you please give another example of rstip!
[17:51:28] <chandankumar> avik, sure
[17:51:38] <avik> :
[17:51:40] <avik> :)
[17:51:46] <chandankumar> got that string slicing?
[17:51:55] <chandankumar> any queries
[17:51:57] <chandankumar> ?
[17:52:25] <srvsaha>   no
[17:52:28] <chandankumar> we can reverse the string using a[::-1]
[17:52:50] <chandankumar> we can also run for loop on string
[17:53:21] <chandankumar> Before ending the class
[17:53:28] <chandankumar> please follow these two links
[17:53:33] <chandankumar> http://pymbook.readthedocs.io/en/latest/strings.html
[17:53:40] <chandankumar> https://docs.python.org/3.1/tutorial/introduction.html#strings
[17:53:54] <chandankumar> we can take questions tomorrow
[17:54:02] <chandankumar> Roll Call
[17:54:07] <rahul_bajaj> Rahul bajaj
[17:54:07] <ak_d> Akhilesh Dhaundiyal
[17:54:08] <jargonmonk> Aniket Khisti
[17:54:14] <srvsaha> Saurav Saha
[17:54:15] <suniva> Suniva Priyadarshini
[17:54:23] <madhurii> Madhuri Muley
[17:54:24] <rl56> Varsha R
[17:54:28] <abstatic> Abhishek Shrivastava
[17:54:32] <LambaInsaan> Rhitik Bhatt
[17:54:32] <priyanka_> Priyanka Sharma
[17:54:37] <vshelar> Vivek Shelar
[17:54:38] <moizsajid> Moiz Sajid
[17:54:40] <avik> Avik Mukherjee
[17:54:41] <HoloIRCUser1> Mamoon Manzoor
[17:54:51] <Anupama> Anupama Mandal
[17:54:56] <jogender> Jogender Kota
[17:54:58] <shobhitupadhyay> shobhit upadhyay
[17:55:15] <mahesh5> mahesh
[17:55:26] <pyadav> Pooja Yadav
[17:55:32] <praveenkumar> #endclass"""

result = {}

for line in lines.split("\n"):
    line = line[11:]
    name = line.split()[0]
    print(name)
    if name in result:
        result[name] = result.get(name) + 1
    else:
        result[name] = 1

print(result)
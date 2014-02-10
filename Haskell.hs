--HASKELL CHEAT SHEET!! YAY!!!!
--This cheat sheet is something I'm making as I learn Haskell
--  Much of this was copied from the fantastic guide "Learn You a Haskell" by Miran Lipovaca
--  http://learnyouahaskell.com/ 
--  This guide is fun and pretty awesome. I wish all learning was as fun as this.
--  *I'm only on chapter three - Types and Typeclasses
--Format for my guide:
expression --return value  ADDITIONAL COMMENTS

--Stuff
odd 3 --True
even 3 --False
min 3 5 --3
minimum [1,6,3,7,0] --0
max 8 12 --12
maximum [1,6,3,7,0] --7
succ 8   --9
succ 'a' --'b'

--Growing a list!
[1,3] ++ [5,7] --[1,3,5,7]
"hello " ++ "world" --"hello world"
'P':"repend to List" --"Prepend to list"
"get Element" !! 6 --'e'

--Nesting lists!! *You cannot nest lists of integers with lists of characters
[[1,2,3,4],[1,3,5,7,9],[2,4,6,8],[[1,1,1],[2,2,2],[3,3,3]]]

--Getting pieces of a list
head [5,4,3,2,1] --5
tail [5,4,3,2,1] --[4,3,2,1]
last [5,4,3,2,1] --1
init [5,4,3,2,1] --[5,4,3,2]
reverse [5,4,3,2,1] --[1,2,3,4,5]
take 3 [5,4,3,2,1] --[5,4,3]
drop 3 [5,4,3,2,1] --[3,2,1]

--Operations on lists
sum [5,4,3,2,1] --15
product [5,4,3,2,1] --120
4 `elem` [5,4,3,2,1] --True
length [5,4,3,2] --4
reverse [5,4,3,2,1] --[1,2,3,4,5]
take 3 [5,4,3,2,1] --[5,4,3]
drop 3 [5,4,3,2,1] --[3,2,1]

--Creating lists!!!!!!!!!!!!!!!!!!!!!
[1..5] --[1,2,3,4,5]
['a'..'f'] --"abcdef"
[2,5..20] --[2,5,8,11,14,17,20]
[10,9..5] --[10,9,8,7,6,5]
[0.1, 0.3 .. 1] --[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]  Infinite lists and floats don't play well together

[2,4..] --Infinite list!!
take 5 [2,4..] --[2,4,6,8,10]
cycle "LOL " --infinite list that repeats "LOL LOL LOL "
repeat 5 --infinite list [5,5,5,5,5,5,5,5,5..]

[x*2 | x <- [1..10]] --[2,4,6,8,10,12,14,16,18,20] 
[x | x <- [1..100], x `mod` 7 == 3, x > 50] --[52,59,66,73,80,87,94]
[if x < 10 then "BOOM!" else "BANG!" | x <- [7..13], odd x] --["BOOM!","BOOM!","BANG!","BANG!"] 
[ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50] --[55,80,100,110] 
[1 | _ <- [1..10]] --[1,1,1,1,1,1,1,1,1,1]

--Tuples!! *Tuples are of set size (unlike lists) but can contain multiple types
[(1,3),(8,11),(4,5)]
("Josh", "Male", 18, True) --pairs/triples/quads can have different data types in a set order
fst ("Josh", 18) --"Josh"  ONLY WORKS ON PAIRS
snd ("Josh", 18) --18  ONLY WORKS ON PAIRS
zip ["ABC", "DE", "I"] [1,2,3] --[("ABC,1),("DE",2),("I",3)]
zip ['a','b'..] [1,2,3,4,5,6] --[('a',1),('b',2),('c',3),('d',4),('e',5),('f',6)
[ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2] --[(3,4,5), (6,8,10)]

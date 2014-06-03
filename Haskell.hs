--HASKELL CHEAT SHEET!! YAY!!!!
--This cheat sheet is something I'm making as I learn Haskell
--  Much of this was copied from the fantastic guide "Learn You a Haskell" by Miran Lipovaca
--  http://learnyouahaskell.com/ 
--  This guide is fun and pretty awesome. I wish all learning was as fun as this.
--  *I only just started Chapter Seven - Modules
--Format for my guide:
expression --return value  ADDITIONAL COMMENTS



-- Random Stuff
:set prompt "ghci> " --Changes prompt from Prelude> to ghci>
:l file 	--loads file.hs (you need to run GHCI from the directory that file.hs is in, however
:r				--reloads file. Use this after you save edits to a file

odd 3 --True
even 3 --False
min 3 5 --3
minimum [1,6,3,7,0] --0
max 8 12 --12
maximum [1,6,3,7,0] --7
succ 8   --9
succ 'a' --'b'

-------------------------------------------------------------------------------------------------------
--LISTS AND TUPLES
-------------------------------------------------------------------------------------------------------

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

--Growing a list!
[1,3] ++ [5,7] --[1,3,5,7]
1 : [3,5,7] --[1,3,5,7]				NOTE: This function is computationally much cheaper than '++'
"hello " ++ "world" --"hello world"
'P':"repend to List" --"Prepend to list"
"gEt ElemEnt" !! 6 --'e'

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
takeWhile (\=300) [1..500] --[1..299] 	Takes first elem form array until the predicate is False

--Operations on lists
sum [5,4,3,2,1] --15
product [5,4,3,2,1] --120
4 `elem` [5,4,3,2,1] --True
length [5,4,3,2] --4
reverse [5,4,3,2,1] --[1,2,3,4,5]
take 3 [5..9] --[5,6,7]
drop 3 [5..9] --[8,9]
map (/10) [5,4,3,2,1] --[.5, .4, .3, .2, .1]
filter (<3) [5,4,3,2,1] --[2,1]
foldl (+) 0 [5,4,3,2,1] --15				NOTE: foldl and foldr need a starting value (0 in this case) foldl1 and foldl2 use head of array
foldr (+) 0 [5,4,3,2,1] --15				NOTE: Right folds work on infinite lists, but left folds do not
factorial a = foldl1 (*) [1..a] --creates array [1..a] then does 1*2, then 2*3, then 6*4, then 24*5, etc. 
factorial a = foldr1 (*) [1..a] --creates array [1..a] then does a * (a-1), then a(a-1) * (a-2), then a(a-1)(a-2) * (a-3), etc. 
map' f xs = foldr (\x acc -> f x : acc) [] xs --implementation of map using foldr and lambda expressions
scanl (+) 0 [5,4,3,2,1] --[0,1,3,6,10,15]		Like foldl, but adds intermediate state of accumlator to array at each step
scanr (+) 0 [5,4,3,2,1] --[15,10,6,3,1,0]
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) --Returns x such that sum of the square roots of [1..x] is less than 1000
sqrtSums = length $ takeWhile (<1000) $ scanl1 (+) $ map sqrt [1..] --Spaces are left associative and $ is right associative, so we don't need parens here
sqrtSums = 																						--A more readable version
		let oddSquares = filter odd $ map (^2) [1..]			--Isn't it cute?
				belowLimit = takeWhile (<1000) oddSquares
		in sum belowLimit
map ($ 3) [(4+), (^2), sqrt]	--[7.0, 9.0, 1.732]		map function application over a list of functions
foo = negate . (*3) --multiplies by three then negates it		Use '.' when you need to perform multiple operations
bar x = ceiling (negate (tan (cos (max 50 x)))) --can be rewritten as
bar = ceiling . negate . tan . cos . max 50			--Haskell, why you so cool??


--Tuples!! *Tuples are of set size (unlike lists) but can contain multiple types
[(1,3),(8,11),(4,5)]
("Josh", "Male", 18, True) --pairs/triples/quads can have different data types in a set order
fst ("Josh", 18) --"Josh"  ONLY WORKS ON PAIRS
snd ("Josh", 18) --18  ONLY WORKS ON PAIRS
zip ["ABC", "DE", "I"] [1,2,3] --[("ABC,1),("DE",2),("I",3)]
zip ['a','b'..] [1,2,3,4,5,6] --[('a',1),('b',2),('c',3),('d',4),('e',5),('f',6)]
[ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2] --[(3,4,5), (6,8,10)]


-------------------------------------------------------------------------------------------------------
--TYPES AND TYPECLASSSES!!  
-------------------------------------------------------------------------------------------------------

--NOTE: Int has a min/max value. Integer has no min/max, but runs slower.
--NOTE: Things that start with a capital letter are Types.
--Some common Types:
--	Int				integer (bounded)
--	Integer		integer (unbounded)
--	Float			floating point number with single precision
--	Double		floating point number with double precision
--	Bool			boolean
--	Char			character, single quotes
--	Ordering	can be GT, LT, or equal to

:t "Return type of an expression" --"Return type of an expression" :: [Char]
:t max --max :: Ord a => a -> a -> a->
:t (==) --(==) :: (Eq a) => a -> a -> Bool
function :: Integer -> Integer --Use this syntax to declare the type of your function

--Some common typeclasses:
--  Eq: == /=               functions that test equality
--  Ord: > <= `compare`     functions reutrn greater than, less than or equal to
--  Show: Int Bool Char     Any Type that can be written as a String
--  Read: String            Opposite of Show. Reads String as member of other type
--  Enum: [1..8] ['a'..'e'] Sequentially ordered types (i.e. 'succ')
--  Bounded: Int Char Bool  Member with upper and lower bound
--  Num: Int Integer Double Any Type of number. Whole numbers are polymorphic constants
--  Integral: Int Integer   Any whole number
--  Floating: Float Double  Floating point numbers
show 3.7 --"3.7"
read "True" || False --True YOU NEED ANOTHER TYPE (False in this case) TO HELP READ KNOW WHAT ITS READING
read "[1,2,3,4,5]" :: Int --[1,2,3,4,5]
maxBound :: Int --2147483648
minBound :: Char --'\NUL'
fromIntegral 34 --34  Converts from Type 'Integral' to 'Num' (makes numbers play nice together)



-------------------------------------------------------------------------------------------------------
--FUNCTIONS!!!! LYAH puts the funk in funktions
-------------------------------------------------------------------------------------------------------

--  Define your functions type class
--  Define specific instances (i.e. foo 0 = ??? or foo "Yes" = ???)
--  Define nonspecific instances (i.e. foo a = ???)
--Haskell searches for a match top to bottom, so your last definition should be like your final else
factorial :: (Integral a) => a -> a
factorial 0 = 1		--Take care of simple cases
factorial n = n * factorial (n-1) --then define recursive part
--Cool stuff you can do:
foo [] = [] 	--empty aeeay
foo (_:[]) = "One Element"		--One element whose value we don't care about (we only care that it exists)
foo (_:_:xs) = "Multiple Elements"		--Two elements whose value we don't care about

bar (x1,y1) (x2,y2) = (x1+x2,y1+y2)		--add tuples element-wise

woo all@(x:xs) = "First letter of " ++ all ++ " is " ++ [x] --all is whole array, x is head, xs is tail

rar :: [Integer] -> String
rar [] = "MORE!!!"
rar (_:[]) = "MORE!!!!"
rar a
	| n > first  = "First is small"
	| n > second = "Second should be bigger"
	| otherwise  = "All Good"
   where n = 100
         (first:second:_) = a
				 
-------------------------------------------------------------------------------------------------------
--HIGH ORDER CURRIED FUNCTIONS!!
-------------------------------------------------------------------------------------------------------

multTwo :: (Num a) => a -> (a -> a)
multTwo x y = x*y				
multByFour = multTwo 4	--This returns a function that will multiply the input by four

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)		--Returns a function that divides input by ten

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWithh :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWithh _ [] _ = []		--return empty array if wither array runs out
zipWithh _ _ [] = []
zipwithh f (x:xs) (y:ys) = f x y : zipWithh f xs ys --return zip of first elemnts prepended to zip of the rest of the array

flipp :: (a->b->c) -> (b->a->c)
flipp f = g
	where g x y = f y x --reverses order of inut parameters to f

map :: (a->b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs

quickSort [] = []
quickSort x:xs = lower ++ x ++ upper
	where lower = quickSort (filter (<=x) xs)
				upper = quickSort (filter (>x) xs)

--sumotherfunctionsyoboyjollygood
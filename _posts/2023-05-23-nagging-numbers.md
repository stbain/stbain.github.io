---
title: Nagging Numbers
date: 2023-05-23T11:42:51-04:00
author: Stuart
layout: post
---
## The Problem ##

I used to work almost exclusively with the auction industry, and today I was reminded of an old problem we used to run into. I thought I would share it with you while it was still fresh on my mind: lot numbers.

Auctioneers deal with all sorts of numbers: prices, dates and times, bidder numbers, bids, acreage, etc. etc. The list goes on and on, but the one number that always seemed to throw a monkey wrench into the IT systems were the lot numbers. When auctioneers sell multiple items, they usually assign lot numbers to the individual lots. Many auctioneers use computer software to manage their auctions and the items in the catalog, so even some auctions where there is only one item up for sale (e.g. a house going up for auction) have a lot number assigned to the house.

Lot numbers are useful for keeping large auctions organized and ensuring the winning bids and items are tracked properly. A person acting as a clerk for the auction can more easily track the lot number, winning bidder number, and winning bid than in an unorganized auction where the lots are picked at random and vary in description. See for yourself:

* With lot numbers: Lot # 836, bidder # 243, winning bid $65
* Without lot numbers: The guy in the blue shirt over in the corner won the box with the three books in it for $65

Depending on the size of the auction, the second method without the lot numbers can get very unwieldy very quickly. Here's the problem, though: auctioneers like to start lot numbers with "1".

I know it may not seem like much of a problem. It makes perfect sense to start with the first lot as lot number one. After all, when you're counting stuff, that's where you start! You start at one, then you move on to two, and you keep going until you're done. It makes a lot of sense, and that's how auctions have been done for centuries. With clerking systems dependent on pen/pencil and paper, it makes perfect sense, so what's the problem? Computers. Computers ruin everything, and here's why:

*When you're using a computer to sort the lot numbers into order, the computer will look at the lot numbers and put them in order. It's fast, easy, and saves a ton of time; however, **the computer may not put the lots into numerical order**. The computer may revert to its default way of thinking and order the lots in **alphabetical order** instead.*

Here's an example. Suppose we have a small auction with twelve lots:

* Numerical order
    - 1
    - 2
    - 3
    - 4
    - 5
    - 6
    - 7
    - 8
    - 9
    - 10
    - 11
    - 12

* Alphabetical order
    - 1
    - 10
    - 11
    - 12
    - 2
    - 3
    - 4
    - 5
    - 6
    - 7
    - 8
    - 9

To make matters worse, this pattern repeats if we increase the number of lots!

* 2
* 20
* 21
* ...
* 200
* 201
* ...
* 3
* 30
* 31
* etc.

It may not seem like a big problem, but for auctioneers who have been starting with "Lot number one" for decades, it causes major problems. They want their website and auction catalog to be in order and look nice!

## How to solve it? ##

There are a few different ways to approach the problem. One way would be to do what's called "left padding" by inserting zeroes at the beginning of the lot numbers. For example,

* 001
* 002
* ...
* 010
* 011
* ...
* 020
* 021
* ...
* 100
* 101
* ...
* 910

This works great but introduces another problem: stripping the zeroes. Some spreadsheet programs and computer languages will recognize the value as a number, realize that "001" really means "1", and just put a "1" in the lot number. When it comes time to sort the numbers into order, we're back to square 1 (or is it square 001?).

Another method may be to introduce letters into the mix: A1, A2, etc. to make sure the alphabetical sort of the lots comes out the intended way; however, this can be unwieldy and confusing. Not only that, but mixing letters into the lot number column on a spreadsheet can result in some odd behavior when compared to keeping it to pure numbers.

## The solution ##

Here's the best method I could come up with and recommended years ago while still working in the auction industry:

1. Count up the total number of lots. For example: 2653
2. If the first digit of your lot total is less than nine, turn the first digit of your lot total into a 1: **1**653
3. If the first digit of your lot total is a nine, turn the first digit of your lot total into a 10: **10**653
4. Turn the rest of the digits into zeros: 1**000**
5. Add one to come up with your first lot number: **1,001**

Another way to think of it is...

* Any total lot count less than 900 starts with lot 101
* Any total lot count less than 9,000 starts with lot 1001
* Any total lot count less than 90,000 starts with lot 10001
* etc. 

It's not an exact solution, but more of a general rule of thumb. The goal is simply to ensure all of your lots have the exact same number of digits and that none of them start with zero.

### Side note: ###
Some auctioneers also reserve the first five to ten lot numbers for informational notices such as the bidder terms and conditions, announcements, etc. In that case, you may end up with the first round of bidding going towards lot number 1010 or something similar. If there are over 9000 lots in the auction, the lot number total will need to be adjusted accordingly.

## Conclusion ##

Yes, it's simple math; however, it can be a pain in the rear if not approached with some careful planning and forethought ahead of time. If you're ever in a situation, regardless of whether you are in the auction industry or not, where you start to see numbered items sorted into 1, 10, 11, 12, ..., 2, 20, 21, ..., 3, 30, 31, 32, ..., 4, 40, etc., then you know what you need to do! 
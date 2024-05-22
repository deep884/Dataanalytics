use deepali;
desc swiggy;
select*from swiggy;
/*The dataset is about the online food delivery app called "swiggy".The dataset is downloaded and imported in Mysql 
using 'Table Data import Wizard'.The dataset have 12 Column and 5000 rows.The querries in thedataset are analyzed as
below:*/
#HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
#WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
# HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
#WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
#WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
#WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU
# CATEGORY FOR EACH RESTAURANT?
#FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE.
#WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?


#Q1
#HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
select count(distinct restaurant_name) as High_rated_restaurants
from swiggy where rating>4.5;

# Q2
#WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select city ,count(distinct restaurant_name) as restaurant_count
group by city 
order by restaurant_count desc limit 1;

# Q3
# HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
select distinct restaurant_name as pizza_restaurants
from swiggy where restaurant_name like '%Pizza%';

#Q4
#WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select cuisine,count(*) as common_cuisine_count
from swiggy group by cuisine order by common_cuisine_count desc limit 1 ;

#Q5
#WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
select city,avg(rating) as average_rating
from swiggy group by city;

#Q6

#WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU
# CATEGORY FOR EACH RESTAURANT?
select distinct restaurant_name,menu_category ,max(price) as highest_price
from swiggy where menu_category='Recommended'
group by restaurant_name,menu_category;

#Q7
#FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE.
select distinct restaurant_name,cost_per_person
from swiggy where cuisine<>'Indian'
order by cost_per_person desc limit 5;

#Q8
#WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?

select restaurant_name,menu_category,count(item) as No_of_Items
from swiggy where menu_category='Main Course'
group by restaurant_name,menu_category
order by No_of_Items desc limit 1;

show tables;
desc swiggy;

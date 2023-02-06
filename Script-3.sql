--Question 2
select count(film_id), c.category_id 
from category c 
join film_category fc 
on fc.category_id = c.category_id 
group by c.category_id

select *
from category c 

create or replace function num_of_film_in_category(letter integer)
returns INTEGER
language plpgsql
as $$
		declare category_count integer;
begin
		select count(*) into category_count
		from film_category
		where category_id = letter
		group by category_id;
		return category_count;
end;
$$; 

select num_of_film_in_category(1);

--Quetion 1
select *
from film f 

insert into film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
values(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)

create or replace procedure add_film(title varchar(500), description text, release_year year, language_id integer, rental_duration integer, rental_rate numeric(5,2), "length" integer, replacement_cost numeric(3,2), rating mpaa_rating)
language plpgsql
as $$
begin 
	insert into film (title, description, release_year, language_id, rental_duration, rental_rate, "length", replacement_cost, rating)
	values(title, description, release_year, language_id, rental_duration, rental_rate, "length", replacement_cost, rating);
end;
$$;
  
call add_film('family guy', 'Stewie becomes a man', 2020, 1, 5, 5.99, 50, 20.99, 'PG');
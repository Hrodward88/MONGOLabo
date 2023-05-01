SELECT i.Rental_rental_id, r.rental_id
FROM inventory2 AS i
JOIN blockbuster.Rental AS r ON i.Rental_rental_id = r.rental_id;

select Rental_rental_id from inventory2;

DESCRIBE inventory2;

SHOW columns from films_clean2;

select * from films_clean2
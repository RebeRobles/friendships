select * from users;
select * from friendships;

select
	users.first_name as 'first_name',
    users.last_name as 'last_name',
    users2.first_name as 'friend_first_name',
    users2.last_name as 'friend_last_name'
    from users left join friendships 
	on friendships.user_id = users.id left join users as users2 
	on users2.id = friendships.friend_id
    where friendships.friend_id > 0
    order by first_name;
    
/* 1. Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados. */
select
	users2.first_name as 'friend_first_name',
	users2.last_name as 'friend_last_name',
	users.first_name as 'first_name',
	users.last_name as 'last_name'
from users inner join friendships 
on friendships.user_id = users.id inner join users as users2 
on users2.id = friendships.friend_id
where users2.first_name = 'Kermit';

/* 2. Devuelve el recuento de todas las amistades.*/ 
select
    count(users2.id) as 'Recuento de amistades'
from users
left join friendships 
on friendships.user_id = users.id 
left join users as users2 
on users2.id = friendships.friend_id;

/* Solución del profe*/
select
    count(id) as 'Recuento de amistades'
from friendships;

    
/* 3. Descubre quién tiene más amigos y devuelve el recuento de sus amigos.*/
select
	users.first_name as 'first_name',
	users.last_name as 'last_name',
    count(friendships.id) as 'Cantidad amigos'
from users inner join friendships 
on friendships.user_id = users.id  inner join users as users2 
on users2.id = friendships.friend_id
group by concat(users.first_name, ' ', users.last_name)
order by 3 desc
limit 2;

/* 4. Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.*/
insert into users(first_name, last_name, created_at, updated_at) 
values('Michelle', 'Wilson', now(), now());

insert into friendships(user_id, friend_id, created_at, updated_at)
values( 6, 2, now(), now());

insert into friendships(user_id, friend_id, created_at, updated_at)
values( 6, 4, now(), now());

insert into friendships(user_id, friend_id, created_at, updated_at)
values( 6, 5, now(), now());

/* 5. Devuelve a los amigos de Eli en orden alfabético.*/
select
	concat(users.first_name, ' ', users.last_name) as 'Nombre usuari@',
	users2.first_name as 'first_name',
	users2.last_name as 'last_name'
from users inner join friendships 
on friendships.user_id = users.id  inner join users as users2 
on users2.id = friendships.friend_id
where users.first_name = 'Eli';    
    
/* 6. Eliminar a Marky Mark de los amigos de Eli.*/
delete from friendships where (user_id = 2) and (friendships.friend_id = 5); 


/*7. Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos*/
select
	users.first_name as 'first_name',
    users.last_name as 'last_name',
    users2.first_name as 'friend_first_name',
    users2.last_name as 'friend_last_name'
    from users inner join friendships 
	on friendships.user_id = users.id inner join users as users2 
	on users2.id = friendships.friend_id
    order by first_name;


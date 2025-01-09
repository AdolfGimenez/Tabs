alter table transaction
    add pos_ticket_number varchar(255) null;
alter table pos_data
    add pos_ticket_number varchar(255) null;

SELECT * FROM transaction;
SELECT * FROM pos_data;

select * from integrator.`transaction` t WHERE dat
where t.point_of_sale_id in ('9','10') #se comenta para quitar de todos los comercios
and t.operation_type ='PURCHASE'
order by date_time DESC , point_of_sale_id desc;


select * from integrator.point_of_sale pos;
select * from integrator.`local` l;

select a.*,b.* from integrator.point_of_sale a inner join integrator.`local` b
where a.local_id = b.id;

--------------------------------
alter table transaction
    add api_version varchar(50) null;
alter table transaction
    add issuer_name_authorizer varchar(255) null;
alter table pos_data
    add issuer_name_authorizer varchar(255) null;

alter table transaction
    add client_doc varchar(255) null;
alter table transaction
    add cashier_doc varchar(255) null;
alter table transaction
    add cashier_pin varchar(255) null;
alter table transaction
    add sender_mobile_number varchar(255) null;
alter table transaction
    add recipient_mobile_number varchar(255) null;
alter table transaction
    add client_birth_date date null;


alter table transaction
    add alias varchar(255) null;

select c.id, c.code, c.name, l.*, p.*
from integrator.point_of_sale p, integrator.`local` l, integrator.commerce c
where l.id  = p.local_id
and l.commerce_id = c.id
and p.pos_id  = '80000505';



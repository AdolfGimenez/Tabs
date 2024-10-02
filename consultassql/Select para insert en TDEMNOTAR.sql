select e.tdbinentid neentid, e.tdbinnro nebinnro,
e.tdctanro nectanro, e.tdadhcta neadhcta,
e.tdemcta neemcta, c.tdctatar nenrotarj ,
e.tdemfecexp nefchexp, c.tdctatar nrotarjcta
from gxbdbps.tdemis e
join gxbdbps.tdcta c
on e.tdbinentid = c.tdbinentid and
e.tdbinnro = c.tdbinnro and
e.tdctanro = c.tdctanro
left join gxbdbps.tdemnotar t
on e.tdbinentid = t.neentid and
e.tdbinnro = t.nebinnro and
e.tdadhcta = t.neadhcta and 
e.tdemcta = t.neemcta and
e.tdctanro = t.nectanro 
where t.nebinnro is null and
                                               t.neadhcta is null and
                                               t.neemcta is null and
                                               t.nectanro is null



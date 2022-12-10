�
�D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Application\IDatabaseContext.cs
	namespace 	
VetAppointment
 
. 
Application $
{ 
public 

	interface 
IDatabaseContext %
{ 
public 
DbSet 
< 
Pet 
> 
Pets 
{  
get! $
;$ %
}& '
public		 
DbSet		 
<		 
Vet		 
>		 
Vets		 
{		  
get		! $
;		$ %
}		& '
public

 
DbSet

 
<

 
PetOwner

 
>

 
	PetOwners

 (
{

) *
get

+ .
;

. /
}

0 1
public 
DbSet 
< 
	VetClinic 
> 

VetClinics  *
{+ ,
get- 0
;0 1
}2 3
public 
DbSet 
< 
Appointment  
>  !
Appointments" .
{/ 0
get1 4
;4 5
}6 7
public
DbSet
<
Drug
>
Drugs
{
get
;
}
public 
DbSet 
< 
MedicalHistory #
># $
MedicalHistories% 5
{6 7
get8 ;
;; <
}= >
public 
DbSet 
< 
	Treatment 
> 

Treatments  *
{+ ,
get- 0
;0 1
}2 3
public 
DbSet 
< 
PrescribedDrug #
># $
PrescribedDrugs% 4
{5 6
get7 :
;: ;
}< =
void 
Save
( 
) 
; 
} 
} �

�D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Application\IRepository.cs
	namespace 	
VetAppointment
 
. 
Application $
{ 
public 

	interface 
IRepository  
<  !
T! "
>" #
{ 
T 	
Add
 
(
T 
entity 
) 
; 
T		 	
Update		
 
(		 
T		 
entity		 
)		 
;		 
T

 	
Get


 
(


Guid

 
id

 
)

 
;

 
IEnumerable 
< 
T 
> 
All 
( 
) 
; 
void 
Delete
( 
T 
entity 
) 
; 
IEnumerable
<
T
>
Find
(

Expression
<
Func
<
T
,
bool
>
>
	predicate
)
;
void 
SaveChanges
( 
) 
; 
} 
} 
Ç
VD:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Data\DatabaseContext.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Data( ,
{ 
public 

class 
DatabaseContext  
:! "
	DbContext# ,
,, -
IDatabaseContext. >
{ 
public		 
DatabaseContext		 
(		 
DbContextOptions		 /
options		0 7
)		7 8
:		9 :
base		; ?
(		? @
options		@ G
)		G H
{

 	
this 
. 
Database 
. 
EnsureCreated '
(' (
)( )
;) *
} 	
public 
DbSet 
< 
Pet 
> 
Pets 
=> !
Set" %
<% &
Pet& )
>) *
(* +
)+ ,
;, -
public 
DbSet 
< 
Vet 
> 
Vets 
=> !
Set" %
<% &
Vet& )
>) *
(* +
)+ ,
;, -
public 
DbSet 
< 
PetOwner 
> 
	PetOwners (
=>) +
Set, /
</ 0
PetOwner0 8
>8 9
(9 :
): ;
;; <
public 
DbSet 
< 
	VetClinic 
> 

VetClinics  *
=>+ -
Set. 1
<1 2
	VetClinic2 ;
>; <
(< =
)= >
;> ?
public 
DbSet 
< 
Appointment  
>  !
Appointments" .
=>/ 1
Set2 5
<5 6
Appointment6 A
>A B
(B C
)C D
;D E
public 
DbSet 
< 
Drug 
> 
Drugs  
=>! #
Set$ '
<' (
Drug( ,
>, -
(- .
). /
;/ 0
public 
DbSet 
< 
MedicalHistory #
># $
MedicalHistories% 5
=>6 8
Set9 <
<< =
MedicalHistory= K
>K L
(L M
)M N
;N O
public 
DbSet 
< 
	Treatment 
> 

Treatments  *
=>+ -
Set. 1
<1 2
	Treatment2 ;
>; <
(< =
)= >
;> ?
public 
DbSet 
< 
PrescribedDrug #
># $
PrescribedDrugs% 4
=>5 7
Set8 ;
<; <
PrescribedDrug< J
>J K
(K L
)L M
;M N
	protected 
override 
void 
OnConfiguring  -
(- .#
DbContextOptionsBuilder. E
optionsBuilderF T
)T U
{ 	
} 	
public%% 
void%% 
Save%% 
(%% 
)%% 
=>%% 
SaveChanges%% )
(%%) *
)%%* +
;%%+ ,
}&& 
}'' ˆ
xD:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\AppointmentRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class !
AppointmentRepository &
:' (

Repository) 3
<3 4
Appointment4 ?
>? @
{ 
public !
AppointmentRepository $
($ %
DatabaseContext% 4
context5 <
)< =
:> ?
base@ D
(D E
contextE L
)L M
{N O
}P Q
}		 
}

 ì
qD:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\DrugRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class 
DrugRepository 
:  !

Repository" ,
<, -
Drug- 1
>1 2
{ 
public 
DrugRepository 
( 
DatabaseContext -
context. 5
)5 6
:7 8
base9 =
(= >
context> E
)E F
{G H
}I J
}		 
}

 ±
{D:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\MedicalHistoryRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class $
MedicalHistoryRepository )
:* +

Repository, 6
<6 7
MedicalHistory7 E
>E F
{ 
private		 
readonly		 
DatabaseContext		 (
_databaseContext		) 9
;		9 :
public

 $
MedicalHistoryRepository

 '
(

' (
DatabaseContext

( 7
context

8 ?
)

? @
:

A B
base

C G
(

G H
context

H O
)

O P
{ 	
_databaseContext 
= 
context &
;& '
} 	
public 
override 
MedicalHistory &
Get' *
(* +
Guid+ /
id0 2
)2 3
=>4 6
_databaseContext7 G
.G H
SetH K
<K L
MedicalHistoryL Z
>Z [
([ \
)\ ]
. 
Include 
( 
x 
=> 
x 
. 
Appointments (
)( )
. 
SingleOrDefault 
( 
x 
=> !
x" #
.# $
Id$ &
==' )
id* ,
), -
;- .
public 
override 
IEnumerable #
<# $
MedicalHistory$ 2
>2 3
All4 7
(7 8
)8 9
=>: <
_databaseContext= M
.M N
SetN Q
<Q R
MedicalHistoryR `
>` a
(a b
)b c
. 
Include 
( 
x 
=> 
x 
. 
Appointments (
)( )
. 
ToList 
( 
) 
; 
} 
} ñ
uD:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\PetOwnerRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class 
PetOwnerRepository #
:$ %

Repository& 0
<0 1
PetOwner1 9
>9 :
{ 
private		 
readonly		 
DatabaseContext		 (
_databaseContext		) 9
;		9 :
public

 
PetOwnerRepository

 !
(

! "
DatabaseContext

" 1
context

2 9
)

9 :
:

; <
base

= A
(

A B
context

B I
)

I J
{ 	
_databaseContext 
= 
context &
;& '
} 	
public 
override 
PetOwner  
Get! $
($ %
Guid% )
id* ,
), -
=>. 0
_databaseContext1 A
.A B
SetB E
<E F
PetOwnerF N
>N O
(O P
)P Q
. 
Include 
( 
x 
=> 
x 
. 
Pets  
)  !
. 
SingleOrDefault 
( 
x 
=> !
x" #
.# $
Id$ &
==' )
id* ,
), -
;- .
public 
override 
IEnumerable #
<# $
PetOwner$ ,
>, -
All. 1
(1 2
)2 3
=>4 6
_databaseContext7 G
.G H
SetH K
<K L
PetOwnerL T
>T U
(U V
)V W
. 
Include 
( 
x 
=> 
x 
. 
Pets  
)  !
. 
ToList 
( 
) 
; 
} 
} è
pD:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\PetRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class 
PetRepository 
:  

Repository! +
<+ ,
Pet, /
>/ 0
{ 
public 
PetRepository 
( 
DatabaseContext ,
context- 4
)4 5
:6 7
base8 <
(< =
context= D
)D E
{F G
}H I
}		 
}

 ”
{D:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\PrescribedDrugRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class $
PrescribedDrugRepository )
:* +

Repository, 6
<6 7
PrescribedDrug7 E
>E F
{ 
public $
PrescribedDrugRepository '
(' (
DatabaseContext( 7
context8 ?
)? @
:A B
baseC G
(G H
contextH O
)O P
{		 	
}

 	
} 
} €
vD:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\TreatmentRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class 
TreatmentRepository $
:% &

Repository' 1
<1 2
	Treatment2 ;
>; <
{ 
public 
TreatmentRepository "
(" #
DatabaseContext# 2
context3 :
): ;
:< =
base> B
(B C
contextC J
)J K
{		 	
}

 	
} 
} ›
vD:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\VetClinicRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class 
VetClinicRepository $
:% &

Repository' 1
<1 2
	VetClinic2 ;
>; <
{ 
private		 
readonly		 
DatabaseContext		 (
_databaseContext		) 9
;		9 :
public

 
VetClinicRepository

 "
(

" #
DatabaseContext

# 2
context

3 :
)

: ;
:

< =
base

> B
(

B C
context

C J
)

J K
{ 	
_databaseContext 
= 
context &
;& '
} 	
public 
override 
	VetClinic !
Get" %
(% &
Guid& *
id+ -
)- .
=>/ 1
_databaseContext2 B
.B C
SetC F
<F G
	VetClinicG P
>P Q
(Q R
)R S
. 
Include 
( 
x 
=> 
x 
. 
Pets  
)  !
. 
Include 
( 
x 
=> 
x 
. 
Vets  
)  !
. 
SingleOrDefault 
( 
x 
=> !
x" #
.# $
Id$ &
==' )
id* ,
), -
;- .
public 
override 
IEnumerable #
<# $
	VetClinic$ -
>- .
All/ 2
(2 3
)3 4
=>5 7
_databaseContext8 H
.H I
SetI L
<L M
	VetClinicM V
>V W
(W X
)X Y
. 
Include 
( 
x 
=> 
x 
. 
Pets  
)  !
. 
Include 
( 
x 
=> 
x 
. 
Vets  
)  !
. 
ToList 
( 
) 
; 
} 
} è
pD:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\VetRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class 
VetRepository 
:  

Repository! +
<+ ,
Vet, /
>/ 0
{ 
public 
VetRepository 
( 
DatabaseContext ,
context- 4
)4 5
:6 7
base8 <
(< =
context= D
)D E
{F G
}H I
}		 
} ¶
YD:\.NET\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\Repository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
{ 
public 

class 

Repository 
< 
T 
> 
:  
IRepository! ,
<, -
T- .
>. /
where0 5
T6 7
:8 9
class: ?
{		 
private

 
readonly

 
DatabaseContext

 (
context

) 0
;

0 1
public 

Repository 
( 
DatabaseContext )
context* 1
)1 2
=>3 5
this6 :
.: ;
context; B
=C D
contextE L
;L M
public 
virtual 
T 
Add 
( 
T 
entity %
)% &
=>' )
context* 1
.1 2
Add2 5
(5 6
entity6 <
)< =
.= >
Entity> D
;D E
public 
virtual 
T 
Update 
(  
T  !
entity" (
)( )
=>* ,
context- 4
.4 5
Update5 ;
(; <
entity< B
)B C
.C D
EntityD J
;J K
public 
virtual 
T 
Get 
( 
Guid !
id" $
)$ %
=>& (
context) 0
.0 1
Set1 4
<4 5
T5 6
>6 7
(7 8
)8 9
.9 :
Find: >
(> ?
id? A
)A B
;B C
public 
virtual 
void 
Delete "
(" #
T# $
entity% +
)+ ,
=>- /
context0 7
.7 8
Set8 ;
<; <
T< =
>= >
(> ?
)? @
.@ A
RemoveA G
(G H
entityH N
)N O
;O P
public 
virtual 
IEnumerable "
<" #
T# $
>$ %
All& )
() *
)* +
=>, .
context/ 6
.6 7
Set7 :
<: ;
T; <
>< =
(= >
)> ?
.? @
ToList@ F
(F G
)G H
;H I
public 
virtual 
IEnumerable "
<" #
T# $
>$ %
Find& *
(* +

Expression+ 5
<5 6
Func6 :
<: ;
T; <
,< =
bool> B
>B C
>C D
	predicateE N
)N O
=>P R
contextS Z
.Z [
Set[ ^
<^ _
T_ `
>` a
(a b
)b c
.c d
Whered i
(i j
	predicatej s
)s t
.t u
ToListu {
({ |
)| }
;} ~
public 
void 
SaveChanges 
(  
)  !
=>" $
context% ,
., -
Save- 1
(1 2
)2 3
;3 4
} 
} 
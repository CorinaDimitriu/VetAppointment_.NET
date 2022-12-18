�
[C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Data\DatabaseContext.cs
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
 	
Database 
. 

(" #
)# $
;$ %
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
;M N
public 
void 
Save 
( 
) 
=> 
SaveChanges )
() *
)* +
;+ ,
} 
} �
WC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Data\IUnitOfWork.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Data( ,
{ 
public 

	interface 
IUnitOfWork  
{ 
IRepository 
< 
Appointment 
>  !
AppointmentRepository! 6
{7 8
get9 <
;< =
}> ?
IRepository		 
<		 
Drug		 
>		 
DrugRepository		 (
{		) *
get		+ .
;		. /
}		0 1
IRepository

 
<

 
MedicalHistory

 "
>

" #$
MedicalHistoryRepository

$ <
{

= >
get

? B
;

B C
}

D E
IRepository 
< 
PetOwner 
> 
PetOwnerRepository 0
{1 2
get3 6
;6 7
}8 9
IRepository 
< 
Pet 
> 

{' (
get) ,
;, -
}. /
IRepository
<
PrescribedDrug
>
PrescribedDrugRepository
{
get
;
}
IRepository 
< 
	Treatment 
> 
TreatmentRepository 2
{3 4
get5 8
;8 9
}: ;
IRepository 
< 
	VetClinic 
> 
VetClinicRepository 2
{3 4
get5 8
;8 9
}: ;
IRepository 
< 
Vet 
> 

{' (
get) ,
;, -
}. /
Task 
SaveChanges
( 
) 
; 
} 
} �1
VC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Data\UnitOfWork.cs
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
class 

UnitOfWork 
: 
IUnitOfWork )
{ 
private		 
readonly		 
DatabaseContext		 (
context		) 0
;		0 1
public 

UnitOfWork 
( 
DatabaseContext )
context* 1
)1 2
=>3 5
this6 :
.: ;
context; B
=C D
contextE L
;L M
private
IRepository
<
Appointment
>
?
appointmentRepository
;
public 
IRepository 
< 
Appointment &
>& '!
AppointmentRepository( =
{ 	
get 
{ 
appointmentRepository %
??=& )
new* -!
AppointmentRepository. C
(C D
contextD K
)K L
;L M
return !
appointmentRepository ,
;, -
} 
} 	
private 
IRepository 
< 
Drug  
>  !
?! "
drugRepository# 1
;1 2
public 
IRepository 
< 
Drug 
>  
DrugRepository! /
{ 	
get 
{ 
drugRepository 
??= "
new# &
DrugRepository' 5
(5 6
context6 =
)= >
;> ?
return 
drugRepository %
;% &
} 
}   	
private"" 
IRepository"" 
<"" 
MedicalHistory"" *
>""* +
?""+ ,$
medicalHistoryRepository""- E
;""E F
public## 
IRepository## 
<## 
MedicalHistory## )
>##) *$
MedicalHistoryRepository##+ C
{$$ 	
get%% 
{&& 
medicalHistoryRepository'' (
??='') ,
new''- 0$
MedicalHistoryRepository''1 I
(''I J
context''J Q
)''Q R
;''R S
return(( $
medicalHistoryRepository(( /
;((/ 0
})) 
}** 	
private,, 
IRepository,, 
<,, 
PetOwner,, $
>,,$ %
?,,% &
petOwnerRepository,,' 9
;,,9 :
public-- 
IRepository-- 
<-- 
PetOwner-- #
>--# $
PetOwnerRepository--% 7
{.. 	
get// 
{00 
petOwnerRepository11 "
??=11# &
new11' *
PetOwnerRepository11+ =
(11= >
context11> E
)11E F
;11F G
return22 
petOwnerRepository22 )
;22) *
}33 
}44 	
private66 
IRepository66 
<66 
Pet66 
>66  
?66  !

;66/ 0
public77 
IRepository77 
<77 
Pet77 
>77 

{88 	
get99 
{:: 

??=;; !
new;;" %

(;;3 4
context;;4 ;
);;; <
;;;< =
return<< 

;<<$ %
}== 
}>> 	
private@@ 
IRepository@@ 
<@@ 
PrescribedDrug@@ *
>@@* +
?@@+ ,$
prescribedDrugRepository@@- E
;@@E F
publicAA 
IRepositoryAA 
<AA 
PrescribedDrugAA )
>AA) *$
PrescribedDrugRepositoryAA+ C
{BB 	
getCC 
{DD 
prescribedDrugRepositoryEE (
??=EE) ,
newEE- 0$
PrescribedDrugRepositoryEE1 I
(EEI J
contextEEJ Q
)EEQ R
;EER S
returnFF $
prescribedDrugRepositoryFF /
;FF/ 0
}GG 
}HH 	
privateJJ 
IRepositoryJJ 
<JJ 
	TreatmentJJ %
>JJ% &
?JJ& '
treatmentRepositoryJJ( ;
;JJ; <
publicKK 
IRepositoryKK 
<KK 
	TreatmentKK $
>KK$ %
TreatmentRepositoryKK& 9
{LL 	
getMM 
{NN 
treatmentRepositoryOO #
??=OO$ '
newOO( +
TreatmentRepositoryOO, ?
(OO? @
contextOO@ G
)OOG H
;OOH I
returnPP 
treatmentRepositoryPP *
;PP* +
}QQ 
}RR 	
privateTT 
IRepositoryTT 
<TT 
	VetClinicTT %
>TT% &
?TT& '
vetClinicRepositoryTT( ;
;TT; <
publicUU 
IRepositoryUU 
<UU 
	VetClinicUU $
>UU$ %
VetClinicRepositoryUU& 9
{VV 	
getWW 
{XX 
vetClinicRepositoryYY #
??=YY$ '
newYY( +
VetClinicRepositoryYY, ?
(YY? @
contextYY@ G
)YYG H
;YYH I
returnZZ 
vetClinicRepositoryZZ *
;ZZ* +
}[[ 
}\\ 	
private^^ 
IRepository^^ 
<^^ 
Vet^^ 
>^^  
?^^  !

;^^/ 0
public__ 
IRepository__ 
<__ 
Vet__ 
>__ 

{`` 	
getaa 
{bb 

??=cc !
newcc" %

(cc3 4
contextcc4 ;
)cc; <
;cc< =
returndd 

;dd$ %
}ee 
}ff 	
publichh 
asynchh 
Taskhh 
SaveChangeshh %
(hh% &
)hh& '
=>hh( *
awaithh+ 0
contexthh1 8
.hh8 9
SaveChangesAsynchh9 I
(hhI J
)hhJ K
;hhK L
}ii 
}jj �
}C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Repositories\GenericRepositories\AppointmentRepository.cs
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
 �
vC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Repositories\GenericRepositories\DrugRepository.cs
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
 �
�C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Repositories\GenericRepositories\MedicalHistoryRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class $
MedicalHistoryRepository )
:* +

Repository, 6
<6 7
MedicalHistory7 E
>E F
{		 
private

 
readonly

 
DatabaseContext

 (
_databaseContext

) 9
;

9 :
public $
MedicalHistoryRepository '
(' (
DatabaseContext( 7
context8 ?
)? @
:A B
baseC G
(G H
contextH O
)O P
{ 	
_databaseContext
=
context
;
} 	
public 
override 
async 
Task "
<" #
MedicalHistory# 1
>1 2
Get3 6
(6 7
Guid7 ;
id< >
)> ?
{ 	
return 
await 
_databaseContext )
.) *
Set* -
<- .
MedicalHistory. <
>< =
(= >
)> ?
. 
Include
( 
x 
=> 
x 
. 
Appointments (
)( )
. 
SingleOrDefaultAsync
(! "
x" #
=>$ &
x' (
.( )
Id) +
==, .
id/ 1
)1 2
;2 3
} 	
public 
override 
async 
Task "
<" #
IEnumerable# .
<. /
MedicalHistory/ =
>= >
>> ?
All@ C
(C D
)D E
{ 	
return 
await 
_databaseContext )
.) *
Set* -
<- .
MedicalHistory. <
>< =
(= >
)> ?
. 
Include
( 
x 
=> 
x 
. 
Appointments (
)( )
. 
ToListAsync
( 
) 
; 
} 	
} 
} �
zC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Repositories\GenericRepositories\PetOwnerRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class 
PetOwnerRepository #
:$ %

Repository& 0
<0 1
PetOwner1 9
>9 :
{		 
private

 
readonly

 
DatabaseContext

 (
_databaseContext

) 9
;

9 :
public 
PetOwnerRepository !
(! "
DatabaseContext" 1
context2 9
)9 :
:; <
base= A
(A B
contextB I
)I J
{ 	
_databaseContext
=
context
;
} 	
public 
override 
async 
Task "
<" #
PetOwner# +
>+ ,
Get- 0
(0 1
Guid1 5
id6 8
)8 9
{ 	
return 
await 
_databaseContext )
.) *
Set* -
<- .
PetOwner. 6
>6 7
(7 8
)8 9
. 
Include
( 
x 
=> 
x 
. 
Pets  
)  !
. 
SingleOrDefaultAsync
(! "
x" #
=>$ &
x' (
.( )
Id) +
==, .
id/ 1
)1 2
;2 3
} 	
public 
override 
async 
Task "
<" #
IEnumerable# .
<. /
PetOwner/ 7
>7 8
>8 9
All: =
(= >
)> ?
{ 	
return 
await 
_databaseContext )
.) *
Set* -
<- .
PetOwner. 6
>6 7
(7 8
)8 9
. 
Include
( 
x 
=> 
x 
. 
Pets  
)  !
. 
ToListAsync
( 
) 
; 
} 	
} 
} �
uC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Repositories\GenericRepositories\PetRepository.cs
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

:  

Repository! +
<+ ,
Pet, /
>/ 0
{ 
public 

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
 �
�C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Repositories\GenericRepositories\PrescribedDrugRepository.cs
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
} �
{C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Repositories\GenericRepositories\TreatmentRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class 
TreatmentRepository $
:% &

Repository' 1
<1 2
	Treatment2 ;
>; <
{		 
private

 
readonly

 
DatabaseContext

 (
_databaseContext

) 9
;

9 :
public 
TreatmentRepository "
(" #
DatabaseContext# 2
context3 :
): ;
:< =
base> B
(B C
contextC J
)J K
{ 	
_databaseContext
=
context
;
} 	
public 
override 
async 
Task "
<" #
	Treatment# ,
>, -
Get. 1
(1 2
Guid2 6
id7 9
)9 :
{ 	
return 
await 
_databaseContext )
.) *
Set* -
<- .
	Treatment. 7
>7 8
(8 9
)9 :
. 
Include
( 
x 
=> 
x 
. 
PrescribedDrugs +
)+ ,
. 
SingleOrDefaultAsync
(! "
x" #
=>$ &
x' (
.( )
Id) +
==, .
id/ 1
)1 2
;2 3
} 	
public 
override 
async 
Task "
<" #
IEnumerable# .
<. /
	Treatment/ 8
>8 9
>9 :
All; >
(> ?
)? @
{ 	
return 
await 
_databaseContext )
.) *
Set* -
<- .
	Treatment. 7
>7 8
(8 9
)9 :
. 
Include
( 
x 
=> 
x 
. 
PrescribedDrugs +
)+ ,
. 
ToListAsync
( 
) 
; 
} 	
} 
} �
{C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Repositories\GenericRepositories\VetClinicRepository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
.4 5
GenericRepositories5 H
{ 
public 

class 
VetClinicRepository $
:% &

Repository' 1
<1 2
	VetClinic2 ;
>; <
{		 
private

 
readonly

 
DatabaseContext

 (
_databaseContext

) 9
;

9 :
public 
VetClinicRepository "
(" #
DatabaseContext# 2
context3 :
): ;
:< =
base> B
(B C
contextC J
)J K
{ 	
_databaseContext
=
context
;
} 	
public 
override 
async 
Task "
<" #
	VetClinic# ,
>, -
Get. 1
(1 2
Guid2 6
id7 9
)9 :
{ 	
return 
await 
_databaseContext )
.) *
Set* -
<- .
	VetClinic. 7
>7 8
(8 9
)9 :
. 
Include
( 
x 
=> 
x 
. 
Pets  
)  !
. 
Include
( 
x 
=> 
x 
. 
Vets  
)  !
. 
SingleOrDefaultAsync
(! "
x" #
=>$ &
x' (
.( )
Id) +
==, .
id/ 1
)1 2
;2 3
} 	
public 
override 
async 
Task "
<" #
IEnumerable# .
<. /
	VetClinic/ 8
>8 9
>9 :
All; >
(> ?
)? @
{ 	
return 
await 
_databaseContext )
.) *
Set* -
<- .
	VetClinic. 7
>7 8
(8 9
)9 :
. 
Include
( 
x 
=> 
x 
. 
Pets  
)  !
. 
Include
( 
x 
=> 
x 
. 
Vets  
)  !
. 
ToListAsync
( 
) 
; 
}   	
}!! 
}"" �
uC:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Repositories\GenericRepositories\VetRepository.cs
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

:  

Repository! +
<+ ,
Vet, /
>/ 0
{ 
public 

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
} �%
^C:\Users\Leonard\Desktop\Clean VetApp\VetAppointment.Infrastructure\Repositories\Repository.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Repositories( 4
{ 
public		 

class		 

Repository		 
<		 
T		 
>		 
:		  
IRepository		! ,
<		, -
T		- .
>		. /
where		0 5
T		6 7
:		8 9
class		: ?
{

 
private 
readonly 
DatabaseContext (
context) 0
;0 1
public

Repository
(
DatabaseContext
context
)
=>
this
.
context
=
context
;
public 
virtual 
async 
Task !
<! "
T" #
># $
Add% (
(( )
T) *
entity+ 1
)1 2
{ 	
await 
context 
. 
AddAsync "
(" #
entity# )
)) *
;* +
await 
context 
. 
SaveChangesAsync *
(* +
)+ ,
;, -
return 
entity 
; 
} 	
public 
virtual 
async 
Task !
<! "
T" #
># $
Update% +
(+ ,
T, -
entity. 4
)4 5
{ 	
context 
. 
Update 
( 
entity !
)! "
;" #
await 
context 
. 
SaveChangesAsync *
(* +
)+ ,
;, -
return 
entity 
; 
} 	
public 
virtual 
async 
Task !
<! "
T" #
># $
Get% (
(( )
Guid) -
id. 0
)0 1
=>2 4
await5 :
context; B
.B C
SetC F
<F G
TG H
>H I
(I J
)J K
.K L
	FindAsyncL U
(U V
idV X
)X Y
;Y Z
public 
virtual 
async 
Task !
Delete" (
(( )
T) *
entity+ 1
)1 2
{   	
context!! 
.!! 
Set!! 
<!! 
T!! 
>!! 
(!! 
)!! 
.!! 
Remove!! #
(!!# $
entity!!$ *
)!!* +
;!!+ ,
await"" 
context"" 
."" 
SaveChangesAsync"" *
(""* +
)""+ ,
;"", -
}## 	
public$$ 
virtual$$ 
async$$ 
Task$$ !
<$$! "
IEnumerable$$" -
<$$- .
T$$. /
>$$/ 0
>$$0 1
All$$2 5
($$5 6
)$$6 7
=>$$8 :
await$$; @
context$$A H
.$$H I
Set$$I L
<$$L M
T$$M N
>$$N O
($$O P
)$$P Q
.$$Q R
ToListAsync$$R ]
($$] ^
)$$^ _
;$$_ `
public&& 
virtual&& 
async&& 
Task&& !
<&&! "
T&&" #
>&&# $
Find&&% )
(&&) *

Expression&&* 4
<&&4 5
Func&&5 9
<&&9 :
T&&: ;
,&&; <
bool&&= A
>&&A B
>&&B C
	predicate&&D M
)&&M N
{'' 	
var(( 
entity(( 
=(( 
context((  
.((  !
Set((! $
<(($ %
T((% &
>((& '
(((' (
)((( )
.(() *
Where((* /
(((/ 0
	predicate((0 9
)((9 :
.((: ;
SingleOrDefault((; J
<((J K
T((K L
>((L M
(((M N
)((N O
;((O P
return)) 
await)) 
context))  
.))  !
Set))! $
<))$ %
T))% &
>))& '
())' (
)))( )
.))) *
	FindAsync))* 3
())3 4
entity))4 :
))): ;
;)); <
}** 	
public++ 
async++ 
Task++ 
SaveChanges++ %
(++% &
)++& '
=>++( *
await+++ 0
context++1 8
.++8 9
SaveChangesAsync++9 I
(++I J
)++J K
;++K L
},, 
}-- 
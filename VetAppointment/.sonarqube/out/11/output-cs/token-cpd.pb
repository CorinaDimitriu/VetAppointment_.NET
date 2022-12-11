Ü
îD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Data\DatabaseContext.cs
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
}'' Ì
êD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Data\IUnitOfWork.cs
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
PetRepository &
{' (
get) ,
;, -
}. /
IRepository 
< 
PrescribedDrug "
>" #$
PrescribedDrugRepository$ <
{= >
get? B
;B C
}D E
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
VetRepository &
{' (
get) ,
;, -
}. /
void 
SaveChanges 
( 
) 
; 
} 
} Ò0
èD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Data\UnitOfWork.cs
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
private 
IRepository 
< 
Appointment '
>' (!
appointmentRepository) >
;> ?
public 
IRepository 
< 
Appointment &
>& '!
AppointmentRepository( =
{ 	
get 
{ !
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
} 
} 	
private 
IRepository 
< 
Drug  
>  !
drugRepository" 0
;0 1
public 
IRepository 
< 
Drug 
>  
DrugRepository! /
{ 	
get 
{ 
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
} 
}   	
private"" 
IRepository"" 
<"" 
MedicalHistory"" *
>""* +$
medicalHistoryRepository"", D
;""D E
public## 
IRepository## 
<## 
MedicalHistory## )
>##) *$
MedicalHistoryRepository##+ C
{$$ 	
get%% 
{&& $
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
})) 
}** 	
private,, 
IRepository,, 
<,, 
PetOwner,, $
>,,$ %
petOwnerRepository,,& 8
;,,8 9
public-- 
IRepository-- 
<-- 
PetOwner-- #
>--# $
PetOwnerRepository--% 7
{.. 	
get// 
{00 
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
}33 
}44 	
private66 
IRepository66 
<66 
Pet66 
>66  
petRepository66! .
;66. /
public77 
IRepository77 
<77 
Pet77 
>77 
PetRepository77  -
{88 	
get99 
{:: 
petRepository;; 
??=;; !
new;;" %
PetRepository;;& 3
(;;3 4
context;;4 ;
);;; <
;;;< =
return<< 
petRepository<< $
;<<$ %
}== 
}>> 	
private@@ 
IRepository@@ 
<@@ 
PrescribedDrug@@ *
>@@* +$
prescribedDrugRepository@@, D
;@@D E
publicAA 
IRepositoryAA 
<AA 
PrescribedDrugAA )
>AA) *$
PrescribedDrugRepositoryAA+ C
{BB 	
getCC 
{DD $
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
}GG 
}HH 	
privateJJ 
IRepositoryJJ 
<JJ 
	TreatmentJJ %
>JJ% &
treatmentRepositoryJJ' :
;JJ: ;
publicKK 
IRepositoryKK 
<KK 
	TreatmentKK $
>KK$ %
TreatmentRepositoryKK& 9
{LL 	
getMM 
{NN 
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
}QQ 
}RR 	
privateTT 
IRepositoryTT 
<TT 
	VetClinicTT %
>TT% &
vetClinicRepositoryTT' :
;TT: ;
publicUU 
IRepositoryUU 
<UU 
	VetClinicUU $
>UU$ %
VetClinicRepositoryUU& 9
{VV 	
getWW 
{XX 
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
}[[ 
}\\ 	
private^^ 
IRepository^^ 
<^^ 
Vet^^ 
>^^  
vetRepository^^! .
;^^. /
public__ 
IRepository__ 
<__ 
Vet__ 
>__ 
VetRepository__  -
{`` 	
getaa 
{bb 
vetRepositorycc 
??=cc !
newcc" %
VetRepositorycc& 3
(cc3 4
contextcc4 ;
)cc; <
;cc< =
returndd 
vetRepositorydd $
;dd$ %
}ee 
}ff 	
publichh 
voidhh 
SaveChangeshh 
(hh  
)hh  !
=>hh" $
contexthh% ,
.hh, -
SaveChangeshh- 8
(hh8 9
)hh9 :
;hh: ;
}ii 
}jj «
∂D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\AppointmentRepository.cs
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
 ´
ØD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\DrugRepository.cs
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
 
πD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\MedicalHistoryRepository.cs
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
} ∞
≥D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\PetOwnerRepository.cs
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
} ß
ÆD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\PetRepository.cs
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
πD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\PrescribedDrugRepository.cs
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
} ø
¥D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\TreatmentRepository.cs
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
} ⁄
¥D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\VetClinicRepository.cs
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
} ß
ÆD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\GenericRepositories\VetRepository.cs
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
} ı
óD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.Infrastructure\Repositories\Repository.cs
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
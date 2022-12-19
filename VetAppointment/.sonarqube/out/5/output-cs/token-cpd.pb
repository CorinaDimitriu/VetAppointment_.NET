ﬂ$
ZC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\ConfigureServices.cs
	namespace

 	
VetAppointment


 
.

 
Infrastructure

 '
{ 
public 

static 
class 
ConfigureServices )
{ 
public 
static 
IServiceCollection ($
AddInfrastrutureServices) A
(A B
thisB F
IServiceCollectionG Y
servicesZ b
,b c
IConfigurationd r
configuration	s Ä
)
Ä Å
{ 	
services 
. 
AddDbContext !
<! "
DatabaseContext" 1
>1 2
(2 3
options 
=> 
{ 
options 
. 
	UseSqlite %
(% &
configuration %
.% &
GetConnectionString& 9
(9 :
$str: M
)M N
,N O
b 
=> 
b 
. 
MigrationsAssembly 1
(1 2
typeof2 8
(8 9
DatabaseContext9 H
)H I
.I J
AssemblyJ R
.R S
FullNameS [
)[ \
) 
; 
options 
. $
UseQueryTrackingBehavior 4
(4 5!
QueryTrackingBehavior5 J
.J K

NoTrackingK U
)U V
;V W
options 
. &
EnableSensitiveDataLogging 6
(6 7
)7 8
;8 9
} 
) 
; 
services 
. 
	AddScoped 
( 
typeof %
(% &
IRepository& 1
<1 2
>2 3
)3 4
,4 5
typeof6 <
(< =

Repository= G
<G H
>H I
)I J
)J K
;K L
services 
. 
	AddScoped 
( 
typeof %
(% &
IUnitOfWork& 1
)1 2
,2 3
typeof4 :
(: ;

UnitOfWork; E
)E F
)F G
;G H
services 
. 
	AddScoped 
< 
IRepository *
<* +
Appointment+ 6
>6 7
,7 8!
AppointmentRepository9 N
>N O
(O P
)P Q
;Q R
services 
. 
	AddScoped 
< 
IRepository *
<* +
PetOwner+ 3
>3 4
,4 5
PetOwnerRepository6 H
>H I
(I J
)J K
;K L
services   
.   
	AddScoped   
<   
IRepository   *
<  * +
Pet  + .
>  . /
,  / 0
PetRepository  1 >
>  > ?
(  ? @
)  @ A
;  A B
services!! 
.!! 
	AddScoped!! 
<!! 
IRepository!! *
<!!* +
	VetClinic!!+ 4
>!!4 5
,!!5 6
VetClinicRepository!!7 J
>!!J K
(!!K L
)!!L M
;!!M N
services"" 
."" 
	AddScoped"" 
<"" 
IRepository"" *
<""* +
Vet""+ .
>"". /
,""/ 0
VetRepository""1 >
>""> ?
(""? @
)""@ A
;""A B
services## 
.## 
	AddScoped## 
<## 
IRepository## *
<##* +
Drug##+ /
>##/ 0
,##0 1
DrugRepository##2 @
>##@ A
(##A B
)##B C
;##C D
services$$ 
.$$ 
	AddScoped$$ 
<$$ 
IRepository$$ *
<$$* +
MedicalHistory$$+ 9
>$$9 :
,$$: ;$
MedicalHistoryRepository$$< T
>$$T U
($$U V
)$$V W
;$$W X
services%% 
.%% 
	AddScoped%% 
<%% 
IRepository%% *
<%%* +
PrescribedDrug%%+ 9
>%%9 :
,%%: ;$
PrescribedDrugRepository%%< T
>%%T U
(%%U V
)%%V W
;%%W X
services&& 
.&& 
	AddScoped&& 
<&& 
IRepository&& *
<&&* +
	Treatment&&+ 4
>&&4 5
,&&5 6
TreatmentRepository&&7 J
>&&J K
(&&K L
)&&L M
;&&M N
return(( 
services(( 
;(( 
})) 	
}** 
}++ ÷
]C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Data\DatabaseContext.cs
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
EnsureCreated "
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
} ‰0
XC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Data\UnitOfWork.cs
	namespace 	
VetAppointment
 
. 
Infrastructure '
.' (
Data( ,
{ 
public 

class 

UnitOfWork 
: 
IUnitOfWork )
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

UnitOfWork 
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
;L M
private 
IRepository 
< 
Appointment '
>' (!
appointmentRepository) >
;> ?
public 
IRepository 
< 
Appointment &
>& '!
AppointmentRepository( =
{ 	
get 
{ !
appointmentRepository %
??=& )
new* -!
AppointmentRepository. C
(C D
contextD K
)K L
;L M
return !
appointmentRepository ,
;, -
} 
} 	
private 
IRepository 
< 
Drug  
>  !
drugRepository" 0
;0 1
public 
IRepository 
< 
Drug 
>  
DrugRepository! /
{ 	
get 
{ 
drugRepository 
??= "
new# &
DrugRepository' 5
(5 6
context6 =
)= >
;> ?
return 
drugRepository %
;% &
}   
}!! 	
private## 
IRepository## 
<## 
MedicalHistory## *
>##* +$
medicalHistoryRepository##, D
;##D E
public$$ 
IRepository$$ 
<$$ 
MedicalHistory$$ )
>$$) *$
MedicalHistoryRepository$$+ C
{%% 	
get&& 
{'' $
medicalHistoryRepository(( (
??=(() ,
new((- 0$
MedicalHistoryRepository((1 I
(((I J
context((J Q
)((Q R
;((R S
return)) $
medicalHistoryRepository)) /
;))/ 0
}** 
}++ 	
private-- 
IRepository-- 
<-- 
PetOwner-- $
>--$ %
petOwnerRepository--& 8
;--8 9
public.. 
IRepository.. 
<.. 
PetOwner.. #
>..# $
PetOwnerRepository..% 7
{// 	
get00 
{11 
petOwnerRepository22 "
??=22# &
new22' *
PetOwnerRepository22+ =
(22= >
context22> E
)22E F
;22F G
return33 
petOwnerRepository33 )
;33) *
}44 
}55 	
private77 
IRepository77 
<77 
Pet77 
>77  
petRepository77! .
;77. /
public88 
IRepository88 
<88 
Pet88 
>88 
PetRepository88  -
{99 	
get:: 
{;; 
petRepository<< 
??=<< !
new<<" %
PetRepository<<& 3
(<<3 4
context<<4 ;
)<<; <
;<<< =
return== 
petRepository== $
;==$ %
}>> 
}?? 	
privateAA 
IRepositoryAA 
<AA 
PrescribedDrugAA *
>AA* +$
prescribedDrugRepositoryAA, D
;AAD E
publicBB 
IRepositoryBB 
<BB 
PrescribedDrugBB )
>BB) *$
PrescribedDrugRepositoryBB+ C
{CC 	
getDD 
{EE $
prescribedDrugRepositoryFF (
??=FF) ,
newFF- 0$
PrescribedDrugRepositoryFF1 I
(FFI J
contextFFJ Q
)FFQ R
;FFR S
returnGG $
prescribedDrugRepositoryGG /
;GG/ 0
}HH 
}II 	
privateKK 
IRepositoryKK 
<KK 
	TreatmentKK %
>KK% &
treatmentRepositoryKK' :
;KK: ;
publicLL 
IRepositoryLL 
<LL 
	TreatmentLL $
>LL$ %
TreatmentRepositoryLL& 9
{MM 	
getNN 
{OO 
treatmentRepositoryPP #
??=PP$ '
newPP( +
TreatmentRepositoryPP, ?
(PP? @
contextPP@ G
)PPG H
;PPH I
returnQQ 
treatmentRepositoryQQ *
;QQ* +
}RR 
}SS 	
privateUU 
IRepositoryUU 
<UU 
	VetClinicUU %
>UU% &
vetClinicRepositoryUU' :
;UU: ;
publicVV 
IRepositoryVV 
<VV 
	VetClinicVV $
>VV$ %
VetClinicRepositoryVV& 9
{WW 	
getXX 
{YY 
vetClinicRepositoryZZ #
??=ZZ$ '
newZZ( +
VetClinicRepositoryZZ, ?
(ZZ? @
contextZZ@ G
)ZZG H
;ZZH I
return[[ 
vetClinicRepository[[ *
;[[* +
}\\ 
}]] 	
private__ 
IRepository__ 
<__ 
Vet__ 
>__  
vetRepository__! .
;__. /
public`` 
IRepository`` 
<`` 
Vet`` 
>`` 
VetRepository``  -
{aa 	
getbb 
{cc 
vetRepositorydd 
??=dd !
newdd" %
VetRepositorydd& 3
(dd3 4
contextdd4 ;
)dd; <
;dd< =
returnee 
vetRepositoryee $
;ee$ %
}ff 
}gg 	
publicii 
asyncii 
Taskii 
SaveChangesii %
(ii% &
)ii& '
=>ii( *
awaitii+ 0
contextii1 8
.ii8 9
SaveChangesAsyncii9 I
(iiI J
)iiJ K
;iiK L
}jj 
}kk è
C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Repositories\GenericRepositories\AppointmentRepository.cs
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
 Û
xC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Repositories\GenericRepositories\DrugRepository.cs
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
 ≥
ÇC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Repositories\GenericRepositories\MedicalHistoryRepository.cs
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
_databaseContext 
= 
context &
;& '
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
. 
Include 
( 
x 
=> 
x 
. 
Appointments (
)( )
.  
SingleOrDefaultAsync !
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
. 
Include 
( 
x 
=> 
x 
. 
Appointments (
)( )
. 
ToListAsync 
( 
) 
; 
} 	
} 
} Ú
|C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Repositories\GenericRepositories\PetOwnerRepository.cs
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
_databaseContext 
= 
context &
;& '
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
. 
Include 
( 
x 
=> 
x 
. 
Pets  
)  !
.  
SingleOrDefaultAsync !
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
. 
Include 
( 
x 
=> 
x 
. 
Pets  
)  !
. 
ToListAsync 
( 
) 
; 
} 	
} 
} Ô
wC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Repositories\GenericRepositories\PetRepository.cs
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
 ú
ÇC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Repositories\GenericRepositories\PrescribedDrugRepository.cs
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
} ê
}C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Repositories\GenericRepositories\TreatmentRepository.cs
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
_databaseContext 
= 
context &
;& '
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
. 
Include 
( 
x 
=> 
x 
. 
PrescribedDrugs +
)+ ,
.  
SingleOrDefaultAsync !
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
. 
Include 
( 
x 
=> 
x 
. 
PrescribedDrugs +
)+ ,
. 
ToListAsync 
( 
) 
; 
} 	
} 
} ú
}C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Repositories\GenericRepositories\VetClinicRepository.cs
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
_databaseContext 
= 
context &
;& '
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
. 
Include 
( 
x 
=> 
x 
. 
Pets  
)  !
. 
Include 
( 
x 
=> 
x 
. 
Vets  
)  !
.  
SingleOrDefaultAsync !
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
. 
Include 
( 
x 
=> 
x 
. 
Pets  
)  !
. 
Include 
( 
x 
=> 
x 
. 
Vets  
)  !
. 
ToListAsync 
( 
) 
; 
}   	
}!! 
}"" Ô
wC:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Repositories\GenericRepositories\VetRepository.cs
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
} ¿%
`C:\Users\Leonard\Desktop\VetAppointment\VetAppointment.Infrastructure\Repositories\Repository.cs
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
public 

Repository 
( 
DatabaseContext )
context* 1
)1 2
=>3 5
this6 :
.: ;
context; B
=C D
contextE L
;L M
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
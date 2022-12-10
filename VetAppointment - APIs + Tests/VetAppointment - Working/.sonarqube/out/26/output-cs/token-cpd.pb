¢d
óD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\AppointmentsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class "
AppointmentsController '
:( )
ControllerBase* 8
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public "
AppointmentsController %
(% &
IUnitOfWork& 1

unitOfWork2 <
)< =
=>> @
thisA E
.E F

unitOfWorkF P
=Q R

unitOfWorkS ]
;] ^
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- . 
CreateAppointmentDto/ C
appointmentDtoD R
)R S
{ 	
var 
pet 
= 

unitOfWork  
.  !
PetRepository! .
.. /
Get/ 2
(2 3
appointmentDto3 A
.A B
PetIdB G
)G H
;H I
if 
( 
pet 
== 
null 
) 
{ 
return 
NotFound 
(  
)  !
;! "
} 
var 
vet 
= 

unitOfWork  
.  !
VetRepository! .
.. /
Get/ 2
(2 3
appointmentDto3 A
.A B
VetIdB G
)G H
;H I
if 
( 
vet 
== 
null 
) 
{ 
return 
NotFound 
(  
)  !
;! "
} 
var   
appointment   
=   
Appointment   )
.  ) *
SettleAppointment  * ;
(  ; <
vet!! 
,!! 
pet"" 
,"" 
appointmentDto## "
.##" #
ScheduledDate### 0
,##0 1
appointmentDto$$ "
.$$" #&
EstimatedDurationInMinutes$$# =
)%% 
;%% 
var'' 

treatement'' 
='' 

unitOfWork'' '
.''' (
TreatmentRepository''( ;
.''; <
Get''< ?
(''? @
appointmentDto''@ N
.''N O
TreatmentId''O Z
)''Z [
;''[ \
if(( 
((( 

treatement(( 
==(( 
null(( "
)((# $
{)) 
return** 
NotFound** 
(**  
)**  !
;**! "
}++ 
var-- 
history-- 
=-- 

unitOfWork-- $
.--$ %$
MedicalHistoryRepository--% =
.--= >
Get--> A
(--A B
appointmentDto--B P
.--P Q
MedicalHistoryId--Q a
)--a b
;--b c
if.. 
(.. 
history.. 
==.. 
null.. 
)..  
{// 
return00 
NotFound00 
(00  
)00  !
;00! "
}11 
history33 
.33 (
RegisterAppointmentToHistory33 0
(330 1
appointment331 <
.33< =
Entity33= C
)33C D
;33D E

unitOfWork44 
.44 $
MedicalHistoryRepository44 /
.44/ 0
Update440 6
(446 7
history447 >
)44> ?
;44? @

unitOfWork55 
.55 
SaveChanges55 "
(55" #
)55# $
;55$ %
appointment77 
.77 
Entity77 
.77 (
AttachTreatmentToAppointment77 ;
(77; <

treatement77< F
)77F G
;77G H
appointment88 
.88 
Entity88 
.88 -
!AttachAppointmentToMedicalHistory88 @
(88@ A
history88A H
)88H I
;88I J
if;; 
(;; 
appointment;; 
.;; 
	IsFailure;; %
);;% &
{<< 
return== 

BadRequest== !
(==! "
appointment==" -
.==- .
Error==. 3
)==3 4
;==4 5
}>> 

unitOfWork@@ 
.@@ !
AppointmentRepository@@ ,
.@@, -
Add@@- 0
(@@0 1
appointment@@1 <
.@@< =
Entity@@= C
)@@C D
;@@D E

unitOfWorkAA 
.AA 
SaveChangesAA "
(AA" #
)AA# $
;AA$ %
varBB 
fullAppointmentBB 
=BB  !
newBB" %
AppointmentDtoBB& 4
{CC 
IdDD 
=DD 
appointmentDD  
.DD  !
EntityDD! '
.DD' (
IdDD( *
,DD* +
VetIdEE 
=EE 
appointmentEE #
.EE# $
EntityEE$ *
.EE* +
VetIdEE+ 0
,EE0 1
PetIdFF 
=FF 
appointmentFF #
.FF# $
EntityFF$ *
.FF* +
PetIdFF+ 0
,FF0 1
ScheduledDateGG 
=GG 
appointmentGG  +
.GG+ ,
EntityGG, 2
.GG2 3
ScheduledDateGG3 @
.GG@ A
ToStringGGA I
(GGI J
)GGJ K
,GGK L&
EstimatedDurationInMinutesHH *
=HH+ ,
appointmentHH- 8
.HH8 9
EntityHH9 ?
.HH? @&
EstimatedDurationInMinutesHH@ Z
}II 
;II 
returnKK 
CreatedKK 
(KK 
nameofKK !
(KK! "
GetAllAppointmentsKK" 4
)KK4 5
,KK5 6
appointmentKK7 B
)KKB C
;KKC D
}LL 	
[NN 	
HttpGetNN	 
]NN 
publicOO 
IActionResultOO 
GetAllAppointmentsOO /
(OO/ 0
)OO0 1
{PP 	
varQQ 
appointmentsQQ 
=QQ 

unitOfWorkQQ )
.QQ) *!
AppointmentRepositoryQQ* ?
.QQ? @
AllQQ@ C
(QQC D
)QQD E
.QQE F
SelectQQF L
(QQL M
appointmentQQM X
=>QQY [
newQQ\ _
AppointmentDtoQQ` n
(QQn o
)QQo p
{RR 
IdSS 
=SS 
appointmentSS  
.SS  !
IdSS! #
,SS# $
VetIdTT 
=TT 
appointmentTT #
.TT# $
VetIdTT$ )
,TT) *
PetIdUU 
=UU 
appointmentUU #
.UU# $
PetIdUU$ )
,UU) *
ScheduledDateVV 
=VV 
appointmentVV  +
.VV+ ,
ScheduledDateVV, 9
.VV9 :
ToStringVV: B
(VVB C
)VVC D
,VVD E&
EstimatedDurationInMinutesWW *
=WW+ ,
appointmentWW- 8
.WW8 9&
EstimatedDurationInMinutesWW9 S
,WWS T
TreatmentIdXX 
=XX 
appointmentXX )
.XX) *
TreatmentIdXX* 5
,XX5 6
MedicalHistoryIdYY  
=YY! "
appointmentYY# .
.YY. /
MedicalHistoryIdYY/ ?
}ZZ 
)ZZ 
;ZZ 
return\\ 
Ok\\ 
(\\ 
appointments\\ "
)\\" #
;\\# $
}]] 	
[__ 	
HttpGet__	 
(__ 
$str__ 
)__ 
]__ 
public`` 
IActionResult`` 
GetAppointmentById`` /
(``/ 0
Guid``0 4
id``5 7
)``7 8
{aa 	
varbb 
appointmentbb 
=bb 

unitOfWorkbb (
.bb( )!
AppointmentRepositorybb) >
.bb> ?
Getbb? B
(bbB C
idbbC E
)bbE F
;bbF G
ifcc 
(cc 
appointmentcc 
==cc 
nullcc #
)cc# $
{dd 
returnee 
NotFoundee 
(ee  
)ee  !
;ee! "
}ff 
varhh 
appointmentDtohh 
=hh  
newhh! $
AppointmentDtohh% 3
{ii 
Idjj 
=jj 
appointmentjj  
.jj  !
Idjj! #
,jj# $
VetIdkk 
=kk 
appointmentkk #
.kk# $
VetIdkk$ )
,kk) *
PetIdll 
=ll 
appointmentll #
.ll# $
PetIdll$ )
,ll) *
ScheduledDatemm 
=mm 
appointmentmm  +
.mm+ ,
ScheduledDatemm, 9
.mm9 :
ToStringmm: B
(mmB C
)mmC D
,mmD E&
EstimatedDurationInMinutesnn *
=nn+ ,
appointmentnn- 8
.nn8 9&
EstimatedDurationInMinutesnn9 S
,nnS T
TreatmentIdoo 
=oo 
appointmentoo )
.oo) *
TreatmentIdoo* 5
,oo5 6
MedicalHistoryIdpp  
=pp! "
appointmentpp# .
.pp. /
MedicalHistoryIdpp/ ?
}qq 
;qq 
returnss 
Okss 
(ss 
appointmentDtoss $
)ss$ %
;ss% &
}tt 	
[vv 	

HttpDeletevv	 
(vv 
$strvv 
)vv 
]vv 
publicww 
IActionResultww 
DeleteAppointmentww .
(ww. /
Guidww/ 3
idww4 6
)ww6 7
{xx 	
varyy 
appointmentyy 
=yy 

unitOfWorkyy (
.yy( )!
AppointmentRepositoryyy) >
.yy> ?
Getyy? B
(yyB C
idyyC E
)yyE F
;yyF G
ifzz 
(zz 
appointmentzz 
==zz 
nullzz #
)zz# $
{{{ 
return|| 
NotFound|| 
(||  
)||  !
;||! "
}}} 

unitOfWork 
. !
AppointmentRepository ,
., -
Delete- 3
(3 4
appointment4 ?
)? @
;@ A

unitOfWork
ÄÄ 
.
ÄÄ 
SaveChanges
ÄÄ "
(
ÄÄ" #
)
ÄÄ# $
;
ÄÄ$ %
return
ÇÇ 
	NoContent
ÇÇ 
(
ÇÇ 
)
ÇÇ 
;
ÇÇ 
}
ÉÉ 	
[
ÖÖ 	
HttpPut
ÖÖ	 
(
ÖÖ 
$str
ÖÖ 
)
ÖÖ 
]
ÖÖ 
public
ÜÜ 
IActionResult
ÜÜ 
UpdateAppointment
ÜÜ .
(
ÜÜ. /
Guid
ÜÜ/ 3
id
ÜÜ4 6
,
ÜÜ6 7
[
ÜÜ8 9
FromBody
ÜÜ9 A
]
ÜÜA B
AppointmentDto
ÜÜC Q
appointmentDto
ÜÜR `
)
ÜÜ` a
{
áá 	
var
àà 
appointment
àà 
=
àà 

unitOfWork
àà (
.
àà( )#
AppointmentRepository
àà) >
.
àà> ?
Get
àà? B
(
ààB C
id
ààC E
)
ààE F
;
ààF G
if
ââ 
(
ââ 
appointment
ââ 
==
ââ 
null
ââ #
)
ââ# $
{
ää 
return
ãã 
NotFound
ãã 
(
ãã  
)
ãã  !
;
ãã! "
}
åå 
appointment
éé 
.
éé 
Update
éé 
(
éé 
appointment
éé *
.
éé* +
VetId
éé+ 0
,
éé0 1
appointmentDto
éé2 @
.
éé@ A
PetId
ééA F
,
ééF G
appointmentDto
ééH V
.
ééV W
ScheduledDate
ééW d
,
ééd e
appointmentDto
èè 
.
èè (
EstimatedDurationInMinutes
èè 9
,
èè9 :
appointmentDto
èè; I
.
èèI J
TreatmentId
èèJ U
,
èèU V
appointmentDto
èèW e
.
èèe f
MedicalHistoryId
èèf v
)
èèv w
;
èèw x

unitOfWork
ëë 
.
ëë #
AppointmentRepository
ëë ,
.
ëë, -
Update
ëë- 3
(
ëë3 4
appointment
ëë4 ?
)
ëë? @
;
ëë@ A

unitOfWork
íí 
.
íí 
SaveChanges
íí "
(
íí" #
)
íí# $
;
íí$ %
return
îî 
	NoContent
îî 
(
îî 
)
îî 
;
îî 
}
ïï 	
}
ññ 
}óó €7
êD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\DrugsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class 
DrugsController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IRepository $
<$ %
Drug% )
>) *
drugRepository+ 9
;9 :
public 
DrugsController 
( 
IRepository *
<* +
Drug+ /
>/ 0
drugRepository1 ?
)? @
=>A C
thisD H
.H I
drugRepositoryI W
=X Y
drugRepositoryZ h
;h i
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
drugs 
= 
drugRepository &
.& '
All' *
(* +
)+ ,
., -
Select- 3
( 
d 
=> 
new 
DrugDto $
{ 
Id 
= 
d 
. 
Id !
,! "
Name 
= 
d  
.  !
Name! %
,% &
Quantity  
=! "
d# $
.$ %
Quantity% -
,- .
	UnitPrice !
=" #
d$ %
.% &
	UnitPrice& /
} 
) 
; 
return 
Ok 
( 
drugs 
) 
; 
}   	
["" 	
HttpGet""	 
("" 
$str""  
)""  !
]""! "
public## 
IActionResult## 
Get##  
(##  !
Guid##! %
drugId##& ,
)##, -
{$$ 	
{%% 
var&& 
drug&& 
=&& 
drugRepository&& )
.&&) *
Get&&* -
(&&- .
drugId&&. 4
)&&4 5
;&&5 6
if(( 
((( 
drug(( 
==(( 
null((  
)((  !
{)) 
return** 
NotFound** #
(**# $
)**$ %
;**% &
}++ 
var-- 
drugDto-- 
=-- 
new-- !
DrugDto--" )
{.. 
Id// 
=// 
drug// 
.// 
Id//  
,//  !
Name00 
=00 
drug00 
.00  
Name00  $
,00$ %
Quantity11 
=11 
drug11 #
.11# $
Quantity11$ ,
,11, -
	UnitPrice22 
=22 
drug22  $
.22$ %
	UnitPrice22% .
}33 
;33 
return55 
Ok55 
(55 
drugDto55 !
)55! "
;55" #
}66 
}77 	
[99 	
HttpPost99	 
]99 
public:: 
IActionResult:: 
Create:: #
(::# $
[::$ %
FromBody::% -
]::- .
CreateDrugDto::/ <
drugDto::= D
)::D E
{;; 	
var<< 
drug<< 
=<< 
Drug<< 
.<< 
Create<< "
(<<" #
drugDto== 
.== 
Name==  
,==  !
drugDto>> 
.>> 
Quantity>> $
,>>$ %
drugDto?? 
.?? 
	UnitPrice?? %
)@@ 
;@@ 
ifBB 
(BB 
drugBB 
.BB 
	IsFailureBB 
)BB 
{CC 
returnDD 

BadRequestDD !
(DD! "
drugDD" &
.DD& '
ErrorDD' ,
)DD, -
;DD- .
}EE 
drugRepositoryGG 
.GG 
AddGG 
(GG 
drugGG #
.GG# $
EntityGG$ *
)GG* +
;GG+ ,
drugRepositoryHH 
.HH 
SaveChangesHH &
(HH& '
)HH' (
;HH( )
returnJJ 
CreatedJJ 
(JJ 
nameofJJ !
(JJ! "
GetJJ" %
)JJ% &
,JJ& '
drugJJ( ,
.JJ, -
EntityJJ- 3
)JJ3 4
;JJ4 5
}KK 	
[MM 	

HttpDeleteMM	 
(MM 
$strMM #
)MM# $
]MM$ %
publicNN 
IActionResultNN 
DeleteNN #
(NN# $
GuidNN$ (
drugIdNN) /
)NN/ 0
{OO 	
varPP 
drugPP 
=PP 
drugRepositoryPP %
.PP% &
GetPP& )
(PP) *
drugIdPP* 0
)PP0 1
;PP1 2
ifQQ 
(QQ 
drugQQ 
==QQ 
nullQQ 
)QQ 
{RR 
returnSS 
NotFoundSS 
(SS  
)SS  !
;SS! "
}TT 
drugRepositoryVV 
.VV 
DeleteVV !
(VV! "
drugVV" &
)VV& '
;VV' (
drugRepositoryWW 
.WW 
SaveChangesWW &
(WW& '
)WW' (
;WW( )
returnXX 
OkXX 
(XX 
)XX 
;XX 
}YY 	
[[[ 	
HttpPut[[	 
([[ 
$str[[  
)[[  !
][[! "
public\\ 
IActionResult\\ 
Update\\ #
(\\# $
Guid\\$ (
drugId\\) /
,\\/ 0
[\\1 2
FromBody\\2 :
]\\: ;
CreateDrugDto\\< I
drugDto\\J Q
)\\Q R
{]] 	
var^^ 
drug^^ 
=^^ 
drugRepository^^ %
.^^% &
Get^^& )
(^^) *
drugId^^* 0
)^^0 1
;^^1 2
if__ 
(__ 
drug__ 
==__ 
null__ 
)__ 
{`` 
returnaa 
NotFoundaa 
(aa  
)aa  !
;aa! "
}bb 
drugdd 
.dd 
Updatedd 
(dd 
drugDtodd 
.dd  
Namedd  $
,dd$ %
drugDtodd& -
.dd- .
Quantitydd. 6
,dd6 7
drugDtodd8 ?
.dd? @
	UnitPricedd@ I
)ddI J
;ddJ K
drugRepositoryff 
.ff 
Updateff !
(ff! "
drugff" &
)ff& '
;ff' (
drugRepositorygg 
.gg 
SaveChangesgg &
(gg& '
)gg' (
;gg( )
returnii 
Okii 
(ii 
drugii 
)ii 
;ii 
}jj 	
}kk 
}ll ù4
õD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\MedicalHistoriesController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{		 
[

 
Route

 

(


 
$str

  
)

  !
]

! "
[ 
ApiController 
] 
public 

class &
MedicalHistoriesController +
:, -
ControllerBase. <
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public &
MedicalHistoriesController )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
=>B D
thisE I
.I J

unitOfWorkJ T
=U V

unitOfWorkW a
;a b
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
medicalHistories  
=! "

unitOfWork# -
.- .$
MedicalHistoryRepository. F
. 
All 
( 
) 
. 
Select 
( 
history  
=>! #
new$ '
MedicalHistoryDto( 9
{: ;
Id< >
=? @
historyA H
.H I
IdI K
,K L
ClinicIdM U
=V W
historyX _
._ `
ClinicId` h
}i j
)k l
;l m
return 
Ok 
( 
medicalHistories &
)& '
;' (
} 	
[ 	
HttpPost	 
( 
$str 7
)7 8
]8 9
public 
IActionResult 
Post !
(! "
Guid" &
medicalHistoryId' 7
,7 8
[9 :
FromBody: B
]B C 
CreateAppointmentDtoD X
appointmentDtoY g
)g h
{ 	
var 
medicalHistory 
=  

unitOfWork! +
.+ ,$
MedicalHistoryRepository, D
.D E
GetE H
(H I
medicalHistoryIdI Y
)Y Z
;Z [
if   
(   
medicalHistory   
==   !
null  " &
)  & '
{!! 
return"" 
NotFound"" 
(""  
)""  !
;""! "
}## 
var%% 
pet%% 
=%% 

unitOfWork%%  
.%%  !
PetRepository%%! .
.%%. /
Get%%/ 2
(%%2 3
appointmentDto%%3 A
.%%A B
PetId%%B G
)%%G H
;%%H I
if&& 
(&& 
pet&& 
==&& 
null&& 
)&& 
{'' 
return(( 
NotFound(( 
(((  
)((  !
;((! "
})) 
var++ 
vet++ 
=++ 

unitOfWork++  
.++  !
VetRepository++! .
.++. /
Get++/ 2
(++2 3
appointmentDto++3 A
.++A B
VetId++B G
)++G H
;++H I
if,, 
(,, 
vet,, 
==,, 
null,, 
),, 
{-- 
return.. 
NotFound.. 
(..  
)..  !
;..! "
}// 
var11 
appointment11 
=11 
Appointment11 )
.11) *
SettleAppointment11* ;
(11; <
vet22 
,22 
pet33 
,33 
appointmentDto44 
.44 
ScheduledDate44 ,
,44, -
appointmentDto55 
.55 &
EstimatedDurationInMinutes55 9
)66 
;66 
if77 
(77 
appointment77 
.77 
	IsFailure77 %
)77% &
{88 
return99 

BadRequest99 !
(99! "
appointment99" -
.99- .
Error99. 3
)993 4
;994 5
}:: 
var<< 
result<< 
=<< 
medicalHistory<< '
.<<' ((
RegisterAppointmentToHistory<<( D
(<<D E
appointment<<E P
.<<P Q
Entity<<Q W
)<<W X
;<<X Y
if== 
(== 
result== 
.== 
	IsFailure==  
)==  !
{>> 
return?? 

BadRequest?? !
(??! "
result??" (
.??( )
Error??) .
)??. /
;??/ 0
}@@ 

unitOfWorkBB 
.BB !
AppointmentRepositoryBB ,
.BB, -
AddBB- 0
(BB0 1
appointmentBB1 <
.BB< =
EntityBB= C
)BBC D
;BBD E

unitOfWorkCC 
.CC 
SaveChangesCC "
(CC" #
)CC# $
;CC$ %
varEE 
fullAppointmentEE 
=EE  !
newEE" %
AppointmentDtoEE& 4
{FF 
IdGG 
=GG 
appointmentGG  
.GG  !
EntityGG! '
.GG' (
IdGG( *
,GG* +
ScheduledDateHH 
=HH 
appointmentHH  +
.HH+ ,
EntityHH, 2
.HH2 3
ScheduledDateHH3 @
.HH@ A
ToStringHHA I
(HHI J
)HHJ K
,HHK L&
EstimatedDurationInMinutesII *
=II+ ,
appointmentII- 8
.II8 9
EntityII9 ?
.II? @&
EstimatedDurationInMinutesII@ Z
,IIZ [
VetIdJJ 
=JJ 
appointmentJJ #
.JJ# $
EntityJJ$ *
.JJ* +
VetIdJJ+ 0
,JJ0 1
PetIdKK 
=KK 
appointmentKK #
.KK# $
EntityKK$ *
.KK* +
PetIdKK+ 0
,KK0 1
TreatmentIdLL 
=LL 
appointmentLL )
.LL) *
EntityLL* 0
.LL0 1
TreatmentIdLL1 <
,LL< =
MedicalHistoryIdMM  
=MM! "
appointmentMM# .
.MM. /
EntityMM/ 5
.MM5 6
MedicalHistoryIdMM6 F
}NN 
;NN 
returnPP 
CreatedPP 
(PP 
nameofPP !
(PP! "
PostPP" &
)PP& '
,PP' (
fullAppointmentPP) 8
)PP8 9
;PP9 :
}QQ 	
}RR 
}SS ﬁG
îD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\PetOwnersController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class 
PetOwnersController $
:% &
ControllerBase' 5
{ 
private 
readonly 
IRepository $
<$ %
PetOwner% -
>- .
petOwnerRepository/ A
;A B
private 
readonly 
IRepository $
<$ %
Pet% (
>( )
petRepository* 7
;7 8
public 
PetOwnersController "
(" #
IRepository# .
<. /
PetOwner/ 7
>7 8
petOwnerRepository9 K
,K L
IRepositoryM X
<X Y
PetY \
>\ ]
petRepository^ k
)k l
{ 	
this 
. 
petOwnerRepository #
=$ %
petOwnerRepository& 8
;8 9
this 
. 
petRepository 
=  
petRepository! .
;. /
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
	petOwners 
= 
petOwnerRepository .
. 
All 
( 
) 
. 
Select 
( 
owner 
=> 
new  
PetOwnerDto! ,
{ 
Id 
= 
owner "
." #
Id# %
,% &
Name 
= 
owner $
.$ %
Name% )
,) *
Surname   
=    !
owner  " '
.  ' (
Surname  ( /
,  / 0
	Birthdate!! !
=!!" #
owner!!$ )
.!!) *
	Birthdate!!* 3
.!!3 4
ToString!!4 <
(!!< =
)!!= >
,!!> ?
Gender"" 
=""  
owner""! &
.""& '
Gender""' -
.""- .
ToString"". 6
(""6 7
)""7 8
,""8 9
Address## 
=##  !
owner##" '
.##' (
Address##( /
,##/ 0
Email$$ 
=$$ 
owner$$  %
.$$% &
Email$$& +
,$$+ ,
Phone%% 
=%% 
owner%%  %
.%%% &
Phone%%& +
}&& 
)&& 
;&& 
return(( 
Ok(( 
((( 
	petOwners(( 
)((  
;((  !
})) 	
[++ 	
HttpPost++	 
]++ 
public,, 
IActionResult,, 
Create,, #
(,,# $
[,,$ %
FromBody,,% -
],,- .
CreatePetOwnerDto,,/ @
petOwnerDto,,A L
),,L M
{-- 	
var.. 
petOwner.. 
=.. 
PetOwner.. #
...# $
Create..$ *
(..+ ,
petOwnerDto// 
.//  
Name//  $
,//$ %
petOwnerDto00 
.00  
Surname00  '
,00' (
petOwnerDto11 
.11  
	Birthdate11  )
,11) *
petOwnerDto22 
.22  
Gender22  &
,22& '
petOwnerDto33 
.33  
Address33  '
,33' (
petOwnerDto44 
.44  
Email44  %
,44% &
petOwnerDto55 
.55  
Phone55  %
)66 
;66 
if88 
(88 
petOwner88 
.88 
	IsFailure88 "
)88" #
{99 
return:: 

BadRequest:: !
(::! "
petOwner::" *
.::* +
Error::+ 0
)::0 1
;::1 2
};; 
petOwnerRepository== 
.== 
Add== "
(==" #
petOwner==# +
.==+ ,
Entity==, 2
)==2 3
;==3 4
petOwnerRepository>> 
.>> 
SaveChanges>> *
(>>* +
)>>+ ,
;>>, -
var@@ 
fullPetOwner@@ 
=@@ 
new@@ "
PetOwnerDto@@# .
(@@. /
)@@/ 0
{AA 
NameBB 
=BB 
petOwnerBB 
.BB  
EntityBB  &
.BB& '
NameBB' +
,BB+ ,
SurnameCC 
=CC 
petOwnerCC "
.CC" #
EntityCC# )
.CC) *
SurnameCC* 1
,CC1 2
AddressDD 
=DD 
petOwnerDD "
.DD" #
EntityDD# )
.DD) *
AddressDD* 1
,DD1 2
	BirthdateEE 
=EE 
petOwnerEE $
.EE$ %
EntityEE% +
.EE+ ,
	BirthdateEE, 5
.EE5 6
ToStringEE6 >
(EE> ?
)EE? @
,EE@ A
EmailFF 
=FF 
petOwnerFF  
.FF  !
EntityFF! '
.FF' (
EmailFF( -
,FF- .
GenderGG 
=GG 
petOwnerGG !
.GG! "
EntityGG" (
.GG( )
GenderGG) /
.GG/ 0
ToStringGG0 8
(GG8 9
)GG9 :
,GG: ;
PhoneHH 
=HH 
petOwnerHH  
.HH  !
EntityHH! '
.HH' (
PhoneHH( -
,HH- .
IdII 
=II 
petOwnerII 
.II 
EntityII $
.II$ %
IdII% '
}JJ 
;JJ 
returnLL 
CreatedLL 
(LL 
nameofLL !
(LL! "
GetLL" %
)LL% &
,LL& '
fullPetOwnerLL( 4
)LL4 5
;LL5 6
}NN 	
[PP 	
HttpPostPP	 
(PP 
$strPP (
)PP( )
]PP) *
publicQQ 
IActionResultQQ 
RegisterPetsToOwnerQQ 0
(QQ0 1
GuidQQ1 5
ownerIdQQ6 =
,QQ= >
[QQ? @
FromBodyQQ@ H
]QQH I
ListQQJ N
<QQN O
CreatePetDtoQQO [
>QQ[ \
petsDtosQQ] e
)QQe f
{RR 	
varSS 
ownerSS 
=SS 
petOwnerRepositorySS *
.SS* +
GetSS+ .
(SS. /
ownerIdSS/ 6
)SS6 7
;SS7 8
ifTT 
(TT 
ownerTT 
==TT 
nullTT 
)TT 
{UU 
returnVV 
NotFoundVV 
(VV  
)VV  !
;VV! "
}WW 
varYY 
petsYY 
=YY 
petsDtosYY 
.YY  
SelectYY  &
(YY& '
pYY' (
=>YY) +
PetYY, /
.YY/ 0
CreateYY0 6
(YY6 7
pYY7 8
.YY8 9
NameYY9 =
,YY= >
pYY? @
.YY@ A
	BirthdateYYA J
,YYJ K
pYYL M
.YYM N
RaceYYN R
,YYR S
pYYT U
.YYU V
GenderYYV \
)YY\ ]
)YY] ^
.YY^ _
ToListYY_ e
(YYe f
)YYf g
;YYg h
ifZZ 
(ZZ 
petsZZ 
.ZZ 
AnyZZ 
(ZZ 
pZZ 
=>ZZ 
pZZ 
.ZZ 
	IsFailureZZ (
)ZZ( )
)ZZ) *
{[[ 
return\\ 

BadRequest\\ !
(\\! "
)\\" #
;\\# $
}^^ 
var`` 
result`` 
=`` 
owner`` 
.`` 
RegisterPetsToOwner`` 2
(``2 3
pets``3 7
.``7 8
Select``8 >
(``> ?
p``? @
=>``A C
p``D E
.``E F
Entity``F L
)``L M
.``M N
ToList``N T
(``T U
)``U V
)``V W
;``W X
ifbb 
(bb 
resultbb 
.bb 
	IsFailurebb  
)bb  !
{cc 
returndd 

BadRequestdd !
(dd! "
resultdd" (
.dd( )
Errordd) .
)dd. /
;dd/ 0
}ee 
petsgg 
.gg 
ForEachgg 
(gg 
pgg 
=>gg 
petRepositorygg +
.gg+ ,
Addgg, /
(gg/ 0
pgg0 1
.gg1 2
Entitygg2 8
)gg8 9
)gg9 :
;gg: ;
petOwnerRepositoryhh 
.hh 
SaveChangeshh *
(hh* +
)hh+ ,
;hh, -
returnjj 
Createdjj 
(jj 
nameofjj !
(jj! "
Getjj" %
)jj% &
,jj& '
ownerjj( -
)jj- .
;jj. /
}kk 	
}ll 
}mm ë
èD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\PetsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[		 
ApiController		 
]		 
public

 

class

 
PetsController

 
:

  !
ControllerBase

" 0
{ 
private 
readonly 
IRepository $
<$ %
Pet% (
>( )
petRepository* 7
;7 8
public 
PetsController 
( 
IRepository )
<) *
Pet* -
>- .
petRepository/ <
)< =
=>> @
thisA E
.E F
petRepositoryF S
=T U
petRepositoryV c
;c d
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
pets 
= 
petRepository $
. 
All 
( 
) 
. 
Select 
( 
p 
=> 
new 
PetDto #
{ 
Id 
= 
p 
. 
Id  
,  !
Name 
= 
p  
.  !
Name! %
,% &
	Birthdate !
=" #
p$ %
.% &
	Birthdate& /
./ 0
ToString0 8
(8 9
)9 :
,: ;
Race 
= 
p  
.  !
Race! %
.% &
ToString& .
(. /
)/ 0
,0 1
Gender 
=  
p! "
." #
Gender# )
.) *
ToString* 2
(2 3
)3 4
} 
) 
; 
return   
Ok   
(   
pets   
)   
;   
}!! 	
}"" 
}## ·'
öD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\PrescribedDrugsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class %
PrescribedDrugsController *
:+ ,
ControllerBase- ;
{ 
private 
readonly 
IRepository $
<$ %
PrescribedDrug% 3
>3 4$
prescribedDrugRepository5 M
;M N
private 
readonly 
IRepository $
<$ %
Drug% )
>) *
drugRepository+ 9
;9 :
public %
PrescribedDrugsController (
(( )
IRepository) 4
<4 5
PrescribedDrug5 C
>C D$
prescribedDrugRepositoryE ]
,] ^
IRepository 
< 
Drug 
> 
drugRepository ,
), -
{ 	
this 
. $
prescribedDrugRepository )
=* +$
prescribedDrugRepository, D
;D E
this 
. 
drugRepository 
=  !
drugRepository" 0
;0 1
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
drugs 
= $
prescribedDrugRepository 0
. 
All 
( 
) 
. 
Select 
( 
d 
=> 
new 
PrescribedDrugDto .
{ 
Id 
= 
d 
. 
Id !
,! "
Quantity    
=  ! "
d  # $
.  $ %
Quantity  % -
,  - .
DrugId!! 
=!!  
d!!! "
.!!" #
DrugToPrescribeId!!# 4
,!!4 5
	TotalCost"" !
=""" #
d""$ %
.""% &
	TotalCost""& /
}## 
)$$ 
;$$ 
return&& 
Ok&& 
(&& 
drugs&& 
)&& 
;&& 
}'' 	
[)) 	
HttpPost))	 
])) 
public** 
IActionResult** 
Create** #
(**# $
[**$ %
FromBody**% -
]**- .#
CreatePrescribedDrugDto**/ F
drugDto**G N
)**N O
{++ 	
var,, 
drug,, 
=,, 
drugRepository,, %
.,,% &
Get,,& )
(,,) *
drugDto,,* 1
.,,1 2
DrugId,,2 8
),,8 9
;,,9 :
if-- 
(-- 
drug-- 
==-- 
null-- 
)-- 
{.. 
return// 
NotFound// 
(//  
)//  !
;//! "
}00 
var22 
prescribedDrug22 
=22  
PrescribedDrug22! /
.22/ 0
Create220 6
(226 7
drugDto227 >
.22> ?
Quantity22? G
,22G H
drug22I M
)22M N
;22N O
if33 
(33 
prescribedDrug33 
.33 
	IsFailure33 (
)33( )
{44 
return55 

BadRequest55 !
(55! "
prescribedDrug55" 0
.550 1
Error551 6
)556 7
;557 8
}66 $
prescribedDrugRepository88 $
.88$ %
Add88% (
(88( )
prescribedDrug88) 7
.887 8
Entity888 >
)88> ?
;88? @$
prescribedDrugRepository99 $
.99$ %
SaveChanges99% 0
(990 1
)991 2
;992 3
var;; 
fullPrescribedDrug;; "
=;;# $
new;;% (
PrescribedDrugDto;;) :
{<< 
Id== 
=== 
prescribedDrug== #
.==# $
Entity==$ *
.==* +
Id==+ -
,==- .
Quantity>> 
=>> 
prescribedDrug>> )
.>>) *
Entity>>* 0
.>>0 1
Quantity>>1 9
,>>9 :
DrugId?? 
=?? 
prescribedDrug?? '
.??' (
Entity??( .
.??. /
DrugToPrescribeId??/ @
,??@ A
	TotalCost@@ 
=@@ 
prescribedDrug@@ *
.@@* +
Entity@@+ 1
.@@1 2
	TotalCost@@2 ;
}AA 
;AA 
returnCC 
CreatedCC 
(CC 
nameofCC !
(CC! "
GetCC" %
)CC% &
,CC& '
fullPrescribedDrugCC( :
)CC: ;
;CC; <
}DD 	
}EE 
}FF œr
ïD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\TreatmentsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{		 
[

 
Route

 

(


 
$str

  
)

  !
]

! "
[ 
ApiController 
] 
public 

class  
TreatmentsController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public  
TreatmentsController #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
=>< >
this? C
.C D

unitOfWorkD N
=O P

unitOfWorkQ [
;[ \
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 

treatments 
= 

unitOfWork '
.' (
TreatmentRepository( ;
. 
All 
( 
) 
. 
Select 
( 
t 
=> 
new "
TreatmentDto# /
{0 1
Id2 4
=5 6
t7 8
.8 9
Id9 ;
,; <
Description= H
=I J
tK L
.L M
DescriptionM X
}Y Z
)[ \
;\ ]
return 
Ok 
( 

treatments  
)  !
;! "
} 	
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- .
CreateTreatmentDto/ A
treatmentDtoB N
)N O
{ 	
var 
treat 
= 
	Treatment !
.! "
Create" (
(( )
treatmentDto) 5
.5 6
Description6 A
)A B
;B C
if   
(   
treat   
.   
	IsFailure   
)    
{!! 
return"" 

BadRequest"" !
(""! "
treat""" '
.""' (
Error""( -
)""- .
;"". /
}## 

unitOfWork%% 
.%% 
TreatmentRepository%% *
.%%* +
Add%%+ .
(%%. /
treat%%/ 4
.%%4 5
Entity%%5 ;
)%%; <
;%%< =

unitOfWork&& 
.&& 
SaveChanges&& "
(&&" #
)&&# $
;&&$ %
var(( 
fullTreatment(( 
=(( 
new((  #
TreatmentDto(($ 0
(((0 1
)((1 2
{)) 
Id** 
=** 
treat** 
.** 
Entity** !
.**! "
Id**" $
,**$ %
Description++ 
=++ 
treat++ #
.++# $
Entity++$ *
.++* +
Description+++ 6
},, 
;,, 
return.. 
Created.. 
(.. 
nameof.. !
(..! "
Get.." %
)..% &
,..& '
fullTreatment..( 5
)..5 6
;..6 7
}// 	
[11 	
HttpPost11	 
(11 
$str11 6
)116 7
]117 8
public22 
IActionResult22 
AddDrugsToTreatment22 0
(220 1
Guid221 5
treatmentId226 A
,22A B
[33 
FromBody33 
]33 
List33 
<33 
PrescribedDrugDto33 -
>33- .
prescribedDrugDtos33/ A
)33A B
{44 	
var55 
	treatment55 
=55 

unitOfWork55 &
.55& '
TreatmentRepository55' :
.55: ;
Get55; >
(55> ?
treatmentId55? J
)55J K
;55K L
if66 
(66 
	treatment66 
==66 
null66 !
)66! "
{77 
return88 
NotFound88 
(88  
)88  !
;88! "
}99 
var;; 
drugs;; 
=;; 
prescribedDrugDtos;; *
.<< 
Select<< 
(<< 
d<< 
=><< 
PrescribedDrug<< +
.<<+ ,
Create<<, 2
(<<2 3
d<<3 4
.<<4 5
Quantity<<5 =
,<<= >

unitOfWork<<? I
.<<I J
DrugRepository<<J X
.<<X Y
Get<<Y \
(<<\ ]
d<<] ^
.<<^ _
DrugId<<_ e
)<<e f
)<<f g
)<<h i
.<<i j
ToList<<j p
(<<p q
)<<q r
;<<r s
if== 
(== 
drugs== 
.== 
Any== 
(== 
p== 
=>== 
p==  
.==  !
	IsFailure==! *
)==* +
)==+ ,
{>> 
return?? 

BadRequest?? !
(??! "
)??" #
;??# $
}@@ 
varBB 
resultBB 
=BB 
	treatmentBB "
.BB" #"
AppendDrugsToTreatmentBB# 9
(BB9 :
drugsBB: ?
.BB? @
SelectBB@ F
(BBF G
dBBG H
=>BBI K
dBBL M
.BBM N
EntityBBN T
)BBT U
.BBU V
ToListBBV \
(BB\ ]
)BB] ^
)BB^ _
;BB_ `
ifCC 
(CC 
resultCC 
.CC 
	IsFailureCC  
)CC  !
{DD 
returnEE 

BadRequestEE !
(EE! "
resultEE" (
.EE( )
ErrorEE) .
)EE. /
;EE/ 0
}FF 
drugsHH 
.HH 
ForEachHH 
(HH 
dHH 
=>HH 

unitOfWorkHH )
.HH) *$
PrescribedDrugRepositoryHH* B
.HHB C
AddHHC F
(HHF G
dHHG H
.HHH I
EntityHHI O
)HHO P
)HHP Q
;HHQ R

unitOfWorkII 
.II 
SaveChangesII "
(II" #
)II# $
;II$ %
returnKK 
	NoContentKK 
(KK 
)KK 
;KK 
}LL 	
[NN 	
HttpPutNN	 
(NN 
$strNN %
)NN% &
]NN& '
publicOO 
IActionResultOO 
UpdateTreatmentOO ,
(OO, -
GuidOO- 1
treatmentIdOO2 =
,OO= >
[OO? @
FromBodyOO@ H
]OOH I
CreateTreatmentDtoOOJ \
treatmentDtoOO] i
)OOi j
{PP 	
varQQ 
	treatmentQQ 
=QQ 

unitOfWorkQQ &
.QQ& '
TreatmentRepositoryQQ' :
.QQ: ;
GetQQ; >
(QQ> ?
treatmentIdQQ? J
)QQJ K
;QQK L
ifRR 
(RR 
	treatmentRR 
==RR 
nullRR !
)RR! "
{SS 
returnTT 
NotFoundTT 
(TT  
)TT  !
;TT! "
}UU 
varWW 
resultWW 
=WW 
	treatmentWW "
.WW" #
UpdateDescriptionWW# 4
(WW4 5
treatmentDtoWW5 A
.WWA B
DescriptionWWB M
)WWM N
;WWN O
ifXX 
(XX 
resultXX 
.XX 
	IsFailureXX  
)XX  !
{YY 
returnZZ 

BadRequestZZ !
(ZZ! "
resultZZ" (
.ZZ( )
ErrorZZ) .
)ZZ. /
;ZZ/ 0
}[[ 

unitOfWork]] 
.]] 
TreatmentRepository]] *
.]]* +
Update]]+ 1
(]]1 2
	treatment]]2 ;
)]]; <
;]]< =

unitOfWork^^ 
.^^ 
SaveChanges^^ "
(^^" #
)^^# $
;^^$ %
return`` 
	NoContent`` 
(`` 
)`` 
;`` 
}aa 	
[cc 	
HttpPutcc	 
(cc 
$strcc L
)ccL M
]ccM N
publicdd 
IActionResultdd !
UpdateDrugInTreatmentdd 2
(dd2 3
Guiddd3 7
treatmentIddd8 C
,ddC D
GuidddE I
prescribedDrugIdddJ Z
,ddZ [
[ee 
FromBodyee 
]ee 
PrescribedDrugDtoee (
prescribedDrugDtoee) :
)ee: ;
{ff 	
vargg 
	treatmentgg 
=gg 

unitOfWorkgg &
.gg& '
TreatmentRepositorygg' :
.gg: ;
Getgg; >
(gg> ?
treatmentIdgg? J
)ggJ K
;ggK L
ifhh 
(hh 
	treatmenthh 
==hh 
nullhh !
)hh! "
{ii 
returnjj 
NotFoundjj 
(jj  
)jj  !
;jj! "
}kk 
varmm 
drugPrescribedmm 
=mm  

unitOfWorkmm! +
.mm+ ,$
PrescribedDrugRepositorymm, D
.mmD E
GetmmE H
(mmH I
prescribedDrugIdmmI Y
)mmY Z
;mmZ [
ifnn 
(nn 
drugPrescribednn 
==nn !
nullnn" &
)nn& '
{oo 
returnpp 
NotFoundpp 
(pp  
)pp  !
;pp! "
}qq 
varss 
drugss 
=ss 

unitOfWorkss !
.ss! "
DrugRepositoryss" 0
.ss0 1
Getss1 4
(ss4 5
prescribedDrugDtoss5 F
.ssF G
DrugIdssG M
)ssM N
;ssN O
iftt 
(tt 
drugtt 
==tt 
nulltt 
)tt 
{uu 
returnvv 
NotFoundvv 
(vv  
)vv  !
;vv! "
}ww 
varyy 
resultyy 
=yy 
drugPrescribedyy '
.yy' (
Updateyy( .
(yy. /
prescribedDrugDtoyy/ @
.yy@ A
QuantityyyA I
,yyI J
drugyyK O
)yyO P
;yyP Q
if{{ 
({{ 
result{{ 
.{{ 
	IsFailure{{  
){{  !
{|| 
return}} 

BadRequest}} !
(}}! "
result}}" (
.}}( )
Error}}) .
)}}. /
;}}/ 0
}~~ 

unitOfWork
ÄÄ 
.
ÄÄ &
PrescribedDrugRepository
ÄÄ /
.
ÄÄ/ 0
Update
ÄÄ0 6
(
ÄÄ6 7
drugPrescribed
ÄÄ7 E
)
ÄÄE F
;
ÄÄF G

unitOfWork
ÅÅ 
.
ÅÅ 
SaveChanges
ÅÅ "
(
ÅÅ" #
)
ÅÅ# $
;
ÅÅ$ %
return
ÉÉ 
	NoContent
ÉÉ 
(
ÉÉ 
)
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
[
ÜÜ 	

HttpDelete
ÜÜ	 
(
ÜÜ 
$str
ÜÜ O
)
ÜÜO P
]
ÜÜP Q
public
áá 
IActionResult
áá %
RemoveDrugFromTreatment
áá 4
(
áá4 5
Guid
áá5 9
treatmentId
áá: E
,
ááE F
Guid
ááG K
prescribedDrugId
ááL \
)
áá\ ]
{
àà 	
var
ââ 
	treatment
ââ 
=
ââ 

unitOfWork
ââ &
.
ââ& '!
TreatmentRepository
ââ' :
.
ââ: ;
Get
ââ; >
(
ââ> ?
treatmentId
ââ? J
)
ââJ K
;
ââK L
if
ää 
(
ää 
	treatment
ää 
==
ää 
null
ää !
)
ää! "
{
ãã 
return
åå 
NotFound
åå 
(
åå  
)
åå  !
;
åå! "
}
çç 
var
èè 
drug
èè 
=
èè 

unitOfWork
èè !
.
èè! "&
PrescribedDrugRepository
èè" :
.
èè: ;
Get
èè; >
(
èè> ?
prescribedDrugId
èè? O
)
èèO P
;
èèP Q
if
êê 
(
êê 
drug
êê 
==
êê 
null
êê 
)
êê 
{
ëë 
return
íí 
NotFound
íí 
(
íí  
)
íí  !
;
íí! "
}
ìì 
var
ïï 
result
ïï 
=
ïï 
	treatment
ïï "
.
ïï" #%
RemoveDrugFromTreatment
ïï# :
(
ïï: ;
drug
ïï; ?
)
ïï? @
;
ïï@ A
if
ññ 
(
ññ 
result
ññ 
.
ññ 
	IsFailure
ññ  
)
ññ  !
{
óó 
return
òò 

BadRequest
òò !
(
òò! "
result
òò" (
.
òò( )
Error
òò) .
)
òò. /
;
òò/ 0
}
ôô 

unitOfWork
õõ 
.
õõ &
PrescribedDrugRepository
õõ /
.
õõ/ 0
Delete
õõ0 6
(
õõ6 7
drug
õõ7 ;
)
õõ; <
;
õõ< =

unitOfWork
úú 
.
úú 
SaveChanges
úú "
(
úú" #
)
úú# $
;
úú$ %
return
ûû 
	NoContent
ûû 
(
ûû 
)
ûû 
;
ûû 
}
üü 	
[
°° 	

HttpDelete
°°	 
(
°° 
$str
°° (
)
°°( )
]
°°) *
public
¢¢ 
IActionResult
¢¢ 
Delete
¢¢ #
(
¢¢# $
Guid
¢¢$ (
treatmentId
¢¢) 4
)
¢¢4 5
{
££ 	
var
§§ 
	treatment
§§ 
=
§§ 

unitOfWork
§§ &
.
§§& '!
TreatmentRepository
§§' :
.
§§: ;
Get
§§; >
(
§§> ?
treatmentId
§§? J
)
§§J K
;
§§K L
if
•• 
(
•• 
	treatment
•• 
==
•• 
null
•• !
)
••! "
{
¶¶ 
return
ßß 
NotFound
ßß 
(
ßß  
)
ßß  !
;
ßß! "
}
®® 

unitOfWork
™™ 
.
™™ !
TreatmentRepository
™™ *
.
™™* +
Delete
™™+ 1
(
™™1 2
	treatment
™™2 ;
)
™™; <
;
™™< =

unitOfWork
´´ 
.
´´ 
SaveChanges
´´ "
(
´´" #
)
´´# $
;
´´$ %
return
≠≠ 
	NoContent
≠≠ 
(
≠≠ 
)
≠≠ 
;
≠≠ 
}
ÆÆ 	
}
∞∞ 
}±± ∑›
ïD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\VetClinicsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Controllers (
{		 
[

 
Route

 

(


 
$str

  
)

  !
]

! "
[ 
ApiController 
] 
public 

class  
VetClinicsController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public  
VetClinicsController #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
=>< >
this? C
.C D

unitOfWorkD N
=O P

unitOfWorkQ [
;[ \
[ 	
HttpPost	 
] 
public 
IActionResult 
Create #
(# $
[$ %
FromBody% -
]- .
CreateVetClinicDto/ A
vetClinicDtoB N
)N O
{ 	
var 
history 
= 
MedicalHistory (
.( )
Create) /
(/ 0
)0 1
;1 2
var 
	vetClinic 
= 
	VetClinic %
.% &
Create& ,
(, -
vetClinicDto  
.  !
Name! %
,% &
vetClinicDto  
.  !
Address! (
,( )
vetClinicDto  
.  !
NumberOfPlaces! /
,/ 0
vetClinicDto  
.  !
ContactEmail! -
,- .
vetClinicDto  
.  !
ContactPhone! -
) 
; 
if 
( 
	vetClinic 
== 
null !
)! "
{ 
return   

BadRequest   !
(  ! "
)  " #
;  # $
}!! 
history## 
.## 
Entity## 
.## 
AtachToClinic## (
(##( )
	vetClinic##) 2
.##2 3
Entity##3 9
.##9 :
Id##: <
)##< =
;##= >
	vetClinic$$ 
.$$ 
Entity$$ 
.$$  
AttachMedicalHistory$$ 1
($$1 2
history$$2 9
.$$9 :
Entity$$: @
.$$@ A
Id$$A C
)$$C D
;$$D E
if&& 
(&& 
	vetClinic&& 
.&& 
	IsFailure&& #
)&&# $
{'' 
return(( 

BadRequest(( !
(((! "
	vetClinic((" +
.((+ ,
Error((, 1
)((1 2
;((2 3
})) 

unitOfWork++ 
.++ $
MedicalHistoryRepository++ /
.++/ 0
Add++0 3
(++3 4
history++4 ;
.++; <
Entity++< B
)++B C
;++C D

unitOfWork,, 
.,, 
SaveChanges,, "
(,," #
),,# $
;,,$ %

unitOfWork.. 
... 
VetClinicRepository.. *
...* +
Add..+ .
(... /
	vetClinic../ 8
...8 9
Entity..9 ?
)..? @
;..@ A

unitOfWork// 
.// 
SaveChanges// "
(//" #
)//# $
;//$ %
var11 

fullClinic11 
=11 
new11  
VetClinicDto11! -
{22 
Id33 
=33 
	vetClinic33 
.33 
Entity33 %
.33% &
Id33& (
,33( )
Name44 
=44 
	vetClinic44  
.44  !
Entity44! '
.44' (
Name44( ,
,44, -
Address55 
=55 
	vetClinic55 #
.55# $
Entity55$ *
.55* +
Address55+ 2
,552 3
NumberOfPlaces66 
=66  
	vetClinic66! *
.66* +
Entity66+ 1
.661 2
NumberOfPlaces662 @
,66@ A
ContactEmail77 
=77 
	vetClinic77 (
.77( )
Entity77) /
.77/ 0
ContactEmail770 <
,77< =
ContactPhone88 
=88 
	vetClinic88 (
.88( )
Entity88) /
.88/ 0
ContactPhone880 <
,88< =
RegistrationDate99  
=99! "
	vetClinic99# ,
.99, -
Entity99- 3
.993 4
RegistrationDate994 D
,99D E
MedicalHistoryId::  
=::! "
history::# *
.::* +
Entity::+ 1
.::1 2
Id::2 4
};; 
;;; 
return== 
Created== 
(== 
nameof== !
(==! "
GetAllVetClinics==" 2
)==2 3
,==3 4

fullClinic==5 ?
)==? @
;==@ A
}>> 	
[AA 	
HttpGetAA	 
]AA 
publicBB 
IActionResultBB 
GetAllVetClinicsBB -
(BB- .
)BB. /
{CC 	
varDD 

vetClinicsDD 
=DD 

unitOfWorkDD '
.DD' (
VetClinicRepositoryDD( ;
.EE 
AllEE 
(EE 
)EE 
.FF 
SelectFF 
(FF 
vetGG 
=>GG 
newGG 
VetClinicDtoGG +
(GG+ ,
)GG, -
{HH 
IdII 
=II 
vetII  
.II  !
IdII! #
,II# $
NameJJ 
=JJ 
vetJJ "
.JJ" #
NameJJ# '
,JJ' (
AddressKK 
=KK  !
vetKK" %
.KK% &
AddressKK& -
,KK- .
NumberOfPlacesLL &
=LL' (
vetLL) ,
.LL, -
NumberOfPlacesLL- ;
,LL; <
ContactEmailMM $
=MM% &
vetMM' *
.MM* +
ContactEmailMM+ 7
,MM7 8
ContactPhoneNN $
=NN% &
vetNN' *
.NN* +
ContactPhoneNN+ 7
,NN7 8
RegistrationDateOO (
=OO) *
vetOO+ .
.OO. /
RegistrationDateOO/ ?
,OO? @
MedicalHistoryIdPP (
=PP) *
vetPP+ .
.PP. /
MedicalHistoryIdPP/ ?
}QQ 
)RR 
;RR 
returnTT 
OkTT 
(TT 

vetClinicsTT  
)TT  !
;TT! "
}UU 	
[WW 	
HttpGetWW	 
(WW 
$strWW %
)WW% &
]WW& '
publicXX 
IActionResultXX 
GetByIdXX $
(XX$ %
GuidXX% )
vetClinicIdXX* 5
)XX5 6
{YY 	
varZZ 
clinicZZ 
=ZZ 

unitOfWorkZZ #
.ZZ# $
VetClinicRepositoryZZ$ 7
.ZZ7 8
GetZZ8 ;
(ZZ; <
vetClinicIdZZ< G
)ZZG H
;ZZH I
if[[ 
([[ 
clinic[[ 
==[[ 
null[[ 
)[[ 
{\\ 
return]] 
NotFound]] 
(]]  
)]]  !
;]]! "
}^^ 
return`` 
Ok`` 
(`` 
clinic`` 
)`` 
;`` 
}aa 	
[cc 	
HttpGetcc	 
(cc 
$strcc *
)cc* +
]cc+ ,
publicdd 
IActionResultdd 
GetVetsByClinicIddd .
(dd. /
Guiddd/ 3
vetClinicIddd4 ?
)dd? @
{ee 	
varff 
clinicff 
=ff 

unitOfWorkff #
.ff# $
VetClinicRepositoryff$ 7
.ff7 8
Getff8 ;
(ff; <
vetClinicIdff< G
)ffG H
;ffH I
ifgg 
(gg 
clinicgg 
==gg 
nullgg 
)gg 
{hh 
returnii 
NotFoundii 
(ii  
)ii  !
;ii! "
}jj 
varll 
vetsll 
=ll 
clinicll 
.ll 
Vetsll "
.mm 
Selectmm 
(mm 
vetmm 
=>mm 
newmm "
VetDtomm# )
(mm) *
)mm* +
{nn 
Idoo 
=oo 
vetoo 
.oo 
Idoo 
,oo  
ClinicIdpp 
=pp 
vetpp "
.pp" #
ClinicIdpp# +
,pp+ ,
Nameqq 
=qq 
vetqq 
.qq 
Nameqq #
,qq# $
Surnamerr 
=rr 
vetrr !
.rr! "
Surnamerr" )
,rr) *
	Birthdatess 
=ss 
vetss  #
.ss# $
	Birthdatess$ -
.ss- .
ToStringss. 6
(ss6 7
)ss7 8
,ss8 9
Specialisationtt "
=tt# $
vettt% (
.tt( )
Specialisationtt) 7
.tt7 8
ToStringtt8 @
(tt@ A
)ttA B
,ttB C
Emailuu 
=uu 
vetuu 
.uu  
Emailuu  %
,uu% &
Gendervv 
=vv 
vetvv  
.vv  !
Gendervv! '
.vv' (
ToStringvv( 0
(vv0 1
)vv1 2
,vv2 3
Phoneww 
=ww 
vetww 
.ww  
Phoneww  %
,ww% &
}xx 
)xx 
;xx 
returnzz 
Okzz 
(zz 
vetszz 
)zz 
;zz 
}{{ 	
[}} 	
HttpGet}}	 
(}} 
$str}} *
)}}* +
]}}+ ,
public~~ 
IActionResult~~ 
GetPetsByClinicId~~ .
(~~. /
Guid~~/ 3
vetClinicId~~4 ?
)~~? @
{ 	
var
ÄÄ 
clinic
ÄÄ 
=
ÄÄ 

unitOfWork
ÄÄ #
.
ÄÄ# $!
VetClinicRepository
ÄÄ$ 7
.
ÄÄ7 8
Get
ÄÄ8 ;
(
ÄÄ; <
vetClinicId
ÄÄ< G
)
ÄÄG H
;
ÄÄH I
if
ÅÅ 
(
ÅÅ 
clinic
ÅÅ 
==
ÅÅ 
null
ÅÅ 
)
ÅÅ 
{
ÇÇ 
return
ÉÉ 
NotFound
ÉÉ 
(
ÉÉ  
)
ÉÉ  !
;
ÉÉ! "
}
ÑÑ 
var
ÜÜ 
pets
ÜÜ 
=
ÜÜ 
clinic
ÜÜ 
.
ÜÜ 
Pets
ÜÜ "
.
áá 
Select
áá 
(
áá 
pet
áá 
=>
áá 
new
áá "
PetDto
áá# )
(
áá) *
)
áá* +
{
àà 
Id
ââ 
=
ââ 
pet
ââ 
.
ââ 
Id
ââ 
,
ââ  
Name
ää 
=
ää 
pet
ää 
.
ää 
Name
ää #
,
ää# $
	Birthdate
ãã 
=
ãã 
pet
ãã  #
.
ãã# $
	Birthdate
ãã$ -
.
ãã- .
ToString
ãã. 6
(
ãã6 7
)
ãã7 8
,
ãã8 9
Gender
åå 
=
åå 
pet
åå  
.
åå  !
Gender
åå! '
.
åå' (
ToString
åå( 0
(
åå0 1
)
åå1 2
,
åå2 3
Race
çç 
=
çç 
pet
çç 
.
çç 
Race
çç #
.
çç# $
ToString
çç$ ,
(
çç, -
)
çç- .
,
çç. /
}
éé 
)
éé 
;
éé 
return
êê 
Ok
êê 
(
êê 
pets
êê 
)
êê 
;
êê 
}
ëë 	
[
ìì 	
HttpGet
ìì	 
(
ìì 
$str
ìì 2
)
ìì2 3
]
ìì3 4
public
îî 
IActionResult
îî '
GetAppointmentsByClinicId
îî 6
(
îî6 7
Guid
îî7 ;
vetClinicId
îî< G
)
îîG H
{
ïï 	
var
ññ 
clinic
ññ 
=
ññ 

unitOfWork
ññ #
.
ññ# $!
VetClinicRepository
ññ$ 7
.
ññ7 8
Get
ññ8 ;
(
ññ; <
vetClinicId
ññ< G
)
ññG H
;
ññH I
if
óó 
(
óó 
clinic
óó 
==
óó 
null
óó 
)
óó 
{
òò 
return
ôô 
NotFound
ôô 
(
ôô  
)
ôô  !
;
ôô! "
}
öö 
var
úú 
medicalHistory
úú 
=
úú  

unitOfWork
úú! +
.
úú+ ,&
MedicalHistoryRepository
úú, D
.
úúD E
Get
úúE H
(
úúH I
clinic
úúI O
.
úúO P
MedicalHistoryId
úúP `
)
úú` a
;
úúa b
var
ûû 
appointments
ûû 
=
ûû 
medicalHistory
ûû -
.
ûû- .
Appointments
ûû. :
.
üü 
Select
üü 
(
üü 
appointment
†† 
=>
††  "
new
††# &
AppointmentDto
††' 5
(
††5 6
)
††6 7
{
°° 
Id
¢¢ 
=
¢¢ 
appointment
¢¢ (
.
¢¢( )
Id
¢¢) +
,
¢¢+ ,(
EstimatedDurationInMinutes
££ 2
=
££3 4
appointment
££5 @
.
££@ A(
EstimatedDurationInMinutes
££A [
,
££[ \
PetId
§§ 
=
§§ 
appointment
§§  +
.
§§+ ,
PetId
§§, 1
,
§§1 2
VetId
•• 
=
•• 
appointment
••  +
.
••+ ,
VetId
••, 1
,
••1 2
ScheduledDate
¶¶ %
=
¶¶& '
appointment
¶¶( 3
.
¶¶3 4
ScheduledDate
¶¶4 A
.
¶¶A B
ToString
¶¶B J
(
¶¶J K
)
¶¶K L
,
¶¶L M
TreatmentId
ßß #
=
ßß$ %
appointment
ßß& 1
.
ßß1 2
TreatmentId
ßß2 =
}
®® 
)
©© 
;
©© 
return
´´ 
Ok
´´ 
(
´´ 
appointments
´´ "
)
´´" #
;
´´# $
}
¨¨ 	
[
ØØ 	
HttpPost
ØØ	 
(
ØØ 
$str
ØØ +
)
ØØ+ ,
]
ØØ, -
public
∞∞ 
IActionResult
∞∞  
RegisterPetsFamily
∞∞ /
(
∞∞/ 0
Guid
∞∞0 4
vetClinicId
∞∞5 @
,
∞∞@ A
[
∞∞B C
FromBody
∞∞C K
]
∞∞K L
List
∞∞M Q
<
∞∞Q R
CreatePetDto
∞∞R ^
>
∞∞^ _
petsDtos
∞∞` h
)
∞∞h i
{
±± 	
var
≤≤ 
clinic
≤≤ 
=
≤≤ 

unitOfWork
≤≤ #
.
≤≤# $!
VetClinicRepository
≤≤$ 7
.
≤≤7 8
Get
≤≤8 ;
(
≤≤; <
vetClinicId
≤≤< G
)
≤≤G H
;
≤≤H I
if
≥≥ 
(
≥≥ 
clinic
≥≥ 
==
≥≥ 
null
≥≥ 
)
≥≥ 
{
¥¥ 
return
µµ 
NotFound
µµ 
(
µµ  
)
µµ  !
;
µµ! "
}
∂∂ 
var
∏∏ 
pets
∏∏ 
=
∏∏ 
petsDtos
∏∏ 
.
∏∏  
Select
∏∏  &
(
∏∏& '
p
∏∏' (
=>
∏∏) +
Pet
∏∏, /
.
∏∏/ 0
Create
∏∏0 6
(
∏∏6 7
p
∏∏7 8
.
∏∏8 9
Name
∏∏9 =
,
∏∏= >
p
∏∏? @
.
∏∏@ A
	Birthdate
∏∏A J
,
∏∏J K
p
∏∏L M
.
∏∏M N
Race
∏∏N R
,
∏∏R S
p
∏∏T U
.
∏∏U V
Gender
∏∏V \
)
∏∏\ ]
)
∏∏] ^
.
∏∏^ _
ToList
∏∏_ e
(
∏∏e f
)
∏∏f g
;
∏∏g h
if
ππ 
(
ππ 
pets
ππ 
.
ππ 
Any
ππ 
(
ππ 
p
ππ 
=>
ππ 
p
ππ 
.
ππ  
	IsFailure
ππ  )
)
ππ) *
)
ππ* +
{
∫∫ 
return
ªª 

BadRequest
ªª !
(
ªª! "
)
ªª" #
;
ªª# $
}
ºº 
var
ææ 
result
ææ 
=
ææ 
clinic
ææ 
.
ææ  (
RegisterPetsFamilyToClinic
ææ  :
(
ææ: ;
pets
ææ; ?
.
ææ? @
Select
ææ@ F
(
ææF G
p
ææG H
=>
ææI K
p
ææL M
.
ææM N
Entity
ææN T
)
ææT U
.
ææU V
ToList
ææV \
(
ææ\ ]
)
ææ] ^
)
ææ^ _
;
ææ_ `
if
øø 
(
øø 
result
øø 
.
øø 
	IsFailure
øø  
)
øø  !
{
¿¿ 
return
¡¡ 

BadRequest
¡¡ !
(
¡¡! "
result
¡¡" (
.
¡¡( )
Error
¡¡) .
)
¡¡. /
;
¡¡/ 0
}
¬¬ 
pets
ƒƒ 
.
ƒƒ 
ForEach
ƒƒ 
(
ƒƒ 
p
ƒƒ 
=>
ƒƒ 

unitOfWork
ƒƒ (
.
ƒƒ( )
PetRepository
ƒƒ) 6
.
ƒƒ6 7
Add
ƒƒ7 :
(
ƒƒ: ;
p
ƒƒ; <
.
ƒƒ< =
Entity
ƒƒ= C
)
ƒƒC D
)
ƒƒD E
;
ƒƒE F

unitOfWork
≈≈ 
.
≈≈ 
SaveChanges
≈≈ "
(
≈≈" #
)
≈≈# $
;
≈≈$ %
var
»» 
createdPets
»» 
=
»» 
pets
»» "
.
»»" #
Select
»»# )
(
»») *
pet
…… 
=>
…… 
new
…… 
PetDto
…… !
(
……! "
)
……" #
{
   
Name
ÀÀ 
=
ÀÀ 
pet
ÀÀ 
.
ÀÀ 
Entity
ÀÀ %
.
ÀÀ% &
Name
ÀÀ& *
,
ÀÀ* +
	Birthdate
ÃÃ 
=
ÃÃ 
pet
ÃÃ  #
.
ÃÃ# $
Entity
ÃÃ$ *
.
ÃÃ* +
	Birthdate
ÃÃ+ 4
.
ÃÃ4 5
ToString
ÃÃ5 =
(
ÃÃ= >
)
ÃÃ> ?
,
ÃÃ? @
Gender
ÕÕ 
=
ÕÕ 
pet
ÕÕ  
.
ÕÕ  !
Entity
ÕÕ! '
.
ÕÕ' (
Gender
ÕÕ( .
.
ÕÕ. /
ToString
ÕÕ/ 7
(
ÕÕ7 8
)
ÕÕ8 9
,
ÕÕ9 :
Race
ŒŒ 
=
ŒŒ 
pet
ŒŒ 
.
ŒŒ 
Entity
ŒŒ %
.
ŒŒ% &
Race
ŒŒ& *
.
ŒŒ* +
ToString
ŒŒ+ 3
(
ŒŒ3 4
)
ŒŒ4 5
,
ŒŒ5 6
Id
œœ 
=
œœ 
pet
œœ 
.
œœ 
Entity
œœ #
.
œœ# $
Id
œœ$ &
,
œœ& '
}
–– 
)
–– 
;
–– 
return
““ 
Created
““ 
(
““ 
nameof
““ !
(
““! "
GetPetsByClinicId
““" 3
)
““3 4
,
““4 5
createdPets
““6 A
)
““A B
;
““B C
}
”” 	
[
’’ 	
HttpPost
’’	 
(
’’ 
$str
’’ *
)
’’* +
]
’’+ ,
public
÷÷ 
IActionResult
÷÷ 
RegisterVet
÷÷ (
(
÷÷( )
Guid
÷÷) -
vetClinicId
÷÷. 9
,
÷÷9 :
[
÷÷; <
FromBody
÷÷< D
]
÷÷D E
CreateVetDto
÷÷F R
vetDto
÷÷S Y
)
÷÷Y Z
{
◊◊ 	
var
ÿÿ 
clinic
ÿÿ 
=
ÿÿ 

unitOfWork
ÿÿ #
.
ÿÿ# $!
VetClinicRepository
ÿÿ$ 7
.
ÿÿ7 8
Get
ÿÿ8 ;
(
ÿÿ; <
vetClinicId
ÿÿ< G
)
ÿÿG H
;
ÿÿH I
if
ŸŸ 
(
ŸŸ 
clinic
ŸŸ 
==
ŸŸ 
null
ŸŸ 
)
ŸŸ 
{
⁄⁄ 
return
€€ 
NotFound
€€ 
(
€€  
)
€€  !
;
€€! "
}
‹‹ 
var
ﬁﬁ 
doctor
ﬁﬁ 
=
ﬁﬁ 
Vet
ﬁﬁ 
.
ﬁﬁ 
Create
ﬁﬁ #
(
ﬁﬁ# $
vetDto
ﬁﬁ$ *
.
ﬁﬁ* +
Name
ﬁﬁ+ /
,
ﬁﬁ/ 0
vetDto
ﬁﬁ1 7
.
ﬁﬁ7 8
Surname
ﬁﬁ8 ?
,
ﬁﬁ? @
vetDto
ﬁﬁA G
.
ﬁﬁG H
	Birthdate
ﬁﬁH Q
,
ﬁﬁQ R
vetDto
ﬁﬁS Y
.
ﬁﬁY Z
Gender
ﬁﬁZ `
,
ﬁﬁ` a
vetDto
ﬁﬁb h
.
ﬁﬁh i
Email
ﬁﬁi n
,
ﬁﬁn o
vetDto
ﬂﬂ 
.
ﬂﬂ 
Phone
ﬂﬂ 
,
ﬂﬂ 
vetDto
ﬂﬂ $
.
ﬂﬂ$ %
Specialisation
ﬂﬂ% 3
)
ﬂﬂ3 4
;
ﬂﬂ4 5
if
‡‡ 
(
‡‡ 
doctor
‡‡ 
.
‡‡ 
	IsFailure
‡‡  
)
‡‡  !
{
·· 
return
‚‚ 

BadRequest
‚‚ !
(
‚‚! "
)
‚‚" #
;
‚‚# $
}
„„ 
var
ÂÂ 
result
ÂÂ 
=
ÂÂ 
clinic
ÂÂ 
.
ÂÂ  !
RegisterVetToClinic
ÂÂ  3
(
ÂÂ3 4
doctor
ÂÂ4 :
.
ÂÂ: ;
Entity
ÂÂ; A
)
ÂÂA B
;
ÂÂB C
if
ÊÊ 
(
ÊÊ 
result
ÊÊ 
.
ÊÊ 
	IsFailure
ÊÊ  
)
ÊÊ  !
{
ÁÁ 
return
ËË 

BadRequest
ËË !
(
ËË! "
result
ËË" (
.
ËË( )
Error
ËË) .
)
ËË. /
;
ËË/ 0
}
ÈÈ 

unitOfWork
ÎÎ 
.
ÎÎ !
VetClinicRepository
ÎÎ *
.
ÎÎ* +
Update
ÎÎ+ 1
(
ÎÎ1 2
clinic
ÎÎ2 8
)
ÎÎ8 9
;
ÎÎ9 :

unitOfWork
ÏÏ 
.
ÏÏ 
VetRepository
ÏÏ $
.
ÏÏ$ %
Add
ÏÏ% (
(
ÏÏ( )
doctor
ÏÏ) /
.
ÏÏ/ 0
Entity
ÏÏ0 6
)
ÏÏ6 7
;
ÏÏ7 8

unitOfWork
ÌÌ 
.
ÌÌ 
SaveChanges
ÌÌ "
(
ÌÌ" #
)
ÌÌ# $
;
ÌÌ$ %
var
ÔÔ 
	createVet
ÔÔ 
=
ÔÔ 
new
ÔÔ 
VetDto
ÔÔ  &
(
ÔÔ& '
)
ÔÔ' (
{
 
Name
ÒÒ 
=
ÒÒ 
doctor
ÒÒ 
.
ÒÒ 
Entity
ÒÒ $
.
ÒÒ$ %
Name
ÒÒ% )
,
ÒÒ) *
Surname
ÚÚ 
=
ÚÚ 
doctor
ÚÚ  
.
ÚÚ  !
Entity
ÚÚ! '
.
ÚÚ' (
Surname
ÚÚ( /
,
ÚÚ/ 0
Specialisation
ÛÛ 
=
ÛÛ  
doctor
ÛÛ! '
.
ÛÛ' (
Entity
ÛÛ( .
.
ÛÛ. /
Specialisation
ÛÛ/ =
.
ÛÛ= >
ToString
ÛÛ> F
(
ÛÛF G
)
ÛÛG H
,
ÛÛH I
	Birthdate
ÙÙ 
=
ÙÙ 
doctor
ÙÙ "
.
ÙÙ" #
Entity
ÙÙ# )
.
ÙÙ) *
	Birthdate
ÙÙ* 3
.
ÙÙ3 4
ToString
ÙÙ4 <
(
ÙÙ< =
)
ÙÙ= >
,
ÙÙ> ?
Gender
ıı 
=
ıı 
doctor
ıı 
.
ıı  
Entity
ıı  &
.
ıı& '
Gender
ıı' -
.
ıı- .
ToString
ıı. 6
(
ıı6 7
)
ıı7 8
,
ıı8 9
Email
ˆˆ 
=
ˆˆ 
doctor
ˆˆ 
.
ˆˆ 
Entity
ˆˆ %
.
ˆˆ% &
Email
ˆˆ& +
,
ˆˆ+ ,
Phone
˜˜ 
=
˜˜ 
doctor
˜˜ 
.
˜˜ 
Entity
˜˜ %
.
˜˜% &
Phone
˜˜& +
,
˜˜+ ,
Id
¯¯ 
=
¯¯ 
doctor
¯¯ 
.
¯¯ 
Entity
¯¯ "
.
¯¯" #
Id
¯¯# %
,
¯¯% &
}
˘˘ 
;
˘˘ 
return
˚˚ 
Created
˚˚ 
(
˚˚ 
nameof
˚˚ !
(
˚˚! "
RegisterVet
˚˚" -
)
˚˚- .
,
˚˚. /
	createVet
˚˚0 9
)
˚˚9 :
;
˚˚: ;
}
¸¸ 	
[
˛˛ 	
HttpPost
˛˛	 
(
˛˛ 
$str
˛˛ 2
)
˛˛2 3
]
˛˛3 4
public
ˇˇ 
IActionResult
ˇˇ !
RegisterAppointment
ˇˇ 0
(
ˇˇ0 1
Guid
ˇˇ1 5
vetClinicId
ˇˇ6 A
,
ˇˇA B
[
ˇˇC D
FromBody
ˇˇD L
]
ˇˇL M"
CreateAppointmentDto
ˇˇN b
appointmentDto
ˇˇc q
)
ˇˇq r
{
ÄÄ 	
var
ÅÅ 
clinic
ÅÅ 
=
ÅÅ 

unitOfWork
ÅÅ #
.
ÅÅ# $!
VetClinicRepository
ÅÅ$ 7
.
ÅÅ7 8
Get
ÅÅ8 ;
(
ÅÅ; <
vetClinicId
ÅÅ< G
)
ÅÅG H
;
ÅÅH I
if
ÇÇ 
(
ÇÇ 
clinic
ÇÇ 
==
ÇÇ 
null
ÇÇ 
)
ÇÇ 
{
ÉÉ 
return
ÑÑ 
NotFound
ÑÑ 
(
ÑÑ  
)
ÑÑ  !
;
ÑÑ! "
}
ÖÖ 
var
áá 
medicalHistory
áá 
=
áá  

unitOfWork
áá! +
.
áá+ ,&
MedicalHistoryRepository
áá, D
.
ááD E
Get
ááE H
(
ááH I
clinic
ááI O
.
ááO P
MedicalHistoryId
ááP `
)
áá` a
;
ááa b
var
ââ 
pet
ââ 
=
ââ 

unitOfWork
ââ  
.
ââ  !
PetRepository
ââ! .
.
ââ. /
Get
ââ/ 2
(
ââ2 3
appointmentDto
ââ3 A
.
ââA B
PetId
ââB G
)
ââG H
;
ââH I
if
ää 
(
ää 
pet
ää 
==
ää 
null
ää 
)
ää 
{
ãã 
return
åå 
NotFound
åå 
(
åå  
)
åå  !
;
åå! "
}
çç 
var
èè 
vet
èè 
=
èè 

unitOfWork
èè  
.
èè  !
VetRepository
èè! .
.
èè. /
Get
èè/ 2
(
èè2 3
appointmentDto
èè3 A
.
èèA B
VetId
èèB G
)
èèG H
;
èèH I
if
êê 
(
êê 
vet
êê 
==
êê 
null
êê 
)
êê 
{
ëë 
return
íí 
NotFound
íí 
(
íí  
)
íí  !
;
íí! "
}
ìì 
var
ïï 
appointment
ïï 
=
ïï 
Appointment
ïï )
.
ïï) *
SettleAppointment
ïï* ;
(
ïï; <
vet
ïï< ?
,
ïï? @
pet
ïïA D
,
ïïD E
appointmentDto
ïïF T
.
ïïT U
ScheduledDate
ïïU b
,
ïïb c
appointmentDto
ññ 
.
ññ (
EstimatedDurationInMinutes
ññ 9
)
ññ9 :
;
ññ: ;
if
óó 
(
óó 
appointment
óó 
.
óó 
	IsFailure
óó %
)
óó% &
{
òò 
return
ôô 

BadRequest
ôô !
(
ôô! "
)
ôô" #
;
ôô# $
}
öö 
var
úú 
result
úú 
=
úú 
medicalHistory
úú '
.
úú' (*
RegisterAppointmentToHistory
úú( D
(
úúD E
appointment
úúE P
.
úúP Q
Entity
úúQ W
)
úúW X
;
úúX Y
if
ùù 
(
ùù 
result
ùù 
.
ùù 
	IsFailure
ùù  
)
ùù  !
{
ûû 
return
üü 

BadRequest
üü !
(
üü! "
result
üü" (
.
üü( )
Error
üü) .
)
üü. /
;
üü/ 0
}
†† 

unitOfWork
¢¢ 
.
¢¢ &
MedicalHistoryRepository
¢¢ /
.
¢¢/ 0
Update
¢¢0 6
(
¢¢6 7
medicalHistory
¢¢7 E
)
¢¢E F
;
¢¢F G

unitOfWork
££ 
.
££ #
AppointmentRepository
££ ,
.
££, -
Add
££- 0
(
££0 1
appointment
££1 <
.
££< =
Entity
££= C
)
££C D
;
££D E

unitOfWork
§§ 
.
§§ 
SaveChanges
§§ "
(
§§" #
)
§§# $
;
§§$ %
var
¶¶  
createdAppointment
¶¶ "
=
¶¶# $
new
¶¶% (
AppointmentDto
¶¶) 7
(
¶¶7 8
)
¶¶8 9
{
ßß 
Id
®® 
=
®® 
appointment
®®  
.
®®  !
Entity
®®! '
.
®®' (
Id
®®( *
,
®®* +(
EstimatedDurationInMinutes
©© *
=
©©+ ,
appointment
©©- 8
.
©©8 9
Entity
©©9 ?
.
©©? @(
EstimatedDurationInMinutes
©©@ Z
,
©©Z [
PetId
™™ 
=
™™ 
appointment
™™ #
.
™™# $
Entity
™™$ *
.
™™* +
PetId
™™+ 0
,
™™0 1
VetId
´´ 
=
´´ 
appointment
´´ #
.
´´# $
Entity
´´$ *
.
´´* +
VetId
´´+ 0
,
´´0 1
ScheduledDate
¨¨ 
=
¨¨ 
appointment
¨¨  +
.
¨¨+ ,
Entity
¨¨, 2
.
¨¨2 3
ScheduledDate
¨¨3 @
.
¨¨@ A
ToString
¨¨A I
(
¨¨I J
)
¨¨J K
,
¨¨K L
TreatmentId
≠≠ 
=
≠≠ 
appointment
≠≠ )
.
≠≠) *
Entity
≠≠* 0
.
≠≠0 1
TreatmentId
≠≠1 <
}
ÆÆ 
;
ÆÆ 
return
∞∞ 
Created
∞∞ 
(
∞∞ 
nameof
∞∞ !
(
∞∞! "!
RegisterAppointment
∞∞" 5
)
∞∞5 6
,
∞∞6 7 
createdAppointment
∞∞8 J
)
∞∞J K
;
∞∞K L
}
±± 	
[
≥≥ 	
HttpPut
≥≥	 
(
≥≥ 
$str
≥≥ %
)
≥≥% &
]
≥≥& '
public
¥¥ 
IActionResult
¥¥ 
Update
¥¥ #
(
¥¥# $
Guid
¥¥$ (
vetClinicId
¥¥) 4
,
¥¥4 5
[
¥¥6 7
FromBody
¥¥7 ?
]
¥¥? @
VetClinicDto
¥¥A M
vetClinicDto
¥¥N Z
)
¥¥Z [
{
µµ 	
var
∂∂ 
clinic
∂∂ 
=
∂∂ 

unitOfWork
∂∂ #
.
∂∂# $!
VetClinicRepository
∂∂$ 7
.
∂∂7 8
Get
∂∂8 ;
(
∂∂; <
vetClinicId
∂∂< G
)
∂∂G H
;
∂∂H I
if
∑∑ 
(
∑∑ 
clinic
∑∑ 
==
∑∑ 
null
∑∑ 
)
∑∑ 
{
∏∏ 
return
ππ 
NotFound
ππ 
(
ππ  
)
ππ  !
;
ππ! "
}
∫∫ 
var
ºº 
result
ºº 
=
ºº 
clinic
ºº 
.
ºº  
Update
ºº  &
(
ºº& '
vetClinicDto
ºº' 3
.
ºº3 4
Name
ºº4 8
,
ºº8 9
vetClinicDto
ºº: F
.
ººF G
Address
ººG N
,
ººN O
vetClinicDto
ººP \
.
ºº\ ]
NumberOfPlaces
ºº] k
,
ººk l
vetClinicDto
ΩΩ 
.
ΩΩ 
ContactEmail
ΩΩ )
,
ΩΩ) *
vetClinicDto
ΩΩ+ 7
.
ΩΩ7 8
ContactPhone
ΩΩ8 D
)
ΩΩD E
;
ΩΩE F
if
ææ 
(
ææ 
result
ææ 
.
ææ 
	IsFailure
ææ  
)
ææ  !
{
øø 
return
¿¿ 

BadRequest
¿¿ !
(
¿¿! "
result
¿¿" (
.
¿¿( )
Error
¿¿) .
)
¿¿. /
;
¿¿/ 0
}
¡¡ 

unitOfWork
√√ 
.
√√ !
VetClinicRepository
√√ *
.
√√* +
Update
√√+ 1
(
√√1 2
result
√√2 8
.
√√8 9
Entity
√√9 ?
)
√√? @
;
√√@ A

unitOfWork
ƒƒ 
.
ƒƒ 
SaveChanges
ƒƒ "
(
ƒƒ" #
)
ƒƒ# $
;
ƒƒ$ %
return
∆∆ 
	NoContent
∆∆ 
(
∆∆ 
)
∆∆ 
;
∆∆ 
}
«« 	
[
…… 	
HttpPut
……	 
(
…… 
$str
…… 6
)
……6 7
]
……7 8
public
   
IActionResult
   
	UpdateVet
   &
(
  & '
Guid
  ' +
vetClinicId
  , 7
,
  7 8
Guid
  9 =
vetId
  > C
,
  C D
[
  E F
FromBody
  F N
]
  N O
VetDto
  P V
vetDto
  W ]
)
  ] ^
{
ÀÀ 	
var
ÃÃ 
clinic
ÃÃ 
=
ÃÃ 

unitOfWork
ÃÃ #
.
ÃÃ# $!
VetClinicRepository
ÃÃ$ 7
.
ÃÃ7 8
Get
ÃÃ8 ;
(
ÃÃ; <
vetClinicId
ÃÃ< G
)
ÃÃG H
;
ÃÃH I
if
ÕÕ 
(
ÕÕ 
clinic
ÕÕ 
==
ÕÕ 
null
ÕÕ 
)
ÕÕ 
{
ŒŒ 
return
œœ 
NotFound
œœ 
(
œœ  
)
œœ  !
;
œœ! "
}
–– 
var
““ 
vet
““ 
=
““ 

unitOfWork
““  
.
““  !
VetRepository
““! .
.
““. /
Get
““/ 2
(
““2 3
vetId
““3 8
)
““8 9
;
““9 :
if
”” 
(
”” 
vet
”” 
==
”” 
null
”” 
)
”” 
{
‘‘ 
return
’’ 
NotFound
’’ 
(
’’  
)
’’  !
;
’’! "
}
÷÷ 
var
ÿÿ 
result
ÿÿ 
=
ÿÿ 
vet
ÿÿ 
.
ÿÿ 
Update
ÿÿ #
(
ÿÿ# $
vetDto
ÿÿ$ *
.
ÿÿ* +
Name
ÿÿ+ /
,
ÿÿ/ 0
vetDto
ÿÿ1 7
.
ÿÿ7 8
Surname
ÿÿ8 ?
,
ÿÿ? @
vetDto
ÿÿA G
.
ÿÿG H
	Birthdate
ÿÿH Q
,
ÿÿQ R
vetDto
ÿÿS Y
.
ÿÿY Z
Gender
ÿÿZ `
,
ÿÿ` a
vetDto
ÿÿb h
.
ÿÿh i
Email
ÿÿi n
,
ÿÿn o
vetDto
ŸŸ 
.
ŸŸ 
Phone
ŸŸ 
,
ŸŸ 
vetDto
ŸŸ $
.
ŸŸ$ %
Specialisation
ŸŸ% 3
)
ŸŸ3 4
;
ŸŸ4 5
if
⁄⁄ 
(
⁄⁄ 
result
⁄⁄ 
.
⁄⁄ 
	IsFailure
⁄⁄  
)
⁄⁄  !
{
€€ 
return
‹‹ 

BadRequest
‹‹ !
(
‹‹! "
result
‹‹" (
.
‹‹( )
Error
‹‹) .
)
‹‹. /
;
‹‹/ 0
}
›› 

unitOfWork
ﬂﬂ 
.
ﬂﬂ 
VetRepository
ﬂﬂ $
.
ﬂﬂ$ %
Update
ﬂﬂ% +
(
ﬂﬂ+ ,
vet
ﬂﬂ, /
)
ﬂﬂ/ 0
;
ﬂﬂ0 1

unitOfWork
‡‡ 
.
‡‡ 
SaveChanges
‡‡ "
(
‡‡" #
)
‡‡# $
;
‡‡$ %
return
‚‚ 
	NoContent
‚‚ 
(
‚‚ 
)
‚‚ 
;
‚‚ 
}
„„ 	
[
ÂÂ 	
HttpPut
ÂÂ	 
(
ÂÂ 
$str
ÂÂ 6
)
ÂÂ6 7
]
ÂÂ7 8
public
ÊÊ 
IActionResult
ÊÊ 
	UpdatePet
ÊÊ &
(
ÊÊ& '
Guid
ÊÊ' +
vetClinicId
ÊÊ, 7
,
ÊÊ7 8
Guid
ÊÊ9 =
petId
ÊÊ> C
,
ÊÊC D
[
ÊÊE F
FromBody
ÊÊF N
]
ÊÊN O
PetDto
ÊÊP V
petDto
ÊÊW ]
)
ÊÊ] ^
{
ÁÁ 	
var
ËË 
clinic
ËË 
=
ËË 

unitOfWork
ËË #
.
ËË# $!
VetClinicRepository
ËË$ 7
.
ËË7 8
Get
ËË8 ;
(
ËË; <
vetClinicId
ËË< G
)
ËËG H
;
ËËH I
if
ÈÈ 
(
ÈÈ 
clinic
ÈÈ 
==
ÈÈ 
null
ÈÈ 
)
ÈÈ 
{
ÍÍ 
return
ÎÎ 
NotFound
ÎÎ 
(
ÎÎ  
)
ÎÎ  !
;
ÎÎ! "
}
ÏÏ 
var
ÓÓ 
pet
ÓÓ 
=
ÓÓ 

unitOfWork
ÓÓ  
.
ÓÓ  !
PetRepository
ÓÓ! .
.
ÓÓ. /
Get
ÓÓ/ 2
(
ÓÓ2 3
petId
ÓÓ3 8
)
ÓÓ8 9
;
ÓÓ9 :
if
ÔÔ 
(
ÔÔ 
pet
ÔÔ 
==
ÔÔ 
null
ÔÔ 
)
ÔÔ 
{
 
return
ÒÒ 
NotFound
ÒÒ 
(
ÒÒ  
)
ÒÒ  !
;
ÒÒ! "
}
ÚÚ 
var
ÙÙ 
result
ÙÙ 
=
ÙÙ 
pet
ÙÙ 
.
ÙÙ 
Update
ÙÙ #
(
ÙÙ# $
petDto
ÙÙ$ *
.
ÙÙ* +
Name
ÙÙ+ /
,
ÙÙ/ 0
petDto
ÙÙ1 7
.
ÙÙ7 8
	Birthdate
ÙÙ8 A
,
ÙÙA B
petDto
ÙÙC I
.
ÙÙI J
Race
ÙÙJ N
,
ÙÙN O
petDto
ÙÙP V
.
ÙÙV W
Gender
ÙÙW ]
)
ÙÙ] ^
;
ÙÙ^ _
if
ıı 
(
ıı 
result
ıı 
.
ıı 
	IsFailure
ıı  
)
ıı  !
{
ˆˆ 
return
˜˜ 

BadRequest
˜˜ !
(
˜˜! "
result
˜˜" (
.
˜˜( )
Error
˜˜) .
)
˜˜. /
;
˜˜/ 0
}
¯¯ 

unitOfWork
˙˙ 
.
˙˙ 
PetRepository
˙˙ $
.
˙˙$ %
Update
˙˙% +
(
˙˙+ ,
pet
˙˙, /
)
˙˙/ 0
;
˙˙0 1

unitOfWork
˚˚ 
.
˚˚ 
SaveChanges
˚˚ "
(
˚˚" #
)
˚˚# $
;
˚˚$ %
return
˝˝ 
	NoContent
˝˝ 
(
˝˝ 
)
˝˝ 
;
˝˝ 
}
˛˛ 	
[
ÄÄ 	

HttpDelete
ÄÄ	 
(
ÄÄ 
$str
ÄÄ (
)
ÄÄ( )
]
ÄÄ) *
public
ÅÅ 
IActionResult
ÅÅ 
Delete
ÅÅ #
(
ÅÅ# $
Guid
ÅÅ$ (
vetClinicId
ÅÅ) 4
)
ÅÅ4 5
{
ÇÇ 	
var
ÉÉ 
	vetClinic
ÉÉ 
=
ÉÉ 

unitOfWork
ÉÉ &
.
ÉÉ& '!
VetClinicRepository
ÉÉ' :
.
ÉÉ: ;
Get
ÉÉ; >
(
ÉÉ> ?
vetClinicId
ÉÉ? J
)
ÉÉJ K
;
ÉÉK L
if
ÑÑ 
(
ÑÑ 
	vetClinic
ÑÑ 
==
ÑÑ 
null
ÑÑ !
)
ÑÑ! "
{
ÖÖ 
return
ÜÜ 
NotFound
ÜÜ 
(
ÜÜ  
)
ÜÜ  !
;
ÜÜ! "
}
áá 
var
ââ 
medicalHistorys
ââ 
=
ââ  !

unitOfWork
ââ" ,
.
ââ, -&
MedicalHistoryRepository
ââ- E
.
ââE F
All
ââF I
(
ââI J
)
ââJ K
.
ââK L
Where
ââL Q
(
ââQ R
m
ââR S
=>
ââT V
m
ââW X
.
ââX Y
ClinicId
ââY a
==
ââb d
vetClinicId
ââe p
)
ââp q
;
ââq r
if
ää 
(
ää 
medicalHistorys
ää 
!=
ää  "
null
ää# '
)
ää' (
{
ãã 
foreach
åå 
(
åå 
var
åå 
item
åå !
in
åå" $
medicalHistorys
åå% 4
)
åå4 5
{
çç 

unitOfWork
éé 
.
éé &
MedicalHistoryRepository
éé 7
.
éé7 8
Delete
éé8 >
(
éé> ?
item
éé? C
)
ééC D
;
ééD E
}
èè 
}
êê 
var
íí 
vets
íí 
=
íí 

unitOfWork
íí !
.
íí! "
VetRepository
íí" /
.
íí/ 0
All
íí0 3
(
íí3 4
)
íí4 5
.
íí5 6
Where
íí6 ;
(
íí; <
v
íí< =
=>
íí> @
v
ííA B
.
ííB C
ClinicId
ííC K
==
ííL N
vetClinicId
ííO Z
)
ííZ [
;
íí[ \
if
ìì 
(
ìì 
vets
ìì 
!=
ìì 
null
ìì 
)
ìì 
{
îî 
foreach
ïï 
(
ïï 
var
ïï 
item
ïï !
in
ïï" $
vets
ïï% )
)
ïï) *
{
ññ 

unitOfWork
óó 
.
óó 
VetRepository
óó ,
.
óó, -
Delete
óó- 3
(
óó3 4
item
óó4 8
)
óó8 9
;
óó9 :
}
òò 
}
ôô 
var
õõ 
pets
õõ 
=
õõ 

unitOfWork
õõ !
.
õõ! "
PetRepository
õõ" /
.
õõ/ 0
All
õõ0 3
(
õõ3 4
)
õõ4 5
.
õõ5 6
Where
õõ6 ;
(
õõ; <
p
õõ< =
=>
õõ> @
p
õõA B
.
õõB C
ClinicId
õõC K
==
õõL N
vetClinicId
õõO Z
)
õõZ [
;
õõ[ \
if
úú 
(
úú 
pets
úú 
!=
úú 
null
úú 
)
úú 
{
ùù 
foreach
ûû 
(
ûû 
var
ûû 
item
ûû !
in
ûû" $
pets
ûû% )
)
ûû) *
{
üü 

unitOfWork
†† 
.
†† 
PetRepository
†† ,
.
††, -
Delete
††- 3
(
††3 4
item
††4 8
)
††8 9
;
††9 :
}
°° 
}
¢¢ 

unitOfWork
§§ 
.
§§ !
VetClinicRepository
§§ *
.
§§* +
Delete
§§+ 1
(
§§1 2
	vetClinic
§§2 ;
)
§§; <
;
§§< =

unitOfWork
•• 
.
•• 
SaveChanges
•• "
(
••" #
)
••# $
;
••$ %
return
ßß 
	NoContent
ßß 
(
ßß 
)
ßß 
;
ßß 
}
®® 	
[
™™ 	

HttpDelete
™™	 
(
™™ 
$str
™™ 9
)
™™9 :
]
™™: ;
public
´´ 
IActionResult
´´ 
	DeleteVet
´´ &
(
´´& '
Guid
´´' +
vetClinicId
´´, 7
,
´´7 8
Guid
´´9 =
vetId
´´> C
)
´´C D
{
¨¨ 	
var
≠≠ 
clinic
≠≠ 
=
≠≠ 

unitOfWork
≠≠ #
.
≠≠# $!
VetClinicRepository
≠≠$ 7
.
≠≠7 8
Get
≠≠8 ;
(
≠≠; <
vetClinicId
≠≠< G
)
≠≠G H
;
≠≠H I
if
ÆÆ 
(
ÆÆ 
clinic
ÆÆ 
==
ÆÆ 
null
ÆÆ 
)
ÆÆ 
{
ØØ 
return
∞∞ 
NotFound
∞∞ 
(
∞∞  
)
∞∞  !
;
∞∞! "
}
±± 
var
≥≥ 
vet
≥≥ 
=
≥≥ 

unitOfWork
≥≥  
.
≥≥  !
VetRepository
≥≥! .
.
≥≥. /
Get
≥≥/ 2
(
≥≥2 3
vetId
≥≥3 8
)
≥≥8 9
;
≥≥9 :
if
¥¥ 
(
¥¥ 
vet
¥¥ 
==
¥¥ 
null
¥¥ 
)
¥¥ 
{
µµ 
return
∂∂ 
NotFound
∂∂ 
(
∂∂  
)
∂∂  !
;
∂∂! "
}
∑∑ 

unitOfWork
ππ 
.
ππ 
VetRepository
ππ $
.
ππ$ %
Delete
ππ% +
(
ππ+ ,
vet
ππ, /
)
ππ/ 0
;
ππ0 1

unitOfWork
∫∫ 
.
∫∫ 
SaveChanges
∫∫ "
(
∫∫" #
)
∫∫# $
;
∫∫$ %
return
ºº 
	NoContent
ºº 
(
ºº 
)
ºº 
;
ºº 
}
ΩΩ 	
[
øø 	

HttpDelete
øø	 
(
øø 
$str
øø 9
)
øø9 :
]
øø: ;
public
¿¿ 
IActionResult
¿¿ 
	DeletePet
¿¿ &
(
¿¿& '
Guid
¿¿' +
vetClinicId
¿¿, 7
,
¿¿7 8
Guid
¿¿9 =
petId
¿¿> C
)
¿¿C D
{
¡¡ 	
var
¬¬ 
clinic
¬¬ 
=
¬¬ 

unitOfWork
¬¬ #
.
¬¬# $!
VetClinicRepository
¬¬$ 7
.
¬¬7 8
Get
¬¬8 ;
(
¬¬; <
vetClinicId
¬¬< G
)
¬¬G H
;
¬¬H I
if
√√ 
(
√√ 
clinic
√√ 
==
√√ 
null
√√ 
)
√√ 
{
ƒƒ 
return
≈≈ 
NotFound
≈≈ 
(
≈≈  
)
≈≈  !
;
≈≈! "
}
∆∆ 
var
»» 
pet
»» 
=
»» 

unitOfWork
»»  
.
»»  !
PetRepository
»»! .
.
»». /
Get
»»/ 2
(
»»2 3
petId
»»3 8
)
»»8 9
;
»»9 :
if
…… 
(
…… 
pet
…… 
==
…… 
null
…… 
)
…… 
{
   
return
ÀÀ 
NotFound
ÀÀ 
(
ÀÀ  
)
ÀÀ  !
;
ÀÀ! "
}
ÃÃ 

unitOfWork
ŒŒ 
.
ŒŒ 
PetRepository
ŒŒ $
.
ŒŒ$ %
Delete
ŒŒ% +
(
ŒŒ+ ,
pet
ŒŒ, /
)
ŒŒ/ 0
;
ŒŒ0 1

unitOfWork
œœ 
.
œœ 
SaveChanges
œœ "
(
œœ" #
)
œœ# $
;
œœ$ %
return
—— 
	NoContent
—— 
(
—— 
)
—— 
;
—— 
}
““ 	
}
”” 
}‘‘ ©.
èD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Controllers\VetsController.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Features %
.% &
Vets& *
{ 
[		 
Route		 

(		
 
$str		  
)		  !
]		! "
[

 
ApiController

 
]

 
public 

class 
VetsController 
:  !
ControllerBase" 0
{ 
private 
readonly 
IRepository $
<$ %
Vet% (
>( )
vetRepository* 7
;7 8
public 
VetsController 
( 
IRepository )
<) *
Vet* -
>- .
vetRepository/ <
)< =
=>> @
thisA E
.E F
vetRepositoryF S
=T U
vetRepositoryV c
;c d
[ 	
HttpGet	 
] 
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
vets 
= 
vetRepository $
. 
All 
( 
) 
. 
Select 
( 
v 
=> 
new 
VetDto #
(# $
)$ %
{ 
Id 
= 
v 
. 
Id !
,! "
Name 
= 
v  
.  !
Name! %
,% &
Surname 
=  !
v" #
.# $
Surname$ +
,+ ,
	Birthdate !
=" #
v$ %
.% &
	Birthdate& /
./ 0
ToString0 8
(8 9
)9 :
,: ;
Gender 
=  
v! "
." #
Gender# )
.) *
ToString* 2
(2 3
)3 4
,4 5
Email 
= 
v  !
.! "
Email" '
,' (
Phone 
= 
v  !
.! "
Phone" '
,' (
Specialisation   &
=  ' (
v  ) *
.  * +
Specialisation  + 9
.  9 :
ToString  : B
(  B C
)  C D
}!! 
)"" 
;"" 
return$$ 
Ok$$ 
($$ 
vets$$ 
)$$ 
;$$ 
}%% 	
['' 	
HttpPost''	 
]'' 
public(( 
IActionResult(( 
Create(( #
(((# $
[(($ %
FromBody((% -
]((- .
CreateVetDto((/ ;
vetDto((< B
)((B C
{)) 	
var** 
vet** 
=** 
Vet** 
.** 
Create**  
(**  !
vetDto++ 
.++ 
Name++ 
,++  
vetDto,, 
.,, 
Surname,, "
,,," #
vetDto-- 
.-- 
	Birthdate-- $
,--$ %
vetDto.. 
... 
Gender.. !
,..! "
vetDto// 
.// 
Email//  
,//  !
vetDto00 
.00 
Phone00  
,00  !
vetDto11 
.11 
Specialisation11 )
)22 
;22 
if44 
(44 
vet44 
.44 
	IsFailure44 
)44 
{55 
return66 

BadRequest66 !
(66! "
vet66" %
.66% &
Error66& +
)66+ ,
;66, -
}77 
vetRepository99 
.99 
Add99 
(99 
vet99 !
.99! "
Entity99" (
)99( )
;99) *
vetRepository:: 
.:: 
SaveChanges:: %
(::% &
)::& '
;::' (
var<< 
fullVet<< 
=<< 
new<< 
VetDto<< $
(<<$ %
)<<% &
{== 
Id>> 
=>> 
vet>> 
.>> 
Entity>> 
.>>  
Id>>  "
,>>" #
ClinicId?? 
=?? 
vet?? 
.?? 
Entity?? %
.??% &
ClinicId??& .
,??. /
Name@@ 
=@@ 
vet@@ 
.@@ 
Entity@@ !
.@@! "
Name@@" &
,@@& '
SurnameAA 
=AA 
vetAA 
.AA 
EntityAA $
.AA$ %
SurnameAA% ,
,AA, -
	BirthdateBB 
=BB 
vetBB 
.BB  
EntityBB  &
.BB& '
	BirthdateBB' 0
.BB0 1
ToStringBB1 9
(BB9 :
)BB: ;
,BB; <
GenderCC 
=CC 
vetCC 
.CC 
EntityCC #
.CC# $
GenderCC$ *
.CC* +
ToStringCC+ 3
(CC3 4
)CC4 5
,CC5 6
EmailDD 
=DD 
vetDD 
.DD 
EntityDD "
.DD" #
EmailDD# (
,DD( )
PhoneEE 
=EE 
vetEE 
.EE 
EntityEE "
.EE" #
PhoneEE# (
,EE( )
SpecialisationFF 
=FF  
vetFF! $
.FF$ %
EntityFF% +
.FF+ ,
SpecialisationFF, :
.FF: ;
ToStringFF; C
(FFC D
)FFD E
}GG 
;GG 
returnII 
CreatedII 
(II 
nameofII !
(II! "
GetII" %
)II% &
,II& '
fullVetII( /
)II/ 0
;II0 1
}JJ 	
}KK 
}LL Ω
àD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\AppointmentDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
AppointmentDto 
:  ! 
CreateAppointmentDto" 6
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
} 
}		 Á

ïD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateAppointmentDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class  
CreateAppointmentDto %
{ 
public 
string 
ScheduledDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int &
EstimatedDurationInMinutes -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public		 
Guid		 
VetId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public 
Guid 
PetId 
{ 
get 
;  
set! $
;$ %
}& '
public 
Guid 
TreatmentId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Guid 
MedicalHistoryId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} Ò
éD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateDrugDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreateDrugDto 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
double 
Quantity 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
	UnitPrice 
{  !
get" %
;% &
set' *
;* +
}, -
}		 
}

 Ö
çD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreatePetDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreatePetDto 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	Birthdate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Race 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Gender		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} ﬂ
íD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreatePetOwnerDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreatePetOwnerDto "
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	Birthdate 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string		 
Gender		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
string

 
Address

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Ö
òD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreatePrescribedDrugDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class #
CreatePrescribedDrugDto (
{ 
public 
double 
Quantity 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
	TotalCost 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Guid 
DrugId 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 …
ìD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateTreatmentDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreateTreatmentDto #
{ 
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} º	
ìD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateVetClinicDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreateVetClinicDto #
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
NumberOfPlaces !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
string		 
ContactEmail		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
string

 
ContactPhone

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
} 
} ‹
çD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\Create\CreateVetDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
.! "
Create" (
{ 
public 

class 
CreateVetDto 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	Birthdate 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string		 
Gender		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Specialisation $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ®
ÅD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\DrugDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
DrugDto 
: 
CreateDrugDto (
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
}		 
}

 ¨
ãD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\MedicalHistoryDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
MedicalHistoryDto "
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
Guid 
ClinicId 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} •
ÄD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\PetDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
PetDto 
: 
CreatePetDto &
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
} 
}		 ¥
ÖD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\PetOwnerDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
PetOwnerDto 
: 
CreatePetOwnerDto 0
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
} 
}		 ∆
ãD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\PrescribedDrugDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
PrescribedDrugDto "
:# $#
CreatePrescribedDrugDto% <
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
} 
}		 ∑
ÜD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\TreatmentDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
TreatmentDto 
: 
CreateTreatmentDto  2
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
} 
}		 ˇ
ÜD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\VetClinicDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
VetClinicDto 
: 
CreateVetClinicDto  2
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
Guid 
MedicalHistoryId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
DateTime		 
RegistrationDate		 (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
}

 
} ø
ÄD:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Dtos\VetDto.cs
	namespace 	
VetAppointment
 
. 
API 
. 
Dtos !
{ 
public 

class 
VetDto 
: 
CreateVetDto &
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
Guid		 
ClinicId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} «,
|D:\Documents\GitHub\VetAppointment_.NET\VetAppointment - APIs + Tests\VetAppointment - Working\VetAppointment.API\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddDbContext 
< 
DatabaseContext -
>- .
(. /
options 
=>	 
options 
. 
	UseSqlite 
( 
$str C
)C D
)D E
;E F
builder 
. 
Services 
. 
AddTransient 
< 
IUnitOfWork )
,) *

UnitOfWork+ 5
>5 6
(6 7
)7 8
;8 9
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
Appointment' 2
>2 3
,3 4!
AppointmentRepository5 J
>J K
(K L
)L M
;M N
builder 
. 
Services 
. 
	AddScoped 
< 
IRepository &
<& '
PetOwner' /
>/ 0
,0 1
PetOwnerRepository2 D
>D E
(E F
)F G
;G H
builder   
.   
Services   
.   
	AddScoped   
<   
IRepository   &
<  & '
Pet  ' *
>  * +
,  + ,
PetRepository  - :
>  : ;
(  ; <
)  < =
;  = >
builder!! 
.!! 
Services!! 
.!! 
	AddScoped!! 
<!! 
IRepository!! &
<!!& '
	VetClinic!!' 0
>!!0 1
,!!1 2
VetClinicRepository!!3 F
>!!F G
(!!G H
)!!H I
;!!I J
builder"" 
."" 
Services"" 
."" 
	AddScoped"" 
<"" 
IRepository"" &
<""& '
Vet""' *
>""* +
,""+ ,
VetRepository""- :
>"": ;
(""; <
)""< =
;""= >
builder## 
.## 
Services## 
.## 
	AddScoped## 
<## 
IRepository## &
<##& '
Drug##' +
>##+ ,
,##, -
DrugRepository##. <
>##< =
(##= >
)##> ?
;##? @
builder$$ 
.$$ 
Services$$ 
.$$ 
	AddScoped$$ 
<$$ 
IRepository$$ &
<$$& '
MedicalHistory$$' 5
>$$5 6
,$$6 7$
MedicalHistoryRepository$$8 P
>$$P Q
($$Q R
)$$R S
;$$S T
builder%% 
.%% 
Services%% 
.%% 
	AddScoped%% 
<%% 
IRepository%% &
<%%& '
PrescribedDrug%%' 5
>%%5 6
,%%6 7$
PrescribedDrugRepository%%8 P
>%%P Q
(%%Q R
)%%R S
;%%S T
builder&& 
.&& 
Services&& 
.&& 
	AddScoped&& 
<&& 
IRepository&& &
<&&& '
	Treatment&&' 0
>&&0 1
,&&1 2
TreatmentRepository&&3 F
>&&F G
(&&G H
)&&H I
;&&I J
builder(( 
.(( 
Services(( 
.(( 
AddCors(( 
((( 
options((  
=>((! #
{)) 
options** 
.** 	
	AddPolicy**	 
(** 
$str**  
,**  !
policy**" (
=>**) +
{++ 
policy,, 
.,, 	
AllowAnyOrigin,,	 
(,, 
),, 
.,, 
AllowAnyHeader,, (
(,,( )
),,) *
.,,* +
AllowAnyMethod,,+ 9
(,,9 :
),,: ;
;,,; <
}-- 
)-- 
;-- 
}.. 
).. 
;.. 
var// 
app// 
=// 	
builder//
 
.// 
Build// 
(// 
)// 
;// 
if22 
(22 
app22 
.22 
Environment22 
.22 
IsDevelopment22 !
(22! "
)22" #
)22# $
{33 
app44 
.44 

UseSwagger44 
(44 
)44 
;44 
app55 
.55 
UseSwaggerUI55 
(55 
)55 
;55 
}66 
app88 
.88 
UseHttpsRedirection88 
(88 
)88 
;88 
app99 
.99 
UseCors99 
(99 
$str99 
)99 
;99 
app;; 
.;; 
UseAuthorization;; 
(;; 
);; 
;;; 
app== 
.== 
MapControllers== 
(== 
)== 
;== 
app?? 
.?? 
Run?? 
(?? 
)?? 	
;??	 
